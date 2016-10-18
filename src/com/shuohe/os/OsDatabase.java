package com.shuohe.os;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.database.DBhelper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class OsDatabase {
	
	
	public static String get()
	{
	    String sql = null;  
	    DBhelper db1 = null;  
	    ResultSet ret = null;  
		sql = "select * from hardware_monitor";//SQL语句  
        db1 = new DBhelper(sql);//创建DBHelper对象  
        try {  
            ret = db1.pst.executeQuery();//执行语句，得到结果集  
            OsParams osParams = new OsParams();
            while (ret.next()) {  
            	
            	osParams.setCpu_utilization(Float.parseFloat(ret.getString(2)));
            	osParams.setMemory_utilization(Float.parseFloat(ret.getString(3)));
            	osParams.setDate(ret.getString(4));
            }//显示数据  
            String jsonString = toJsonByPretty(osParams);
            //System.out.println(jsonString);
            ret.close();  
            db1.close();//关闭连接  
            return jsonString;
        } catch (SQLException e) {  
            e.printStackTrace();  
            return null;
        }  
	}
	
	
	public static String getHistoryList()
	{
	    String sql = null;  
	    DBhelper db1 = null;  
	    ResultSet ret = null;  
		sql = "SELECT * FROM hardware_monitor_history ORDER BY id DESC LIMIT 60";//SQL语句  
        db1 = new DBhelper(sql);//创建DBHelper对象  
        try {  
            ret = db1.pst.executeQuery();//执行语句，得到结果集  
            ArrayList<OsParams> osParamsList = new ArrayList<OsParams>();
            
            while (ret.next()) {  
            	OsParams osParams = new OsParams();
            	osParams.setCpu_utilization(Float.parseFloat(ret.getString(2)));
            	osParams.setMemory_utilization(Float.parseFloat(ret.getString(3)));
            	osParams.setDate(ret.getString(4));
            	osParamsList.add(osParams);
            }//显示数据  
            String jsonString = toJsonByPretty(osParamsList);
            //System.out.println(jsonString);
            ret.close();  
            db1.close();//关闭连接  
            return jsonString;
        } catch (SQLException e) {  
            e.printStackTrace();  
            return null;
        }  
	}
	
	
	/**
	 * 转换为带格式化输出的Json字符串
	 * @author    秦晓宇
	 * @date      2016年4月13日 下午5:01:55 
	 * @param object
	 * @return
	 */
	private static String toJsonByPretty(Object object)
	{
		Gson gson = new GsonBuilder()  
		//.excludeFieldsWithoutExposeAnnotation() 						//不导出实体中没有用@Expose注解的属性  
		.enableComplexMapKeySerialization() 							//支持Map的key为复杂对象的形式  
		.serializeNulls().setDateFormat("yyyy-MM-dd HH:mm:ss")		//时间转化为特定格式    
		//.setFieldNamingPolicy(FieldNamingPolicy.UPPER_CAMEL_CASE)		//会把字段首字母大写,注:对于实体上使用了@SerializedName注解的不会生效.  
		.setPrettyPrinting() 											//对json结果格式化.  
		//.setVersion(1.0)    											//有的字段不是一开始就有的,会随着版本的升级添加进来,那么在进行序列化和返序列化的时候就会根据版本号来选择是否要序列化.  
																		//@Since(版本号)能完美地实现这个功能.还的字段可能,随着版本的升级而删除,那么  
																		//@Until(版本号)也能实现这个功能,GsonBuilder.setVersion(double)方法需要调用.  
		.create();  
		String str = gson.toJson(object);
		return str;
	}
}

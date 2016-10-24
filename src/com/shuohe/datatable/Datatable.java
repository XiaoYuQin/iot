package com.shuohe.datatable;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import com.database.DBhelper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class Datatable {

	static String tableName = "datatablesList";
	
	public static String creatNewDatabase(String name,String status,String info,String user)
	{
		String sql = null;  
	    DBhelper db1 = null;  
	    
	    if(rechecking(name))
	    	return "{\"result\":false,\"info\":\"表名重复\"}";
	    	    
		sql = "insert into "+tableName+" values(0"+","
				+"'"+name+"'"+","
				+"'"+status+"'"+","
				+"'"+info+"'"+","
				+"'"+getSystemDateToString()+"'"+","
				+"'"+user+"'"+")";
		
		 System.out.println(sql);
        db1 = new DBhelper(sql);//创建DBHelper对象  
        try {  
            boolean ret = db1.pst.execute();//执行语句，得到结果集         
            db1.close();//关闭连接        
            return "{\"result\":true,\"info\":\"创建成功\"}";
        } catch (SQLException e) {  
            e.printStackTrace();  
            return "{\"result\":false,\"info\":\"数据库错误\"}";
        }  
		
	}
	/**
	 * 检测数据库中是否已经有相同名称的数据表
	 * @param name
	 * @return true，已经有；false,不含有有 
	 */
	private static boolean rechecking(String name)
	{
	    String sql = null;  
	    DBhelper db1 = null;  
	    ResultSet ret = null;  
		sql = "select * from "+tableName+";";//SQL语句  
        db1 = new DBhelper(sql);//创建DBHelper对象  
        try {  
            ret = db1.pst.executeQuery();//执行语句，得到结果集  
            while (ret.next()) {  
                String ufname = ret.getString(2);  
                if(ufname.equals(name))
                	return true;
            }//显示数据  
            ret.close();  
            db1.close();//关闭连接  
            return false;
        } catch (SQLException e) {  
            e.printStackTrace();  
            return false;
        }  
	}
	/**
	 * 获得系统时间
	 * @author    秦晓宇
	 * @date      2016年9月6日 下午4:43:23 
	 * @return
	 */
	private static String getSystemDateToString()
	{
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String date = simpleDateFormat.format(new java.util.Date());
		return date;
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
		.serializeNulls().setDateFormat("yyyy-MM-dd HH:mm:ss:SSS")		//时间转化为特定格式    
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

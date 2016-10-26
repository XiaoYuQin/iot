package com.shuohe.datatable;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.database.DBhelper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class Datatable {

	static String tableName = "datatablesList";
	
	/**
	 * 返回所有用户的实体类
	 * @return
	 */
	public static ArrayList<DatatableStruct> getAllDatatables()
	{
	    String sql = null;  
	    DBhelper db1 = null;  
	    ResultSet ret = null;  
		sql = "select * from "+tableName+"";//SQL语句  
        db1 = new DBhelper(sql);//创建DBHelper对象  
        try {  
            ret = db1.pst.executeQuery();//执行语句，得到结果集  
            
            ArrayList<DatatableStruct> datatableStructs = new ArrayList<DatatableStruct>();
            
            while (ret.next()) {  
//            	public DatatableStruct(String name,String createDate,String createUser,String status,String info)
            	DatatableStruct datatableStruct = new DatatableStruct(
            			ret.getString(2),	//name
            			ret.getString(3),	//password            			
            			ret.getString(4),	//mail
            			ret.getString(5),	//signUpDate
            			ret.getString(6) 	//status
            		);
            	datatableStructs.add(datatableStruct);
            }//显示数据  
            
            //System.out.println(jsonString);
            ret.close();  
            db1.close();//关闭连接  
            return datatableStructs;
        } catch (SQLException e) {  
            e.printStackTrace();  
            return null;
        }  
	}
	
	

	
	public static String creatNewDatabase(String name,String status,String info,String user)
	{
		String sql = null;  
		DBhelper db1 = null;  
		
		if(rechecking(name))
			return "{\"result\":false,\"info\":\"表名重复\"}";
		
		if(!creatDatatableDatabase(name))
		{
			return "{\"result\":false,\"info\":\"创建数据表失败\"}";
		}
			    				
		sql = "insert into "+tableName+" values(0"+","
			+"'"+name+"'"+","
			+"'"+status+"'"+","
			+"'"+info+"'"+","
			+"'"+getSystemDateToString()+"'"+","
			+"'"+user+"'"+")";
		
		System.out.println(sql);		 
		db1 = new DBhelper(sql);//创建DBHelper对象  		 	
		 
		try {  
			db1.pst.execute();
			db1.close();//关闭连接        
			return "{\"result\":true,\"info\":\"创建成功\"}";
		} catch (SQLException e) {  
			e.printStackTrace();  
			return "{\"result\":false,\"info\":\"数据库错误\"}";
		}  		
	}

	public static boolean creatDatatableDatabase(String tableName)
	{
		String sql = null;  
		DBhelper db1 = null;  
					    			
//		sql = "create database "+tableName;
		sql = "CREATE TABLE "+tableName+"(id int NOT NULL auto_increment,PRIMARY KEY (id))";
//		CREATE TABLE admin(id int(4) NOT NULL auto_increment,PRIMARY KEY (id))
		
		System.out.println(sql);		 
		db1 = new DBhelper(sql);//创建DBHelper对象  		 
		 
		try {  
			db1.pst.execute();
			db1.close();//关闭连接        
			return true;
		} catch (SQLException e) {  
			e.printStackTrace();  
			return false;
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
	 * 根据数据表的名称获得数据表中的键名组成的Json字符串
	 * @return
	 */
	public static String getFiledByTableName(String tableName)
	{

	 	String sql = null;  
	    DBhelper db1 = null;  
	    ResultSet ret = null;  
	    sql = "show full columns from "+tableName;
        db1 = new DBhelper(sql);//创建DBHelper对象  
        try {  
            ret = db1.pst.executeQuery();//执行语句，得到结果集  
            
            ArrayList<DatabaseStruct> datatableStructs = new ArrayList<DatabaseStruct>();
            
            while (ret.next()) {  
//	            	public DatatableStruct(String name,String createDate,String createUser,String status,String info)
            	DatabaseStruct databaseStruct = new DatabaseStruct(
            			ret.getString(1),	//name
            			ret.getString(2),	//password            			
            			ret.getString(3),	//mail
            			ret.getString(4),	//signUpDate
            			ret.getString(5), 	//status
            			ret.getString(6),	//password            			
            			ret.getString(7),	//mail
            			ret.getString(8),	//signUpDate
            			ret.getString(9) 	//status
            		);
            	datatableStructs.add(databaseStruct);
            }//显示数据  
            
            //System.out.println(jsonString);
            ret.close();  
            db1.close();//关闭连接  
            return toJsonByPretty(datatableStructs);
        } catch (SQLException e) {  
            e.printStackTrace();  
            return null;
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

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
	 * ���������û���ʵ����
	 * @return
	 */
	public static ArrayList<DatatableStruct> getAllDatatables()
	{
	    String sql = null;  
	    DBhelper db1 = null;  
	    ResultSet ret = null;  
		sql = "select * from "+tableName+"";//SQL���  
        db1 = new DBhelper(sql);//����DBHelper����  
        try {  
            ret = db1.pst.executeQuery();//ִ����䣬�õ������  
            
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
            }//��ʾ����  
            
            //System.out.println(jsonString);
            ret.close();  
            db1.close();//�ر�����  
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
			return "{\"result\":false,\"info\":\"�����ظ�\"}";
		
		if(!creatDatatableDatabase(name))
		{
			return "{\"result\":false,\"info\":\"�������ݱ�ʧ��\"}";
		}
			    				
		sql = "insert into "+tableName+" values(0"+","
			+"'"+name+"'"+","
			+"'"+status+"'"+","
			+"'"+info+"'"+","
			+"'"+getSystemDateToString()+"'"+","
			+"'"+user+"'"+")";
		
		System.out.println(sql);		 
		db1 = new DBhelper(sql);//����DBHelper����  		 	
		 
		try {  
			db1.pst.execute();
			db1.close();//�ر�����        
			return "{\"result\":true,\"info\":\"�����ɹ�\"}";
		} catch (SQLException e) {  
			e.printStackTrace();  
			return "{\"result\":false,\"info\":\"���ݿ����\"}";
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
		db1 = new DBhelper(sql);//����DBHelper����  		 
		 
		try {  
			db1.pst.execute();
			db1.close();//�ر�����        
			return true;
		} catch (SQLException e) {  
			e.printStackTrace();  
			return false;
		}  
	}
	
	/**
	 * ������ݿ����Ƿ��Ѿ�����ͬ���Ƶ����ݱ�
	 * @param name
	 * @return true���Ѿ��У�false,�������� 
	 */
	private static boolean rechecking(String name)
	{
	    String sql = null;  
	    DBhelper db1 = null;  
	    ResultSet ret = null;  
		sql = "select * from "+tableName+";";//SQL���  
        db1 = new DBhelper(sql);//����DBHelper����  
        try {  
            ret = db1.pst.executeQuery();//ִ����䣬�õ������  
            while (ret.next()) {  
                String ufname = ret.getString(2);  
                if(ufname.equals(name))
                	return true;
            }//��ʾ����  
            ret.close();  
            db1.close();//�ر�����  
            return false;
        } catch (SQLException e) {  
            e.printStackTrace();  
            return false;
        }  
	}
	
	/**
	 * �������ݱ�����ƻ�����ݱ��еļ�����ɵ�Json�ַ���
	 * @return
	 */
	public static String getFiledByTableName(String tableName)
	{

	 	String sql = null;  
	    DBhelper db1 = null;  
	    ResultSet ret = null;  
	    sql = "show full columns from "+tableName;
        db1 = new DBhelper(sql);//����DBHelper����  
        try {  
            ret = db1.pst.executeQuery();//ִ����䣬�õ������  
            
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
            }//��ʾ����  
            
            //System.out.println(jsonString);
            ret.close();  
            db1.close();//�ر�����  
            return toJsonByPretty(datatableStructs);
        } catch (SQLException e) {  
            e.printStackTrace();  
            return null;
        }  
		
	}
	
	
	
	
	/**
	 * ���ϵͳʱ��
	 * @author    ������
	 * @date      2016��9��6�� ����4:43:23 
	 * @return
	 */
	private static String getSystemDateToString()
	{
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String date = simpleDateFormat.format(new java.util.Date());
		return date;
	}
	/**
	 * ת��Ϊ����ʽ�������Json�ַ���
	 * @author    ������
	 * @date      2016��4��13�� ����5:01:55 
	 * @param object
	 * @return
	 */
	private static String toJsonByPretty(Object object)
	{
		Gson gson = new GsonBuilder()  
		//.excludeFieldsWithoutExposeAnnotation() 						//������ʵ����û����@Exposeע�������  
		.enableComplexMapKeySerialization() 							//֧��Map��keyΪ���Ӷ������ʽ  
		.serializeNulls().setDateFormat("yyyy-MM-dd HH:mm:ss:SSS")		//ʱ��ת��Ϊ�ض���ʽ    
		//.setFieldNamingPolicy(FieldNamingPolicy.UPPER_CAMEL_CASE)		//����ֶ�����ĸ��д,ע:����ʵ����ʹ����@SerializedNameע��Ĳ�����Ч.  
		.setPrettyPrinting() 											//��json�����ʽ��.  
		//.setVersion(1.0)    											//�е��ֶβ���һ��ʼ���е�,�����Ű汾��������ӽ���,��ô�ڽ������л��ͷ����л���ʱ��ͻ���ݰ汾����ѡ���Ƿ�Ҫ���л�.  
																		//@Since(�汾��)��������ʵ���������.�����ֶο���,���Ű汾��������ɾ��,��ô  
																		//@Until(�汾��)Ҳ��ʵ���������,GsonBuilder.setVersion(double)������Ҫ����.  
		.create();  
		String str = gson.toJson(object);
		return str;
	}
}

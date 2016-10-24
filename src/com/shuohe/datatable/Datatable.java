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
	    	return "{\"result\":false,\"info\":\"�����ظ�\"}";
	    	    
		sql = "insert into "+tableName+" values(0"+","
				+"'"+name+"'"+","
				+"'"+status+"'"+","
				+"'"+info+"'"+","
				+"'"+getSystemDateToString()+"'"+","
				+"'"+user+"'"+")";
		
		 System.out.println(sql);
        db1 = new DBhelper(sql);//����DBHelper����  
        try {  
            boolean ret = db1.pst.execute();//ִ����䣬�õ������         
            db1.close();//�ر�����        
            return "{\"result\":true,\"info\":\"�����ɹ�\"}";
        } catch (SQLException e) {  
            e.printStackTrace();  
            return "{\"result\":false,\"info\":\"���ݿ����\"}";
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

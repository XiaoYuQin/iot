package com.shuohe.userManage;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.database.DBhelper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class UserManager {

	public static String getAllUserForJson()
	{
	    String sql = null;  
	    DBhelper db1 = null;  
	    ResultSet ret = null;  
		sql = "select * from login";//SQL���  
        db1 = new DBhelper(sql);//����DBHelper����  
        try {  
            ret = db1.pst.executeQuery();//ִ����䣬�õ������  
            
            ArrayList<User> users = new ArrayList<User>();
            
            while (ret.next()) {  
            	User user = new User(
            			ret.getString(2),	//name
            			ret.getString(3),	//password            			
            			ret.getString(5),	//mail
            			ret.getString(4),	//signUpDate
            			Integer.parseInt(ret.getString(6)) 	//status
            		);
            	users.add(user);
            }//��ʾ����  
            String jsonString = toJsonByPretty(users);
            //System.out.println(jsonString);
            ret.close();  
            db1.close();//�ر�����  
            return jsonString;
        } catch (SQLException e) {  
            e.printStackTrace();  
            return null;
        }  
	}

	/**
	 * ���������û���ʵ����
	 * @return
	 */
	public static ArrayList<User> getAllUsers()
	{
	    String sql = null;  
	    DBhelper db1 = null;  
	    ResultSet ret = null;  
		sql = "select * from login";//SQL���  
        db1 = new DBhelper(sql);//����DBHelper����  
        try {  
            ret = db1.pst.executeQuery();//ִ����䣬�õ������  
            
            ArrayList<User> users = new ArrayList<User>();
            
            while (ret.next()) {  
            	User user = new User(
            			ret.getString(2),	//name
            			ret.getString(3),	//password            			
            			ret.getString(5),	//mail
            			ret.getString(4),	//signUpDate
            			Integer.parseInt(ret.getString(6)) 	//status
            		);
            	users.add(user);
            }//��ʾ����  
            
            //System.out.println(jsonString);
            ret.close();  
            db1.close();//�ر�����  
            return users;
        } catch (SQLException e) {  
            e.printStackTrace();  
            return null;
        }  
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

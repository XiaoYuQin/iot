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
		sql = "select * from hardware_monitor";//SQL���  
        db1 = new DBhelper(sql);//����DBHelper����  
        try {  
            ret = db1.pst.executeQuery();//ִ����䣬�õ������  
            OsParams osParams = new OsParams();
            while (ret.next()) {  
            	
            	osParams.setCpu_utilization(Float.parseFloat(ret.getString(2)));
            	osParams.setMemory_utilization(Float.parseFloat(ret.getString(3)));
            	osParams.setDate(ret.getString(4));
            }//��ʾ����  
            String jsonString = toJsonByPretty(osParams);
            //System.out.println(jsonString);
            ret.close();  
            db1.close();//�ر�����  
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
		sql = "SELECT * FROM hardware_monitor_history ORDER BY id DESC LIMIT 60";//SQL���  
        db1 = new DBhelper(sql);//����DBHelper����  
        try {  
            ret = db1.pst.executeQuery();//ִ����䣬�õ������  
            ArrayList<OsParams> osParamsList = new ArrayList<OsParams>();
            
            while (ret.next()) {  
            	OsParams osParams = new OsParams();
            	osParams.setCpu_utilization(Float.parseFloat(ret.getString(2)));
            	osParams.setMemory_utilization(Float.parseFloat(ret.getString(3)));
            	osParams.setDate(ret.getString(4));
            	osParamsList.add(osParams);
            }//��ʾ����  
            String jsonString = toJsonByPretty(osParamsList);
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
		.serializeNulls().setDateFormat("yyyy-MM-dd HH:mm:ss")		//ʱ��ת��Ϊ�ض���ʽ    
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

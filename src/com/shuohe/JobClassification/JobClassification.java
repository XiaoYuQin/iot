package com.shuohe.JobClassification;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.database.DBhelper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class JobClassification {
	
	
	public static String getAllJobsByString()
	{
	    String sql = null;  
	    DBhelper db1 = null;  
	    ResultSet ret = null;  
		sql = "select * from job_classification";//SQL���  
        db1 = new DBhelper(sql);//����DBHelper����  
        try {  
            ret = db1.pst.executeQuery();//ִ����䣬�õ������  
            
            ArrayList<Job> jobs = new ArrayList<Job>();
            
            while (ret.next()) {  
            	Job job = new Job(
            			Integer.parseInt(ret.getString(1)) , //CarBatchName
            			ret.getString(2), //CarId
            			ret.getString(3) //CarTypeName
            		);
            	jobs.add(job);
            }//��ʾ����  
            String jsonString = toJsonByPretty(jobs);
            //System.out.println(jsonString);
            ret.close();  
            db1.close();//�ر�����  
            return jsonString;
        } catch (SQLException e) {  
            e.printStackTrace();  
            return null;
        }  
	}
	public static ArrayList<Job> getAllJobs()
	{
	    String sql = null;  
	    DBhelper db1 = null;  
	    ResultSet ret = null;  
		sql = "select * from job_classification";//SQL���  
        db1 = new DBhelper(sql);//����DBHelper����  
        try {  
            ret = db1.pst.executeQuery();//ִ����䣬�õ������  
            
            ArrayList<Job> jobs = new ArrayList<Job>();
            
            while (ret.next()) {  
            	Job job = new Job(
            			Integer.parseInt(ret.getString(1)) , //CarBatchName
            			ret.getString(2), //CarId
            			ret.getString(3) //CarTypeName
            		);
            	jobs.add(job);
            }//��ʾ����  
            //System.out.println(jsonString);
            ret.close();  
            db1.close();//�ر�����  
            return jobs;
        } catch (SQLException e) {  
            e.printStackTrace();  
            return null;
        }  
	}
	
	public static String creatNewPostaion(String department_name,String position_name,String people)
	{
		String sql = null;  
		DBhelper db1 = null;  
		
//		if(rechecking(name))
//			return "{\"result\":false,\"info\":\"�����ظ�\"}";
		
//		if(!creatDatatableDatabase(name))
//		{
//			return "{\"result\":false,\"info\":\"�������ݱ�ʧ��\"}";
//		}
			    				
		sql = "insert into "+"job_classification"+" values(0"+","
			+"'"+department_name+"'"+","
			+"'"+position_name+"'"+","
			+"'"+people+"'"+","
			+"'"+getSystemDateToString()+"'"
			+")";
		
		System.out.println(sql);		 
		db1 = new DBhelper(sql);//����DBHelper����  		 	
		 
		try {  
			db1.pst.execute();
			db1.close();//�ر�����        
			return "{\"result\":true,\"info\":\"�����ɹ�\"}";
		} catch (SQLException e) {  
			e.printStackTrace();  
			return "{\"result\":false,\"info\":\"����ʧ��\"}";
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

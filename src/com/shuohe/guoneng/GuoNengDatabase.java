package com.shuohe.guoneng;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.database.DBhelper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class GuoNengDatabase {

	public static String get()
	{
	    String sql = null;  
	    DBhelper db1 = null;  
	    ResultSet ret = null;  
		sql = "select * from shaolinbusrealtime";//SQL���  
        db1 = new DBhelper(sql);//����DBHelper����  
        try {  
            ret = db1.pst.executeQuery();//ִ����䣬�õ������  
            
            ArrayList<ShaolinBus> shaolinbusList = new ArrayList<ShaolinBus>();
            
            while (ret.next()) {  
            	ShaolinBus bus = new ShaolinBus(
            			ret.getString(2), //carid
            			Float.parseFloat(ret.getString(3)), //gpsSignal
            			Float.parseFloat(ret.getString(4)), //soc
						Float.parseFloat(ret.getString(5)), //batteryVoltage
						Float.parseFloat(ret.getString(6)), //batteryCurrent
            			Double.parseDouble(ret.getString(7)), //gpsLongitude
            			Double.parseDouble(ret.getString(8))  //gpsLatitude
            		);
            	shaolinbusList.add(bus);
            }//��ʾ����  
            String jsonString = toJsonByPretty(shaolinbusList);
            //System.out.println(jsonString);
            ret.close();  
            db1.close();//�ر�����  
            return jsonString;
        } catch (SQLException e) {  
            e.printStackTrace();  
            return null;
        }  
	}
	public static String getShaolinBusInfo()
	{
	    String sql = null;  
	    DBhelper db1 = null;  
	    ResultSet ret = null;  
		sql = "select * from shaolincarlist";//SQL���  
        db1 = new DBhelper(sql);//����DBHelper����  
        try {  
            ret = db1.pst.executeQuery();//ִ����䣬�õ������  
            
            ArrayList<ShaolinBusInfo> shaolinbusList = new ArrayList<ShaolinBusInfo>();
            
            while (ret.next()) {  
            	ShaolinBusInfo bus = new ShaolinBusInfo(
            			ret.getString(2), //CarBatchName
            			ret.getString(3), //CarId
            			ret.getString(4), //CarTypeName
            			ret.getString(5), //CompanyName
            			ret.getString(6), //LicensePlate
            			ret.getString(7), //TerminalCode
            			ret.getString(8), //UserRegionName
            			ret.getString(9) //VinNo
            		);
            	shaolinbusList.add(bus);
            }//��ʾ����  
            String jsonString = toJsonByPretty(shaolinbusList);
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
	 * @param carId
	 * @param lineNumber ���������
	 * @return
	 */
	public static String getShaolinBusBatteryHistoryForLast(String carId,String lineNumber)
	{
	    String sql = null;  
	    DBhelper db1 = null;  
	    ResultSet ret = null;  
		sql = "SELECT * FROM shaolincarparamspider WHERE carID="+carId+" ORDER BY id DESC LIMIT "+lineNumber;//SQL���  			
		
        db1 = new DBhelper(sql);//����DBHelper����  
        try {  
            ret = db1.pst.executeQuery();//ִ����䣬�õ������  
            
            ArrayList<ShaoLinBusBattery> shaolinbusList = new ArrayList<ShaoLinBusBattery>();
            
            while (ret.next()) {  
            	ShaoLinBusBattery bus = new ShaoLinBusBattery(
            			Integer.parseInt(ret.getString(3)), //gpsSignal
            			Float.parseFloat(ret.getString(4)), //soc
            			Float.parseFloat(ret.getString(5)), //batteryVoltage
            			Float.parseFloat(ret.getString(6)), //batteryCurrent
            			ret.getString(9)
            		);
            	shaolinbusList.add(bus);
            }//��ʾ����  
            String jsonString = toJsonByPretty(shaolinbusList);
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

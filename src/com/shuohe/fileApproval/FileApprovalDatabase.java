package com.shuohe.fileApproval;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.database.DBhelper;
import com.shuohe.util.Json;
import com.shuohe.util.SystemDate;

public class FileApprovalDatabase {
	

	public static String creatFileApprovalApplication(String sponsor,String leader,String describe,String file)
	{
		String sql = null;  
		DBhelper db1 = null;  
		String date = SystemDate.getSystemDateToString();
		sql = "insert into "+"file_approval_application"+" values(0"+","
			+"'"+"0"+"'"+","
			+"'"+sponsor+"'"+","
			+"'"+leader+"'"+","
			+"'"+describe+"'"+","
			+"'"+file+"'"+","
			+"'"+date+"'"+","
			+"'"+"0"+"'"
			+")";
		
		System.out.println(sql);		 
		db1 = new DBhelper(sql);//����DBHelper����  		 	
		 
		try {  
			db1.pst.execute();
			int id = 0;
			ResultSet rs = db1.pst.getGeneratedKeys();   
            if (rs.next()) {  
                id = rs.getInt(1);
                System.out.println("����������" + id);   
            }  
            insertApprovalDetalForNewApproval(id,sponsor,leader,describe,file,date);
            
			db1.close();//�ر�����        
			return "{\"result\":true,\"info\":\"�����ɹ�\"}";
		} catch (SQLException e) {  
			e.printStackTrace();  
			return "{\"result\":false,\"info\":\"����ʧ��\"}";
		}  		
	}
	public static ArrayList<FileApproval> getAllFileApprovalBySponsor(String user)
	{
	    String sql = null;  
	    DBhelper db1 = null;  
	    ResultSet ret = null;  
		sql = "select * from file_approval_application where sponsor=\""+user+"\"";//SQL���  
        db1 = new DBhelper(sql);//����DBHelper����  
        try {  
            ret = db1.pst.executeQuery();//ִ����䣬�õ������  
            
            ArrayList<FileApproval> fileApprovals = new ArrayList<FileApproval>();
            
            while (ret.next()) {  
            	FileApproval fileApproval = new FileApproval(
            			ret.getString(1) ,
            			ret.getString(3),
            			ret.getString(4),
            			ret.getString(5),
            			ret.getString(6),
            			ret.getString(7),
            			Integer.parseInt(ret.getString(8))
            		);
            	fileApprovals.add(fileApproval);
            }//��ʾ����  
            //System.out.println(jsonString);
            ret.close();  
            db1.close();//�ر�����  
            return fileApprovals;
        } catch (SQLException e) {  
            e.printStackTrace();  
            return null;
        }  
	}
	public static ArrayList<FileApproval> getAllFileApprovalByLeader(String user)
	{
	    String sql = null;  
	    DBhelper db1 = null;  
	    ResultSet ret = null;  
		sql = "select * from file_approval_application where header=\""+user+"\"";//SQL���  
        db1 = new DBhelper(sql);//����DBHelper����  
        try {  
            ret = db1.pst.executeQuery();//ִ����䣬�õ������  
            
            ArrayList<FileApproval> fileApprovals = new ArrayList<FileApproval>();
            
            while (ret.next()) {  
            	FileApproval fileApproval = new FileApproval(
            			ret.getString(1) ,
            			ret.getString(3),
            			ret.getString(4),
            			ret.getString(5),
            			ret.getString(6),
            			ret.getString(7),
            			Integer.parseInt(ret.getString(8))
            		);
            	fileApprovals.add(fileApproval);
            }//��ʾ����  
            //System.out.println(jsonString);
            ret.close();  
            db1.close();//�ر�����  
            return fileApprovals;
        } catch (SQLException e) {  
            e.printStackTrace();  
            return null;
        }  
	}

	/*���Ŀǰ��������������ֵ*/
	
	/*������ �굥�в����½�����*/
	public static String insertApprovalDetalForNewApproval(int approvalid,String sponsor,String leader,String describe,String file,String date)
	{
		String sql = null;  
		DBhelper db1 = null;  
			    				
		sql = "insert into "+"file_approval_deal"+" values(0"+","
			+"'"+approvalid+"'"+","
			+"'"+0+"'"+","
			+"'"+0+"'"+","
			+"'"+describe+"'"+","
			+"'"+sponsor+"'"+","
			+"'"+leader+"'"+","
			+"'"+date+"'"
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
	/*��������굥��json�����ں��������������飬��Ϊ��ʾ���������˳��*/
	public static String getFileApprovalsInfoById(String id)
	{
		String sql = null;  
	    DBhelper db1 = null;  
	    ResultSet ret = null;  
		sql = "select * from file_approval_deal where approvalId=\""+id+"\""+"order by approvalSN asc";//SQL���  
        db1 = new DBhelper(sql);//����DBHelper����  
        try {  
            ret = db1.pst.executeQuery();//ִ����䣬�õ������  
            
            ArrayList<FileApprovalInfo> fileApprovalInfos = new ArrayList<FileApprovalInfo>();
            
            while (ret.next()) {  
            	            	
            		FileApprovalInfo fileApprovalInfo = new FileApprovalInfo(
            			ret.getString(2) ,
            			ret.getString(3),
            			ret.getString(4),
            			ret.getString(5),
            			ret.getString(6),
            			ret.getString(7),
            			ret.getString(8)
            		);
            		fileApprovalInfos.add(fileApprovalInfo);
            }//��ʾ����  
            String jsonString = Json.toJsonByPretty(fileApprovalInfos);
//            System.out.println(jsonString);
            ret.close();  
            db1.close();//�ر�����              
            return jsonString;
        } catch (SQLException e) {  
            e.printStackTrace();  
            return "{\"result\":false,\"info\":\"��ȡʧ��\"}";
        }  		
	}
	
}

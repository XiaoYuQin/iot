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
	/**
	 * ����ID��ѯ�ļ�����������
	 * @author    ������
	 * @date      2016��11��21�� ����9:32:32 
	 * @param id
	 * @return
	 */
	public static FileApproval getAllFileApprovalInfoById(String id)
	{
	    String sql = null;  
	    DBhelper db1 = null;  
	    ResultSet ret = null;  
		sql = "select * from file_approval_application where id=\""+id+"\"";//SQL���  
        db1 = new DBhelper(sql);//����DBHelper����  
        try {  
            ret = db1.pst.executeQuery();//ִ����䣬�õ������  
            
            FileApproval fileApproval = null;
            
            while (ret.next()) {  
            	fileApproval = new FileApproval(
        			ret.getString(1) ,
        			ret.getString(3),
        			ret.getString(4),
        			ret.getString(5),
        			ret.getString(6),
        			ret.getString(7),
        			Integer.parseInt(ret.getString(8))
        		);
            }//��ʾ����  
            //System.out.println(jsonString);
            ret.close();  
            db1.close();//�ر�����  
            return fileApproval;
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
	
	/**
	 * ���һ������������������
	 * @author    ������
	 * @date      2016��11��21�� ����9:09:54 
	 * @param id
	 * @return
	 */
	private static int getFileApprovalMaxApprovalSNById(String id)
	{
		String sql = null;  
	    DBhelper db1 = null;  
	    ResultSet ret = null;  
	    int maxCount = -1;
		//1.1 ��ø�������״̬Ŀǰ�����к�Ӧ���Ƕ���	    
		sql = "select max(approvalSN) from file_approval_deal where approvalId="+id;
        db1 = new DBhelper(sql);//����DBHelper����  
        try {  
            ret = db1.pst.executeQuery();//ִ����䣬�õ������       
            
            while (ret.next()) {  
            	maxCount = Integer.parseInt(ret.getString(1));
            	System.out.println(ret.getString(1));
            }            
            ret.close();  
            db1.close();//�ر�����      ��
            return maxCount;
        } catch (SQLException e) {  
            e.printStackTrace();  
            return maxCount;
        }  		
	}

	/**
	 * ��������ͨ������
	 * @author    ������
	 * @date      2016��11��21�� ����9:10:28 
	 * @param approvalId ��ǰ�����ı仯
	 * @param approvalSN ��ǰ�������������̱��
	 * @param sponsor
	 * @param leader
	 * @return
	 */
	private static Boolean insertFileApprovalsPassDealinfo(String approvalId,int approvalSN,String sponsor,String leader,String describe)
	{
		String sql = null;  
		DBhelper db1 = null;  
			    				
		sql = "insert into "+"file_approval_deal"+" values(0"+","
			+"'"+approvalId+"'"+","
			+"'"+approvalSN+"'"+","
			+"'"+2+"'"+","
			+"'"+describe+"'"+","
			+"'"+sponsor+"'"+","
			+"'"+leader+"'"+","
			+"'"+SystemDate.getSystemDateToString()+"'"
			+")";
		
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
	 * ��������ͨ������
	 * @author    ������
	 * @date      2016��11��21�� ����9:10:28 
	 * @param approvalId ��ǰ�����ı仯
	 * @param approvalSN ��ǰ�������������̱��
	 * @param sponsor
	 * @param leader
	 * @return
	 */
	private static Boolean insertFileApprovalsRejectDealinfo(String approvalId,int approvalSN,String sponsor,String leader,String describe)
	{
		String sql = null;  
		DBhelper db1 = null;  
			    				
		sql = "insert into "+"file_approval_deal"+" values(0"+","
			+"'"+approvalId+"'"+","
			+"'"+approvalSN+"'"+","
			+"'"+1+"'"+","
			+"'"+describe+"'"+","
			+"'"+sponsor+"'"+","
			+"'"+leader+"'"+","
			+"'"+SystemDate.getSystemDateToString()+"'"
			+")";
		
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
	
	
	private static Boolean updateFileApprovalInfo(String approvalId,String status)
	{
		String sql = null;  
		DBhelper db1 = null;  
		sql = "update file_approval_application set "
			+ "status="+"'"+status+"'"
			+ " where id="+"'"+approvalId+"'";

		System.out.println(sql);
		db1 = new DBhelper(sql);//����DBHelper����  
		try {  
			boolean ret = db1.pst.execute();//ִ����䣬�õ������         
			db1.close();//�ر�����        
			return true;
		} catch (SQLException e) {  
			e.printStackTrace();  
			return false;
		} 
	}
	
	
	/**
	 * �����ļ�����״̬��ͨ�����ǲ���
	 * @author    ������
	 * @date      2016��11��21�� ����4:20:19 
	 * @param id
	 * @param user
	 * @param status
	 * @return
	 */
	public static String setFileApprovalsStatus(String id,int status ,String describe)
	{
		//1. ���Ƚ���״̬����file_approval_deal����		
		int maxCount = getFileApprovalMaxApprovalSNById(id);
		FileApproval fileApproval = getAllFileApprovalInfoById(id);
		if(fileApproval == null) 
			return "{\"result\":false,\"info\":\"��ȡʧ��\"}";
		
		if(maxCount == -1) return "{\"result\":false,\"info\":\"��ȡʧ��\"}";
		if(status == 1)	//����
		{
			if(insertFileApprovalsRejectDealinfo(id,maxCount+1,fileApproval.getSponsor(),fileApproval.getleader(),describe) == false)
			{
				return "{\"result\":false,\"info\":\"��ȡʧ��\"}";
			}
		}
		if(status == 2) //ͨ��
		{
			if(insertFileApprovalsPassDealinfo(id,maxCount+1,fileApproval.getSponsor(),fileApproval.getleader(),describe) == false)
			{
				return "{\"result\":false,\"info\":\"��ȡʧ��\"}";
			}
		}
		if(updateFileApprovalInfo(id,String.valueOf(status)) == false)
			return "{\"result\":false,\"info\":\"��ȡʧ��\"}";
		
		return "{\"result\":true,\"info\":\"�����ɹ�\"}";		
		
	}
	
	
	
	
	
}

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
		db1 = new DBhelper(sql);//创建DBHelper对象  		 	
		 
		try {  
			db1.pst.execute();
			int id = 0;
			ResultSet rs = db1.pst.getGeneratedKeys();   
            if (rs.next()) {  
                id = rs.getInt(1);
                System.out.println("数据主键：" + id);   
            }  
            insertApprovalDetalForNewApproval(id,sponsor,leader,describe,file,date);
            
			db1.close();//关闭连接        
			return "{\"result\":true,\"info\":\"创建成功\"}";
		} catch (SQLException e) {  
			e.printStackTrace();  
			return "{\"result\":false,\"info\":\"创建失败\"}";
		}  		
	}
	public static ArrayList<FileApproval> getAllFileApprovalBySponsor(String user)
	{
	    String sql = null;  
	    DBhelper db1 = null;  
	    ResultSet ret = null;  
		sql = "select * from file_approval_application where sponsor=\""+user+"\"";//SQL语句  
        db1 = new DBhelper(sql);//创建DBHelper对象  
        try {  
            ret = db1.pst.executeQuery();//执行语句，得到结果集  
            
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
            }//显示数据  
            //System.out.println(jsonString);
            ret.close();  
            db1.close();//关闭连接  
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
		sql = "select * from file_approval_application where header=\""+user+"\"";//SQL语句  
        db1 = new DBhelper(sql);//创建DBHelper对象  
        try {  
            ret = db1.pst.executeQuery();//执行语句，得到结果集  
            
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
            }//显示数据  
            //System.out.println(jsonString);
            ret.close();  
            db1.close();//关闭连接  
            return fileApprovals;
        } catch (SQLException e) {  
            e.printStackTrace();  
            return null;
        }  
	}
	/**
	 * 根据ID查询文件审批的详情
	 * @author    秦晓宇
	 * @date      2016年11月21日 下午9:32:32 
	 * @param id
	 * @return
	 */
	public static FileApproval getAllFileApprovalInfoById(String id)
	{
	    String sql = null;  
	    DBhelper db1 = null;  
	    ResultSet ret = null;  
		sql = "select * from file_approval_application where id=\""+id+"\"";//SQL语句  
        db1 = new DBhelper(sql);//创建DBHelper对象  
        try {  
            ret = db1.pst.executeQuery();//执行语句，得到结果集  
            
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
            }//显示数据  
            //System.out.println(jsonString);
            ret.close();  
            db1.close();//关闭连接  
            return fileApproval;
        } catch (SQLException e) {  
            e.printStackTrace();  
            return null;
        }  
	}
	
	

	/*获得目前审批的子序号最大值*/
	
	/*在审批 详单中插入新建审批*/
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
		db1 = new DBhelper(sql);//创建DBHelper对象  		 	
		 
		try {  
			db1.pst.execute();
			
			db1.close();//关闭连接        
			return "{\"result\":true,\"info\":\"创建成功\"}";
		} catch (SQLException e) {  
			e.printStackTrace();  
			return "{\"result\":false,\"info\":\"创建失败\"}";
		}  		
	}
	/*获得审批详单的json串，内含审批的所有详情，作为显示审批结果的顺序*/
	public static String getFileApprovalsInfoById(String id)
	{
		String sql = null;  
	    DBhelper db1 = null;  
	    ResultSet ret = null;  
		sql = "select * from file_approval_deal where approvalId=\""+id+"\""+"order by approvalSN asc";//SQL语句  
        db1 = new DBhelper(sql);//创建DBHelper对象  
        try {  
            ret = db1.pst.executeQuery();//执行语句，得到结果集  
            
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
            }//显示数据  
            String jsonString = Json.toJsonByPretty(fileApprovalInfos);
//            System.out.println(jsonString);
            ret.close();  
            db1.close();//关闭连接              
            return jsonString;
        } catch (SQLException e) {  
            e.printStackTrace();  
            return "{\"result\":false,\"info\":\"获取失败\"}";
        }  		
	}
	
	/**
	 * 获得一条审批最大的数据条数
	 * @author    秦晓宇
	 * @date      2016年11月21日 下午9:09:54 
	 * @param id
	 * @return
	 */
	private static int getFileApprovalMaxApprovalSNById(String id)
	{
		String sql = null;  
	    DBhelper db1 = null;  
	    ResultSet ret = null;  
	    int maxCount = -1;
		//1.1 获得该条审批状态目前的序列号应该是多少	    
		sql = "select max(approvalSN) from file_approval_deal where approvalId="+id;
        db1 = new DBhelper(sql);//创建DBHelper对象  
        try {  
            ret = db1.pst.executeQuery();//执行语句，得到结果集       
            
            while (ret.next()) {  
            	maxCount = Integer.parseInt(ret.getString(1));
            	System.out.println(ret.getString(1));
            }            
            ret.close();  
            db1.close();//关闭连接      、
            return maxCount;
        } catch (SQLException e) {  
            e.printStackTrace();  
            return maxCount;
        }  		
	}

	/**
	 * 插入审批通过数据
	 * @author    秦晓宇
	 * @date      2016年11月21日 下午9:10:28 
	 * @param approvalId 当前审批的变化
	 * @param approvalSN 当前审批的审批流程编号
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
	 * 插入审批通过数据
	 * @author    秦晓宇
	 * @date      2016年11月21日 下午9:10:28 
	 * @param approvalId 当前审批的变化
	 * @param approvalSN 当前审批的审批流程编号
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
	
	
	private static Boolean updateFileApprovalInfo(String approvalId,String status)
	{
		String sql = null;  
		DBhelper db1 = null;  
		sql = "update file_approval_application set "
			+ "status="+"'"+status+"'"
			+ " where id="+"'"+approvalId+"'";

		System.out.println(sql);
		db1 = new DBhelper(sql);//创建DBHelper对象  
		try {  
			boolean ret = db1.pst.execute();//执行语句，得到结果集         
			db1.close();//关闭连接        
			return true;
		} catch (SQLException e) {  
			e.printStackTrace();  
			return false;
		} 
	}
	
	
	/**
	 * 设置文件审批状态，通过还是驳回
	 * @author    秦晓宇
	 * @date      2016年11月21日 下午4:20:19 
	 * @param id
	 * @param user
	 * @param status
	 * @return
	 */
	public static String setFileApprovalsStatus(String id,int status ,String describe)
	{
		//1. 首先将新状态插入file_approval_deal表中		
		int maxCount = getFileApprovalMaxApprovalSNById(id);
		FileApproval fileApproval = getAllFileApprovalInfoById(id);
		if(fileApproval == null) 
			return "{\"result\":false,\"info\":\"获取失败\"}";
		
		if(maxCount == -1) return "{\"result\":false,\"info\":\"获取失败\"}";
		if(status == 1)	//驳回
		{
			if(insertFileApprovalsRejectDealinfo(id,maxCount+1,fileApproval.getSponsor(),fileApproval.getleader(),describe) == false)
			{
				return "{\"result\":false,\"info\":\"获取失败\"}";
			}
		}
		if(status == 2) //通过
		{
			if(insertFileApprovalsPassDealinfo(id,maxCount+1,fileApproval.getSponsor(),fileApproval.getleader(),describe) == false)
			{
				return "{\"result\":false,\"info\":\"获取失败\"}";
			}
		}
		if(updateFileApprovalInfo(id,String.valueOf(status)) == false)
			return "{\"result\":false,\"info\":\"获取失败\"}";
		
		return "{\"result\":true,\"info\":\"创建成功\"}";		
		
	}
	
	
	
	
	
}

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
	
}

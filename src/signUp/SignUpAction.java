package signUp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import com.database.DBhelper;
import com.opensymphony.xwork2.ActionSupport;

public class SignUpAction extends ActionSupport {

	/***/
	private static final long serialVersionUID = 1L;
	private String username;
	private String userpass;
	private String userMail;
	private String userAge;
	
	
	/**
	 * 获得系统时间
	 * @author    秦晓宇
	 * @date      2016年9月6日 下午4:43:23 
	 * @return
	 */
	private static String getSystemDateToString()
	{
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String date = simpleDateFormat.format(new java.util.Date());
		return date;
	}
	
	/**
	 * 检查数据库中是否已经存在用户名，若存在则返回true，不存在则返回false
	 * @author    秦晓宇
	 * @date      2016年9月6日 下午4:29:53 
	 * @param userName
	 * @return
	 */
	private static boolean check(String userName)
	{
	    String sql = null;  
	    DBhelper db1 = null;  
	    ResultSet ret = null;  
		sql = "select *from login";//SQL语句  
        db1 = new DBhelper(sql);//创建DBHelper对象  
        try {  
            ret = db1.pst.executeQuery();//执行语句，得到结果集  
            while (ret.next()) {  
                String uid = ret.getString(1);  
                String ufname = ret.getString(2);  
                if(ufname.equals(userName))
                	return true;
            }//显示数据  
            ret.close();  
            db1.close();//关闭连接  
            return false;
        } catch (SQLException e) {  
            e.printStackTrace();  
            return false;
        }  
	}
	private static boolean insertUser(String name,String password,String mail)
	{
	    String sql = null;  
	    DBhelper db1 = null;  
//		sql = "select *from login";//SQL语句  
		sql = "insert into login values(0"+","+"'"+name+"'"+","
				+"'"+password+"'"+","
				+"'"+getSystemDateToString()+"'"+","
				+"'"+mail+"'"+")";
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
	public String execute() throws Exception {
		System.out.print("SignUpAction execute");
		System.out.println("username:"+username);
		System.out.println("userpass:"+userpass);
		System.out.println("userMail:"+userMail);
		
		boolean checkResult = check(username);
		if(checkResult)
			return "alreadyHave";			
		
		boolean result = insertUser(username,userpass,userMail);
		if(!result)
			return "alreadyHave";	
		else
			return "success";
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getUserpass() {
		return userpass;
	}


	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}


	public String getUserMail() {
		return userMail;
	}


	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}


	public String getUserAge() {
		return userAge;
	}


	public void setUserAge(String userAge) {
		this.userAge = userAge;
	}

}

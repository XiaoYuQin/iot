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
	 * ������ݿ����Ƿ��Ѿ������û������������򷵻�true���������򷵻�false
	 * @author    ������
	 * @date      2016��9��6�� ����4:29:53 
	 * @param userName
	 * @return
	 */
	private static boolean check(String userName)
	{
	    String sql = null;  
	    DBhelper db1 = null;  
	    ResultSet ret = null;  
		sql = "select *from login";//SQL���  
        db1 = new DBhelper(sql);//����DBHelper����  
        try {  
            ret = db1.pst.executeQuery();//ִ����䣬�õ������  
            while (ret.next()) {  
                String uid = ret.getString(1);  
                String ufname = ret.getString(2);  
                if(ufname.equals(userName))
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
	private static boolean insertUser(String name,String password,String mail)
	{
	    String sql = null;  
	    DBhelper db1 = null;  
//		sql = "select *from login";//SQL���  
		sql = "insert into login values(0"+","+"'"+name+"'"+","
				+"'"+password+"'"+","
				+"'"+getSystemDateToString()+"'"+","
				+"'"+mail+"'"+")";
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

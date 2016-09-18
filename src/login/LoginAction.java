package login;


import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport; 

public class LoginAction extends ActionSupport {
	/***/
	private static final long serialVersionUID = 1L;
	private String username;
	private String userpass;

	public String execute() throws Exception{
		
		System.out.println("LoginAction execute");
		HttpSession session = ServletActionContext.getRequest().getSession(); 
		if(session.getAttribute("username") != null) 
		{			
			return SUCCESS;
		}
		boolean result = LogCheck.check(username, userpass);
		if(result == true)
		{
//			System.out.println("  SUCCESS");
			session.setAttribute("username", username);
			LogRegist.loginRegist(username);
			return SUCCESS;	
		}
		else
		{
//			System.out.println("  ERROR");
			return ERROR;
		}
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

}

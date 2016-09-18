package login;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.database.DBhelper;

public class LogCheck {


	public static boolean check(String name,String password)
	{
	    String sql = null;  
	    DBhelper db1 = null;  
	    ResultSet ret = null;  
		sql = "select * from login";//SQL语句  
        db1 = new DBhelper(sql);//创建DBHelper对象  
        try {  
            ret = db1.pst.executeQuery();//执行语句，得到结果集  
            while (ret.next()) {  
                String uid = ret.getString(1);  
                String ufname = ret.getString(2);  
                String upassword = ret.getString(3);  
                System.out.println(uid + "\t" + ufname + "\t" + upassword );  
                if(ufname.equals(name)&&upassword.equals(password))
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
	public static void test()
	{
		System.out.println("test");
	}
}

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
		sql = "select * from login";//SQL���  
        db1 = new DBhelper(sql);//����DBHelper����  
        try {  
            ret = db1.pst.executeQuery();//ִ����䣬�õ������  
            while (ret.next()) {  
                String uid = ret.getString(1);  
                String ufname = ret.getString(2);  
                String upassword = ret.getString(3);  
                System.out.println(uid + "\t" + ufname + "\t" + upassword );  
                if(ufname.equals(name)&&upassword.equals(password))
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
	public static void test()
	{
		System.out.println("test");
	}
}

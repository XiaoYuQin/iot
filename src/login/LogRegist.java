package login;

import java.sql.SQLException;
import java.text.SimpleDateFormat;

import com.database.DBhelper;

public class LogRegist {

	public static boolean loginRegist(String name) {
	    String sql = null;  
	    DBhelper db1 = null;  
		sql = "insert into logHistory values(0"+","
				+"'"+name+"'"+","
				+"'"+getSystemDateToString()+"'"+","				
				+"null"+","
				+"null"+","
				+"null"+","
				+"null"+")";
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
}

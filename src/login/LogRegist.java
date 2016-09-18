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
}

package thing;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.database.DBhelper;

public class Database {
	
	public static ArrayList<Thing> getThingsList(String userName)
	{
	    String sql = null;  
	    DBhelper db1 = null;  
	    ResultSet ret = null;  
	    ArrayList<Thing> thingList = new ArrayList<>();
		sql = "select * from things where userName = "+"'"+userName+"'";//SQL语句  
        db1 = new DBhelper(sql);//创建DBHelper对象  
        try {  
            ret = db1.pst.executeQuery();//执行语句，得到结果集  
            while (ret.next()) {  
                String uid = ret.getString(1);  
                String user_name = ret.getString(2);
                String api_key = ret.getString(3);
                String name = ret.getString(4);
                String type = ret.getString(5);
                
                Thing thing = new Thing();
                thing.setApiKey(api_key);
                thing.setName(name);
                thing.setType(type);
                thing.setUserName(user_name);
                thingList.add(thing);                
            }//显示数据  
            ret.close();  
            db1.close();//关闭连接  
            return thingList;
        } catch (SQLException e) {  
            e.printStackTrace();  
            return null;
        }  
	}
}

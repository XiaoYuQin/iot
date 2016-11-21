package com.database;

import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.PreparedStatement;  
import java.sql.SQLException;  
import java.sql.Statement;
  
public class DBhelper {  
    public static final String url = "jdbc:mysql://127.0.0.1:3306/ape?useUnicode=true&characterEncoding=utf-8&useSSL=false";  
    public static final String name = "com.mysql.jdbc.Driver";  
    public static final String user = "root";  
    public static final String password = "123456";  
  
    public Connection conn = null;  
    public PreparedStatement pst = null;  
  
    public DBhelper(String sql) {  
        try {  
			Class.forName(name).newInstance();//ָ����������  
            conn = DriverManager.getConnection(url, user, password);//��ȡ����  
            pst = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);//׼��ִ�����  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    }  
  
    public void close() {  
        try {  
            this.conn.close();  
            this.pst.close();  
        } catch (SQLException e) {  
            e.printStackTrace();  
        }  
    }  
}  
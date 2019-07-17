package util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Connection;
import java.util.Properties;

import javax.management.RuntimeErrorException;

public class JDBCUtil {
	public static String url;
	public static String user;
	public static String pwd;
	public static String driver;
	private static Object Connection;
	static{
		try {
			InputStream is = JDBCUtil.class.getClassLoader().getResourceAsStream("dbconfig.properties");
			Properties prop = new Properties();
			prop.load(is);
			url = prop.getProperty("url");
			user = prop.getProperty("user");
			pwd = prop.getProperty("pwd");
			driver = prop.getProperty("driver");
		} catch (Exception e) {
			throw new RuntimeException("配置文件读取错误");
		}
		
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("驱动加载错误");
		}
	}
		public static Connection getConnection(){
			Connection conn = null;
			try {
				conn = DriverManager.getConnection(url, user, pwd);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return conn;
		}
		
		public static void release(ResultSet rs,Statement st,Connection conn){
			if(rs!=null){
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			rs = null;
			if(st!=null){
				try {
					st.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			st = null;
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			conn = null;
			
		}

}
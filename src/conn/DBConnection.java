package conn;

import java.sql.Connection;
import java.sql.DriverManager;


public class DBConnection {
	public static final String portNum = "3306";
	public static final String url = "jdbc:mysql:" + "localhost:" + portNum;
	public static final String user = "phase3";
	public static final String pass = "3";
	
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			conn = DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
}

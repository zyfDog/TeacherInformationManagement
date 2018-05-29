package edu.cqut.hr.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DBUtil {
	
	public static Connection getConnection() throws Exception {
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/cquthr";
		String userName = "root";
		String userPWD = "123456";
		
		Class.forName(driverName);
	
		Connection connection = DriverManager.getConnection(url, userName, userPWD);
		
		return connection;
	}
	
	public static boolean execute(String sql) throws Exception {
		Connection connection = getConnection();
		
		Statement statement = connection.createStatement();
		
		return statement.execute(sql);
	}

}

package edu.cqut.hr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import edu.cqut.hr.db.DBUtil;
import edu.cqut.hr.service.LoginService;

public class LoginDao implements LoginService {
	private static LoginDao loginDao;

	public static LoginDao getLoginDao() {
		if (loginDao == null) {
			loginDao = new LoginDao();
		}

		return loginDao;
	}
	
	public boolean login(String username, String password) {
		System.out.println("zz");
		String DBpwd = null;
		boolean flag = false;
		
		String sql = "SELECT password FROM user WHERE username = " + username;
		System.out.println(sql);
		try {
			Connection connection = DBUtil.getConnection();
			PreparedStatement ptmt = connection.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while(rs.next())
			 DBpwd = rs.getString("password");
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		
		if(DBpwd != null && DBpwd.equals(password))
			flag = true;
		
		return flag;
	}

}

package com.ceylontours.tourist;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {
	
public Connection dbConnection() {
		
		Connection conn = null;
		
		String url = "jdbc:mysql://localhost:3306/ots";
		String un = "root";
		String up = "Kulu2002k";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			conn = DriverManager.getConnection(url, un, up);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
		
	}

	

public boolean checkTouritsPassword(String email, String password) {
	
	Connection conn = dbConnection();
	
	boolean check = false;
	
	String sql = "SELECT * FROM tourist WHERE email=? AND password=?";
	
	try {
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, email);
		ps.setString(2, password);
		
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()) {
			check = true;
		}
		
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	
	return check;
	
}

public boolean checkGuidePasswprd(String email, String password) {
	Connection conn = dbConnection();
	
	boolean check = false;
	
	String sql = "SELECT * FROM guide WHERE email=? AND password=?";
	
	try {
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, email);
		ps.setString(2, password);
		
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()) {
			check = true;
		}
		
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	
	return check;
}

public Tourist loggedTourist(String email, String password) {
	
	Connection conn = dbConnection();
	
	Tourist tourist = null;
	
	String sql = "SELECT * FROM tourist WHERE email=? AND password=?";
	
	try {
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, email);
		ps.setString(2, password);
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			
			int id = rs.getInt("id");
			String fname = rs.getString("firstname");
			String lname = rs.getString("lastname");
			String country = rs.getString("country");
			String telephone = rs.getString("telephone");
			String profileimg = rs.getString("profileimg");
			
			tourist = new Tourist(id, fname, lname, email, country, telephone, profileimg);
		}
		
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	return tourist;
}

public GuideModel loggedGuide(String email, String password) {
	
Connection conn = dbConnection();
	
	GuideModel guide = null;
	
	String sql = "SELECT * FROM guide WHERE email=? AND password=?";
	
	try {
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, email);
		ps.setString(2, password);
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			
			int id = rs.getInt("id");
			String username = rs.getString("username");
			String role = rs.getString("role");
			
			guide = new GuideModel(id, username, email, role);
		}
		
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	return guide;
}

}
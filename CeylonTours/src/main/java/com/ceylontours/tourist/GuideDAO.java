package com.ceylontours.tourist;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;



public class GuideDAO {
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

	public int addNewUser(GuideModel guide) {
		Connection dbCon = dbConnection();
		int id = -1;
		
		try {
			String query = "INSERT INTO guide(username,email,password,country,phone,description,profile_pic,cover_pic,role) VALUES(?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = dbCon.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, guide.getName());
			ps.setString(2, guide.getEmail());
			ps.setString(3, guide.getPwd());
			ps.setString(4, guide.getCountry());
			ps.setString(5, guide.getPhone());
			ps.setString(6, guide.getDescription());
			ps.setString(7, guide.getProfilePic());
			ps.setString(8, guide.getCoverPic());
			ps.setString(9, guide.getRole());
			
			//execute query
			int key = ps.executeUpdate();
			
			if(key>0) {
				ResultSet rs = ps.getGeneratedKeys();
				if(rs.next()) {
					id = rs.getInt(1);
				}
			}
			
		}catch(Exception e) {
			System.out.println(e);
		}
		
		return id;
		
	}

	public GuideModel getUserByID(int userID) {
		Connection dbCon = dbConnection();
		int uID = userID;
		GuideModel guide = null;
		
		try {
			String query = "SELECT * FROM guide WHERE id = ?";
			PreparedStatement ps = dbCon.prepareStatement(query);
			ps.setInt(1, uID);
			
			ResultSet res = ps.executeQuery();
			
			if(res.next()) {
				int id = res.getInt("id");
				String name = res.getString("username");
				String email = res.getString("email");
				String pwd = res.getString("password");
				String country = res.getString("country");
				String phone = res.getString("phone");
				String description = res.getString("description");
				String profilePic = res.getString("profile_pic");
				String coverPic = res.getString("cover_pic");
				String role = res.getString("role");
				
				 guide = new GuideModel(id, name, email, pwd, country, phone, description, profilePic, coverPic,role);
				
			}else {
				System.out.println("Something went wrong!");
			}
			
			
			
		}catch(Exception e) {
			System.out.println(e);
		}
		return guide;
		
		
		
	}

	public boolean updatedGuide(GuideModel guide) {
		Connection conn = dbConnection();
		boolean update = false;
		
		System.out.println(guide.getDescription());
		
		String sql = "UPDATE guide SET username=?, country=?, phone=?, description=?, profile_pic=?, cover_pic=? WHERE id=?";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, guide.getName());
			ps.setString(2, guide.getCountry());
			ps.setString(3, guide.getPhone());
			ps.setString(4, guide.getDescription());
			ps.setString(5, guide.getProfilePic());
			ps.setString(6, guide.getCoverPic());
			ps.setInt(7, guide.getId());
			
			
			update = ps.executeUpdate() > 0;
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		System.out.println(update);
		return update;
	}

	public boolean deletGuideProfile(int id) {
		Connection conn = dbConnection();
		
		boolean delete = false;
		
		String sql = "DELETE FROM guide WHERE id=?";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			delete = ps.executeUpdate() > 0;
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return delete;
	}

	

	
}

package com.ceylontours.tourist;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;

public class TouristDAO {
	
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


//create code of tourist
public int registerNewTourist(Tourist tourist) {
	
	Connection conn = dbConnection();
	
	int touristID = -1;
	
	String sql = "INSERT INTO tourist(firstname, lastname, email, password, role) VALUES(?, ?, ?, ?, ?)";
	
	try {
		PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		ps.setString(1, tourist.getfName());
		ps.setString(2, tourist.getlName());
		ps.setString(3, tourist.getEmail());
		ps.setString(4, tourist.getPassword());
		ps.setString(5, tourist.getRole());
		
		int registered = ps.executeUpdate();
		
		if(registered > 0) {
			ResultSet rs = ps.getGeneratedKeys();
			
			if(rs.next()) {
				touristID = rs.getInt(1);
			}
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return touristID;
	
}

public Tourist showUserProfile(int id) {
	Connection conn = dbConnection();
	
	Tourist tourist = null;
	
	String sql = "SELECT * FROM tourist WHERE id=?";
	
	try {
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setInt(1, id);
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			
			String fname = rs.getString("firstname");
			String lname = rs.getString("lastname");
			String email = rs.getString("email");
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

public boolean updatedTourist(Tourist tourist) {
	Connection conn = dbConnection();
	boolean update = false;
	
	String sql = "UPDATE tourist SET firstname=?, lastname=?, country=?, telephone=?, profileimg=? WHERE id=?";
	
	try {
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, tourist.getfName());
		ps.setString(2, tourist.getlName());
		ps.setString(3, tourist.getCountry());
		ps.setString(4, tourist.getTelephone());
		ps.setString(5, tourist.getProfileImg());
		ps.setInt(6, tourist.getId());
		
		update = ps.executeUpdate() > 0;
		
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	
	return update;
}

public boolean deletProfile(int id) {
	Connection conn = dbConnection();
	
	boolean delete = false;
	
	String sql = "DELETE FROM tourist WHERE id=?";
	
	try {
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, id);
		
		delete = ps.executeUpdate() > 0;
		
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	
	return delete;
}

public boolean uniqueEmail(String email) {
	
	Connection conn = dbConnection();
	
	boolean check = true;
	
	String sql = "SELECT * FROM tourist WHERE email=?";
	
	try {
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, email);
		
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()) {
			check = false;
		}
		
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	
	return check;
	
	
	
}

public boolean updateProfileImg(Tourist tourist) {
	
	Connection conn = dbConnection();
	boolean update = false;
	
	String sql = "UPDATE tourist SET profileimg=? WHERE id=?";
	
	try {
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, tourist.getProfileImg());
		ps.setInt(2, tourist.getId());
		
		update = ps.executeUpdate() > 0;
		
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	
	return update;
	
}

public boolean checkGuideEmail(String email) {
	
Connection conn = dbConnection();
	
	boolean check = true;
	
	String sql = "SELECT * FROM guide WHERE email=?";
	
	try {
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, email);
		
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()) {
			check = false;
		}
		
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	
	return check;
}

public List<PackageModel> getAllPackagesHome() {
	
	Connection dbCon = dbConnection();
	List<PackageModel> packList = new ArrayList<PackageModel>();
	
	try {
		String query = "SELECT * FROM package";
		PreparedStatement ps = dbCon.prepareStatement(query);
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			int id = rs.getInt("package_id");
		    int guideID = rs.getInt("guideID");
		    String title = rs.getString("title");
		    String description = rs.getString("description");
		    String price = rs.getString("price");
		    String category = rs.getString("category");
		    String image = rs.getString("image");
		    String days = rs.getString("days");
		    
            System.out.println("Package id "+rs.getString("package_id"));

		    
		   packList.add(new PackageModel(id, guideID, title, description, price, category, days, image, null));
		
		}
	
	}catch(Exception e) {
		System.out.println(e);
	}

	return packList;
}

public List<GuideModel> getAllGuidesHome() {
	Connection dbCon = dbConnection();
	List<GuideModel> guideList = new ArrayList<GuideModel>();
	
	try {
		String query = "SELECT * FROM guide";
		PreparedStatement ps = dbCon.prepareStatement(query);
		
		ResultSet res = ps.executeQuery();
		
		while(res.next()) {
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
		    
            System.out.println("Package: " + id + " " + name );

		    
		   guideList.add(new GuideModel(id, name, email, pwd, country, phone, description, profilePic, coverPic,role));
		
		}
	
	}catch(Exception e) {
		System.out.println(e);
	}

	return guideList;
}

public PackageModel getFullDetailsPackage(int pid) {
    Connection con = dbConnection(); // Assuming you have a method for DB connection
    PackageModel pack = null;

    try {
        // Fetch the package details from the 'package' table
        String query = "SELECT * FROM package WHERE package_id = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, pid);
        
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            // Extract package details
            int gid = rs.getInt("GuideID");
            String title = rs.getString("title");
            String description = rs.getString("description");
            String price = rs.getString("price");
            String category = rs.getString("category");
            String image = rs.getString("image");
            String days = rs.getString("days");

            // Fetch the day plans from the 'package_day_plan' table
            String query2 = "SELECT * FROM package_day_plan WHERE package_id = ?";
            PreparedStatement pps = con.prepareStatement(query2);
            pps.setInt(1, pid);

            ResultSet res = pps.executeQuery();
            ArrayList<String> plan = new ArrayList<>();
            
            // Iterate through the day plans
            while (res.next()) {
                plan.add(res.getString("planDetails"));
            }

            // Create and return the PackageModel object
            pack = new PackageModel(pid, gid, title, description, price, category, days, image, plan);
            
            System.out.println("package id -  "+pid);
        }

        // Close resources
        rs.close();
        ps.close();

    } catch (Exception e) {
        e.printStackTrace(); // Log the error
    } finally {
        try {
            if (con != null) con.close(); // Ensure the connection is closed
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    return pack;
}
	

}

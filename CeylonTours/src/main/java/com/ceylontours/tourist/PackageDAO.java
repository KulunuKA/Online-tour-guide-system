package com.ceylontours.tourist;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PackageDAO {
	
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
	
	public boolean addNewPackage(PackageModel pack) {
	    Connection dbCon = dbConnection();
	    boolean isAdded = false; 
	    int packId = -1;
	    ArrayList<String> plans = new ArrayList<>();

	    try {
	        String query = "INSERT INTO package(guideID, title, description, price, category, image, days) VALUES(?,?,?,?,?,?,?)";
	        PreparedStatement ps = dbCon.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
	        ps.setInt(1, pack.getGuideID());
	        ps.setString(2, pack.getTitle());
	        ps.setString(3, pack.getDescription());
	        ps.setString(4, pack.getPrice());
	        ps.setString(5, pack.getCategory());
	        ps.setString(6, pack.getImage());
	        ps.setString(7, pack.getDays());

	        // Execute the insert and get the package ID
	        int rowsAffected = ps.executeUpdate();
	        if (rowsAffected > 0) {
	            ResultSet rs = ps.getGeneratedKeys();
	            if (rs.next()) {
	                packId = rs.getInt(1);  // Get the generated package ID

	                plans = pack.getDaysPlans();

	                for (int i = 0; i < plans.size(); i++) {
	                    String addPlanQuery = "INSERT INTO package_day_plan(package_id, day_num, planDetails) VALUES(?,?,?)";
	                    PreparedStatement psp = dbCon.prepareStatement(addPlanQuery);

	                    psp.setInt(1, packId);  // Set package ID
	                    psp.setInt(2, i + 1);   // Set day number (1-based)
	                    psp.setString(3, plans.get(i));  // Set day plan

	                    psp.executeUpdate();  // Execute the insertion
	                }

	                isAdded = true;  // Mark as successfully added
	            }
	        }
	    } catch (Exception e) {
	        System.out.println("Error adding package to database: " + e);
	    }

	    return isAdded;
	}

	
	public List<PackageModel> getAllPackages(int gid) {
		Connection dbCon = dbConnection();
		List<PackageModel> packList = new ArrayList<PackageModel>();
		
		try {
			String query = "SELECT * FROM package WHERE guideID = ?";
			PreparedStatement ps = dbCon.prepareStatement(query);
			ps.setInt(1, gid);
			
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
			    
	 
			    
			   packList.add(new PackageModel(id, guideID, title, description, price, category, days, image, null));
			
			}
		
		}catch(Exception e) {
			System.out.println(e);
		}

		return packList;
	}

	public PackageModel getFullDetailsPackage(int id) {
		 Connection con = dbConnection(); // Assuming you have a method for DB connection
		    PackageModel pack = null;

		    try {
		        // Fetch the package details from the 'package' table
		        String query = "SELECT * FROM package WHERE package_id = ?";
		        PreparedStatement ps = con.prepareStatement(query);
		        ps.setInt(1, id);
		        
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
		            pps.setInt(1, id);

		            ResultSet res = pps.executeQuery();
		            ArrayList<String> plan = new ArrayList<>();
		            
		            // Iterate through the day plans
		            while (res.next()) {
		                plan.add(res.getString("planDetails"));
		            }

		            // Create and return the PackageModel object
		            pack = new PackageModel(id, gid, title, description, price, category, days, image, plan);
		            
		            System.out.println("package id -  "+id);
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

	public boolean updatePackage(PackageModel pack) {
		
		Connection conn = dbConnection();
		boolean update = false;
		
		String sql = "UPDATE package SET title=?, description=?, price=?, category=? WHERE package_id=?";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, pack.getTitle());
			ps.setString(2, pack.getDescription());
			ps.setString(3, pack.getPrice());
			ps.setString(4, pack.getCategory());
			ps.setInt(5, pack.getId());
			
			update = ps.executeUpdate() > 0;
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		System.out.println(update);
		return update;
	}

	public boolean deletePackage(int id) {
		Connection conn = dbConnection();
		
		boolean delete = false;
		
		String sql = "DELETE FROM package WHERE package_id=?";
		
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

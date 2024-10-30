package com.ceylontours.tourist;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {
	
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

public boolean addBooking(BookingModel booking) {
	
		Connection dbCon = dbConnection();
	
		boolean booked = false;
		

		String sql = "INSERT INTO booking (package_id, u_id, number_of_travelers, start_date, accommodation_preference, transport_requests, meal_request, special_requests, payment_method, booking_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())";

		try {
			
			PreparedStatement ps = dbCon.prepareStatement(sql);
			ps.setInt(1, booking.getPackageId());
			ps.setInt(2, booking.getuId());
			ps.setInt(3, booking.getNumbeOfTravelers());
			
			ps.setDate(4, booking.getStartDate());
			ps.setString(5, booking.getAccommodationPreference());
			ps.setString(6, booking.getTransportRequests());
			ps.setString(7, booking.getMealRequest());
			ps.setString(8, booking.getSpeciaLRequests());
			ps.setNString(9, booking.getPaymentMethod());
			
			booked = ps.executeUpdate() > 0;
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return booked;
}

public List<BookingModel> getAllBookings(int id) {
	
	
	Connection dbCon = dbConnection();
	List<BookingModel> bookList = new ArrayList<BookingModel>();
	
	try {
		String query = "SELECT * FROM booking WHERE u_id = ?";
		PreparedStatement ps = dbCon.prepareStatement(query);
		ps.setInt(1, id);
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			
			int bid = rs.getInt("b_id");
			int pid = rs.getInt("package_id");
			int travellers = rs.getInt("number_of_travelers");
			java.sql.Date startDate = rs.getDate("start_date");
			String accom = rs.getString("accommodation_preference");
			String transport = rs.getString("transport_requests");
			String meal = rs.getString("meal_request");
			String request = rs.getString("special_requests");
			String pay = rs.getString("payment_method");
			java.sql.Date date = rs.getDate("booking_date");
			
		//	System.out.println("Booking number "+bid+"  pack id "+pid);
		    
			bookList.add(new BookingModel(bid, pid, id, travellers, startDate, accom, transport, meal, request, pay, date));
			
			//System.out.println(bookList);
		}
	
	}catch(Exception e) {
		System.out.println(e);
	}

	return bookList;
}

public BookingModel getFullDetailsBooking(int id) {
	
	 Connection con = dbConnection(); 
	    BookingModel book = null;

	    try {
	    	
	        String query = "SELECT * FROM booking WHERE b_id = ?";
	        PreparedStatement ps = con.prepareStatement(query);
	        ps.setInt(1, id);
	        
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            
	        	int bid = rs.getInt("b_id");
				int pid = rs.getInt("package_id");
				int travellers = rs.getInt("number_of_travelers");
				java.sql.Date startDate = rs.getDate("start_date");
				String accom = rs.getString("accommodation_preference");
				String transport = rs.getString("transport_requests");
				String meal = rs.getString("meal_request");
				String request = rs.getString("special_requests");
				String pay = rs.getString("payment_method");
				java.sql.Date date = rs.getDate("booking_date");
				
			//	System.out.println("Booking number "+bid+"  pack id "+pid);
			    
				book = new BookingModel(bid, pid, id, travellers, startDate, accom, transport, meal, request, pay, date);
				
				//System.out.println(bookList);
	        }


	    } catch (Exception e) {
	    	
	        e.printStackTrace(); // Log the error
	        
	    } 

	    return book;
}

public boolean updateBooking(BookingModel booking) {
	
	
	Connection conn = dbConnection();
	boolean update = false;
	
	
	String sql = "UPDATE booking SET number_of_travelers=?, start_date=?, accommodation_preference=?, meal_request=? WHERE b_id=?";
	
	try {
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setInt(1, booking.getNumbeOfTravelers());	
		ps.setDate(2, booking.getStartDate());
		ps.setString(3, booking.getAccommodationPreference());
		ps.setString(4, booking.getMealRequest());
		ps.setInt(5, booking.getId());	
		
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
	
	String sql = "DELETE FROM booking WHERE b_id=?";
	
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

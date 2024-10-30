package com.ceylontours.tourist;

import java.sql.Timestamp;
import java.util.Date;

public class BookingModel {
	
	 	int id;  
	    int packageId;  
	    int uId;  
	    int numbeOfTravelers;
	    java.sql.Date startDate;
	    String accommodationPreference;
	    String transportRequests;
	    String mealRequest;
	    String speciaLRequests;
	    String paymentMethod;
	    Date bookingDate;
	    
		public BookingModel(int id, int packageId, int uId, int numbeOfTravelers, java.sql.Date startDate,
				String accommodationPreference, String transportRequests, String mealRequest, String speciaLRequests,
				String paymentMethod, Date bookingDate) {
			super();
			this.id = id;
			this.packageId = packageId;
			this.uId = uId;
			this.numbeOfTravelers = numbeOfTravelers;
			this.startDate = startDate;
			this.accommodationPreference = accommodationPreference;
			this.transportRequests = transportRequests;
			this.mealRequest = mealRequest;
			this.speciaLRequests = speciaLRequests;
			this.paymentMethod = paymentMethod;
			this.bookingDate = bookingDate;
		}

		public BookingModel(int packageId, int uId, int numbeOfTravelers, java.sql.Date startDate,
				String accommodationPreference, String transportRequests, String mealRequest, String speciaLRequests,
				String paymentMethod, Date bookingDate) {
			super();
			this.packageId = packageId;
			this.uId = uId;
			this.numbeOfTravelers = numbeOfTravelers;
			this.startDate = startDate;
			this.accommodationPreference = accommodationPreference;
			this.transportRequests = transportRequests;
			this.mealRequest = mealRequest;
			this.speciaLRequests = speciaLRequests;
			this.paymentMethod = paymentMethod;
			this.bookingDate = bookingDate;
		}

		public BookingModel() {
			super();
		}

		
		
		public BookingModel(int packageId, int uId, int numbeOfTravelers, java.sql.Date startDate,
				String accommodationPreference, String transportRequests, String mealRequest, String speciaLRequests,
				String paymentMethod) {
			super();
			this.packageId = packageId;
			this.uId = uId;
			this.numbeOfTravelers = numbeOfTravelers;
			this.startDate = startDate;
			this.accommodationPreference = accommodationPreference;
			this.transportRequests = transportRequests;
			this.mealRequest = mealRequest;
			this.speciaLRequests = speciaLRequests;
			this.paymentMethod = paymentMethod;
		}

		
		public BookingModel(int id2, int travellers, java.sql.Date sqlDate, String accommodation, String meal) {
			
			this.id = id2;
			this.numbeOfTravelers = travellers;
			this.startDate = sqlDate;
			this.accommodationPreference = accommodation;
			this.mealRequest = meal;
					
		}

		
		@Override
		public String toString() {
			return "BookingModel [id=" + id + ", packageId=" + packageId + ", uId=" + uId + ", numbeOfTravelers="
					+ numbeOfTravelers + ", startDate=" + startDate + ", accommodationPreference="
					+ accommodationPreference + ", transportRequests=" + transportRequests + ", mealRequest="
					+ mealRequest + ", speciaLRequests=" + speciaLRequests + ", paymentMethod=" + paymentMethod
					+ ", bookingDate=" + bookingDate + "]";
		}

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public int getPackageId() {
			return packageId;
		}

		public void setPackageId(int packageId) {
			this.packageId = packageId;
		}

		public int getuId() {
			return uId;
		}

		public void setuId(int uId) {
			this.uId = uId;
		}

		public int getNumbeOfTravelers() {
			return numbeOfTravelers;
		}

		public void setNumbeOfTravelers(int numbeOfTravelers) {
			this.numbeOfTravelers = numbeOfTravelers;
		}

		public java.sql.Date getStartDate() {
			return startDate;
		}

		public void setStartDate(java.sql.Date startDate) {
			this.startDate = startDate;
		}

		public String getAccommodationPreference() {
			return accommodationPreference;
		}

		public void setAccommodationPreference(String accommodationPreference) {
			this.accommodationPreference = accommodationPreference;
		}

		public String getTransportRequests() {
			return transportRequests;
		}

		public void setTransportRequests(String transportRequests) {
			this.transportRequests = transportRequests;
		}

		public String getMealRequest() {
			return mealRequest;
		}

		public void setMealRequest(String mealRequest) {
			this.mealRequest = mealRequest;
		}

		public String getSpeciaLRequests() {
			return speciaLRequests;
		}

		public void setSpeciaLRequests(String speciaLRequests) {
			this.speciaLRequests = speciaLRequests;
		}

		public String getPaymentMethod() {
			return paymentMethod;
		}

		public void setPaymentMethod(String paymentMethod) {
			this.paymentMethod = paymentMethod;
		}

		public Date getBookingDate() {
			return bookingDate;
		}

		public void setBookingDate(Date bookingDate) {
			this.bookingDate = bookingDate;
		}
		
		
	    
	    
	
	
	
}

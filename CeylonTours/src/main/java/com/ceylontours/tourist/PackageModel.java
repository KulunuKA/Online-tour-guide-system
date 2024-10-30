package com.ceylontours.tourist;

import java.util.ArrayList;

public class PackageModel {
    int id;
    int guideID;
    String title;
    String description;
    String price;
    String category;
    String image = "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.olankatravels.com%2Ftours%2Fsri-lanka%2F&psig=AOvVaw23TsGD1Hjxw9GEHpUEBEic&ust=1729210615205000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCOiZ2NWRlIkDFQAAAAAdAAAAABAE";
    String days;
    ArrayList<String> daysPlans = new ArrayList<>();
    
  
    
    

    // Constructor
    public PackageModel(int guideID, String title, String description, String price, String category, String days, String image, ArrayList<String> daysPlans) {
        this.guideID = guideID;
        this.title = title;
        this.description = description;
        this.price = price;
        this.category = category;
        this.days = days;
        this.image = (image != null) ? image : "image.jpg"; 
        if (daysPlans != null) {
            this.daysPlans = daysPlans;
        }
    }
    
    public PackageModel(int id,int guideID, String title, String description, String price, String category, String days, String image, ArrayList<String> daysPlans) {
    	this.id = id;
    	this.guideID = guideID;
        this.title = title;
        this.description = description;
        this.price = price;
        this.category = category;
        this.days = days;
        this.image = (image != null) ? image : "image.jpg";
        if (daysPlans != null) {
            this.daysPlans = daysPlans; // Initialize with provided days plans
        }
    }

    public PackageModel(int id2, String title2, String category2, String price2, String description2) {
		
    	this.id = id2;
    	this.title = title2;
    	this.category = category2;
    	this.price = price2;
    	this.description = description2;
	}

	// Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getGuideID() {
        return guideID;
    }

    public void setGuideID(int guideID) {
        this.guideID = guideID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDays() {
        return days;
    }

    public void setDays(String days) {
        this.days = days;
    }

    public ArrayList<String> getDaysPlans() {
        return daysPlans;
    }

    public void setDaysPlans(ArrayList<String> daysPlans) {
        this.daysPlans = daysPlans;
    }
    
    public int getNumDays() {
    	return daysPlans.size();
    }
  
}

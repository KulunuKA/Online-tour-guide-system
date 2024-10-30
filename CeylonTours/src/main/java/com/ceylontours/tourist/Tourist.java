package com.ceylontours.tourist;

public class Tourist {
	
	int id;
	String fName;
	String lName;
	String email;
	String country;
	String telephone;
	String password;
	String profileImg;
	
	
	
	
	public Tourist(int id, String profileImg) {
		super();
		this.id = id;
		this.profileImg = profileImg;
	}


	public Tourist(int id, String fName, String lName, String email, String country, String telephone,
			String profileImg) {
		super();
		this.id = id;
		this.fName = fName;
		this.lName = lName;
		this.email = email;
		this.country = country;
		this.telephone = telephone;
		this.profileImg = profileImg;
	}
	
	String role;
	
	public Tourist() {
		super();
	}
	
	public Tourist(String fName, String lName, String email, String password, String role) {
		super();
		this.fName = fName;
		this.lName = lName;
		this.email = email;
		this.password = password;
		this.role = role;
	}
	
	public Tourist(String fName, String lName, String email, String country, String telephone, String password,
			String profileImg, String role) {
		super();
		this.fName = fName;
		this.lName = lName;
		this.email = email;
		this.country = country;
		this.telephone = telephone;
		this.password = password;
		this.profileImg = profileImg;
		this.role = role;
	}
	
	public Tourist(int id, String fName, String lName, String email, String country, String telephone, String password,
			String profileImg, String role) {
		super();
		this.id = id;
		this.fName = fName;
		this.lName = lName;
		this.email = email;
		this.country = country;
		this.telephone = telephone;
		this.password = password;
		this.profileImg = profileImg;
		this.role = role;
	}
	
	public Tourist(int id2, String fname2, String lname2, String country2, String telephone2, String pimg) {
		
		this.id = id2;
		this.fName = fname2;
		this.lName = lname2;
		this.country = country2;
		this.telephone = telephone2;
		this.profileImg = pimg;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getlName() {
		return lName;
	}
	public void setlName(String lName) {
		this.lName = lName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}

}

package com.ceylontours.tourist;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/")
@MultipartConfig 
public class GuideCtrl extends HttpServlet{
	
	GuideDAO dao = new GuideDAO();
	TouristDAO tdao = new TouristDAO();
	PackageDAO pdao = new PackageDAO();
	LoginDAO ldao = new LoginDAO();
	BookingDAO bdao = new BookingDAO();
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getServletPath();
		
		switch(action){
			
		case "/views/addpackage":	
			addPackage(req,res);
			break;		
		case "/views/loginUser":
			checkLogin(req, res);
			break;
		case "/views/uploadProfileimage":
			HttpSession session = req.getSession();
			int id = (int) session.getAttribute("id");
			updateProfileImg(req, res);
			showUserProfile(req, res);
			break;
		case "/views/updateGuide":
			updateGuide(req, res);
			break;
		case "/views/updateTourist":
			updateTourist(req, res);
			break;
		case "/views/bookTourNow":
			try {
				addBooking(req, res);
			} catch (IOException e) {
				e.printStackTrace();
			} catch (ParseException e) {
				e.printStackTrace();
			}
			break;
		case "/views/updateBooking":
			try {
				updateBooking(req, res);
			} catch (ParseException e) {
				
				e.printStackTrace();
			}
			break;
		}
		
		
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getServletPath();
		String queryParams = req.getQueryString();
		
		
		switch(action){
		case "/views/registerGuide":
			register(req,res);
			break;
			
		case "/views/registerTourist":
			System.out.println("System going to register a Tourist");
			registerTourist(req, res);
		break;
			
		case "/views/guide_dashboard":
			getUserWithPack(req,res);			
			break;
		
		case "/views/packagePage":
			getHomePageData(req,res);//only packList
			break;
			
		case "/views/home":
			System.out.println("catched home...");
			getHomePageData(req,res);
			break;
			
		case "/views/onePackage":
			getOnePackage(req,res);
			break;
		case "/views/userprofile":
			showUserProfile(req, res);
			break;

		case "/views/updateProfile":
			showUpdateForm(req, res);
			break;
		case "/views/deleteProfile":
			deleteProfile(req, res);
			break;
		case "/views/updateGuideProfile":
			showGuideUpdateForm(req, res);	
			break;
		case "/views/deleteGuideProfile":
			deleteGuideProfile(req, res);
			break;
		case "/views/editPackage":
			showPackageUpdateForm(req, res);
			break;
		case "/views/updatePackage":
			updatePackage(req, res);
			break;
		case "/views/removePackage":
			deletePackage(req, res);
			break;
		case "/views/bookTour":
			showBookingForm(req, res);
			break;
		case "/views/bookingHistory":
			showBookingHistory(req, res);
			break;
		case "/views/editBooking":
			showBookingUpdateForm(req, res);
			break;
		case "/views/deleteBooking":
			deleteBooking(req, res);
			break;
			
		 default:
	         res.sendError(HttpServletResponse.SC_NOT_FOUND, "Page not found");
	         break;
		}
		
		
	}
	
	//Tourist CRUD Controller Methods
	
	private void registerTourist(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		
		String fname = req.getParameter("fname");
		String lname = req.getParameter("lname");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String role = "tourist";
		
		Tourist tourist = new Tourist(fname, lname, email, password, role);
		
		if(tdao.uniqueEmail(email)) {
			
			if(tdao.checkGuideEmail(email)) {
				
				int touristID = tdao.registerNewTourist(tourist);
				
				if(touristID > 0) {
					HttpSession session = req.getSession();
					session.setAttribute("id", touristID);
					session.setAttribute("name", fname);
						
					res.sendRedirect("home");				
					
					System.out.println(touristID);
					
				}else {
					
					res.sendRedirect("touristreg.jsp?error=Registration Failed!");
					
				}
				
			}else {
				
				System.out.println("Email already used by Guide.....");
				res.sendRedirect("touristreg.jsp?error=Already Registered!");
				
			}
			
			
		}else {
			
			System.out.println("Email already used.....");
			res.sendRedirect("touristreg.jsp?error=Already Registered!");
		}
		
	}
	
	private void showUserProfile(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		HttpSession session = req.getSession();		
		int id = (int) session.getAttribute("id");
		
		Tourist tourist = tdao.showUserProfile(id);
		
		RequestDispatcher rd = req.getRequestDispatcher("userprofile.jsp");
		req.setAttribute("ts", tourist);
		rd.forward(req, res);
		
	}

	private void showUpdateForm(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		HttpSession session = req.getSession();
		int id = (int) session.getAttribute("id");
		
		Tourist tourist = tdao.showUserProfile(id);
		RequestDispatcher rd = req.getRequestDispatcher("updateTourist.jsp");
		req.setAttribute("ts", tourist);
		rd.forward(req, res);
		
	}

	private void updateTourist(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		
		HttpSession session = req.getSession();
		
		int id = (int) session.getAttribute("id");
		String fname = req.getParameter("fname");
		String lname = req.getParameter("lname");
		String country = req.getParameter("country");
		String telephone = req.getParameter("telephone");
		String pimg = req.getParameter("pimg");
		
		Tourist tourist = new Tourist(id, fname, lname, country, telephone, pimg);
		
		boolean updated = tdao.updatedTourist(tourist);
		
		if(updated) {
			
			System.out.println("Update Succesfull..");
			showUserProfile(req, res);
			
		}else {
			
			System.out.println("Update failed...");
		}
		
	}

	private void deleteProfile(HttpServletRequest req, HttpServletResponse res) throws IOException {
		HttpSession session = req.getSession();
		
		int id = (int) session.getAttribute("id");
		
		if(tdao.deletProfile(id)) {
			System.out.println("Succefully Deleted...");
			session.invalidate(); 
			res.sendRedirect("home.jsp");
		}else {
			System.out.println("Failed to delete...");
		}
		
	}
	
	//Guide CRUD Controller Methods
	
	private void register(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{
		String name = req.getParameter("username");
		String email = req.getParameter("email");
		String pwd = req.getParameter("password");
		String country = req.getParameter("country");
		String phone = req.getParameter("telephone");
		String role ="guide";
		
			GuideModel guide = new GuideModel(name, email, pwd,country, phone);
			
			if(tdao.uniqueEmail(email)) {
				
				if(tdao.checkGuideEmail(email)) {
					
					int id = dao.addNewUser(guide);
					
					if(id >0) {
						HttpSession session = req.getSession();
						session.setAttribute("id", id);
						session.setAttribute("name", name);
						session.setAttribute("role", role);
						
						res.sendRedirect("guide_dashboard");
					}else {
						System.out.println("falied!");
					}
					
				}else {
					
					System.out.println("Email already used by Guide.....");
					res.sendRedirect("guidereg.jsp?error=Already Registered!");				
				}
							
			}else {
				
				System.out.println("Email already used.....");
				res.sendRedirect("guidereg.jsp?error=Already Registered!");
			}					
	}
	
	private void getUserWithPack(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		int id = (int) session.getAttribute("id");
		
		List<PackageModel> packList = new ArrayList<PackageModel>();
		
		 packList = pdao.getAllPackages(id);
		 req.setAttribute("packList", packList);	
		 GuideModel guide = dao.getUserByID(id);
		
		RequestDispatcher rd = req.getRequestDispatcher("guide_dashboard.jsp");
		req.setAttribute("user", guide);
		rd.forward(req, res);
	}
	
	private void showGuideUpdateForm(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		int id = (int) session.getAttribute("id");
		
		GuideModel guide = dao.getUserByID(id);
		
		RequestDispatcher rd = req.getRequestDispatcher("updateGuide.jsp");
		req.setAttribute("gd", guide);
		rd.forward(req, res);
		
	}
	
	private void updateGuide(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		HttpSession session = req.getSession();	
		int id = (int) session.getAttribute("id");
		
		String name = req.getParameter("name");
		String country = req.getParameter("country");
		String telephone = req.getParameter("telephone");
		String description = req.getParameter("desciption");
		String pimg = req.getParameter("pimg");
		String cimg = req.getParameter("cimg");
		
		GuideModel guide = new GuideModel(id, name, country, telephone, description, pimg, cimg);
		
		System.out.println(description);
		
		boolean updated = dao.updatedGuide(guide);
		
		if(updated) {
			System.out.println("Update Succesfull..");
			getUserWithPack(req,res);			
		}else {
			
			System.out.println("Update failed...");
		}
		
		
		
	}
	
	private void deleteGuideProfile(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		HttpSession session = req.getSession();
		int id = (int) session.getAttribute("id");
		if(dao.deletGuideProfile(id)) {
			System.out.println("Succefully Deleted...");
			session.invalidate(); 
			res.sendRedirect("home.jsp");
		}else {
			System.out.println("Failed to delete...");
		}
		
	}
	
	//Tour Booking CRUD Controller Methods
	
	private void addBooking(HttpServletRequest req, HttpServletResponse res) throws IOException, ParseException {
		
		
		HttpSession session = req.getSession();
		
		int uid = (int) session.getAttribute("id");
		
		
		int pid = Integer.parseInt(req.getParameter("pid"));
		
		
		int travellers = Integer.parseInt(req.getParameter("travellers"));
		
		java.util.Date utilDate = sdf.parse(req.getParameter("startDate")); // Convert String to java.util.Date
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime()); 
		
		String accommodation = req.getParameter("accommodation");
		String transport = req.getParameter("transport");
		String meal = req.getParameter("meal");
		String specialRequests = req.getParameter("specialRequests");
		String payment = req.getParameter("payment");
		
		BookingModel booking = new BookingModel(pid, uid, travellers, sqlDate, accommodation, transport, meal, specialRequests, payment);
		
		boolean isAdded = bdao.addBooking(booking);
    	
    	if(isAdded) { 
    		System.out.println("Booked");
    		res.sendRedirect("userprofile");
    	}else {
    		System.out.println("Falied!");
    	};
		
	}
	
	private void showBookingForm(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		int id = Integer.parseInt(req.getParameter("id"));
		
		PackageModel pack = tdao.getFullDetailsPackage(id);
		RequestDispatcher rd = req.getRequestDispatcher("bookingreg.jsp");
		req.setAttribute("pack", pack);
		rd.forward(req, res);
	}
	
	private void showBookingHistory(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		int id = (int) session.getAttribute("id");
		
		List<BookingModel> bookList = new ArrayList<BookingModel>();
		
		bookList = bdao.getAllBookings(id);
		
		  
		req.setAttribute("bookList", bookList);	
		RequestDispatcher rd = req.getRequestDispatcher("bookingHistory.jsp");
		rd.forward(req, res);
		
	}
	
	private void showBookingUpdateForm(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		int id = Integer.parseInt(req.getParameter("id"));
		
		System.out.println("enter show booking form");
		
		BookingModel book = bdao.getFullDetailsBooking(id);
		
		RequestDispatcher rd = req.getRequestDispatcher("updateBooking.jsp");
		req.setAttribute("book", book);
		rd.forward(req, res);
		
	}
	
	private void updateBooking(HttpServletRequest req, HttpServletResponse res) throws ParseException, ServletException, IOException {
		
		int id = Integer.parseInt(req.getParameter("bid"));
		int travellers = Integer.parseInt(req.getParameter("travellers"));
		java.util.Date utilDate = sdf.parse(req.getParameter("startDate")); // Convert String to java.util.Date
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		String accommodation = req.getParameter("accommodation");
		String meal = req.getParameter("meal");
		
		
		BookingModel book = new BookingModel(id, travellers, sqlDate, accommodation, meal);
		boolean update = bdao.updateBooking(book);
		
		if(update) {
			System.out.println("Update Succesfull..");
			res.sendRedirect("userprofile");
			
		}else {
			System.out.println("Failed to update");
		}
		}
	
	private void deleteBooking(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		int id = Integer.parseInt(req.getParameter("id"));
		if(bdao.deletePackage(id)) {
			res.sendRedirect("userprofile");
		}else {
			System.out.println("Failed to delete..");
		}
			
		}
	
	//Tour Package CRUD Controller Methods
	
	private void addPackage(HttpServletRequest req, HttpServletResponse res) throws IOException {

		HttpSession session = req.getSession();
		
		int guideID = (int) session.getAttribute("id");
		String title = req.getParameter("title");
		String description = req.getParameter("description");
		String price = req.getParameter("price");
		String cate = req.getParameter("category");
		String days = req.getParameter("days");
		String img = req.getParameter("image");
		String[] dayPlans = req.getParameterValues("day");
		ArrayList<String> plans = new ArrayList<>();

        if (dayPlans != null) {
            for (int i = 0; i < dayPlans.length; i++) {
                plans.add(i, dayPlans[i]);
            }
        } 
        
        if(price.equals("0")) {
        	System.out.println("err");
            res.sendRedirect("guide_dashboard.jsp?tab=2&error=Invalid price. Please enter a valid price.");

        }else if(plans.size() == 0) {
        	 res.sendRedirect("guide_dashboard.jsp?tab=2&error=Please add day plans.");
        } else {
        	try {
            	PackageModel pack = new PackageModel(guideID,title,description,price,cate,days,img,plans);
            	
            	boolean isAdded = pdao.addNewPackage(pack);
            	
            	
            	if(isAdded) { 
            		System.out.println("Added!");
            		res.sendRedirect("guide_dashboard");
            	}else {
            		System.out.println("Falied!");
            	};
            	
            }catch(Exception e) {
            	System.out.println("Add Pac"+e);
            }
        }
		
	}

	private void showPackageUpdateForm(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		int id = Integer.parseInt(req.getParameter("id"));
		
		System.out.println("enter show package");
		
		PackageModel pack = pdao.getFullDetailsPackage(id);
		
		RequestDispatcher rd = req.getRequestDispatcher("updatePackage.jsp");
		req.setAttribute("pack", pack);
		rd.forward(req, res);
		
	}
	
	private void updatePackage(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		String title = req.getParameter("title");
		String category = req.getParameter("category");
		String price = req.getParameter("price");
		String description = req.getParameter("description");
		
		
		PackageModel pack = new PackageModel(id, title, category, price, description);
		boolean update = pdao.updatePackage(pack);
		
		if(update) {
			System.out.println("Update Succesfull..");
			res.sendRedirect("guide_dashboard");
		}else {
			
			System.out.println("Failed to update");
		}
		
		
	}
	
	private void deletePackage(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		int id = Integer.parseInt(req.getParameter("id"));
		if(pdao.deletePackage(id)) {
			res.sendRedirect("guide_dashboard");
		}else {
			System.out.println("Failed to delete..");
		}
	}


	//Other Functions - Profile image upload -tourist	
	private void updateProfileImg(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = req.getSession();
		
		int id = (int) session.getAttribute("id");
		
		
		
		// Handle the image upload
        Part filePart = req.getPart("profileImg");
        String fileName = getFileName(filePart);  // Get file name
        String uploadPath = getServletContext().getRealPath("") + "uploads" + File.separator + fileName; // Set upload path
		
        
        // Save the file to the server
        try (FileOutputStream fos = new FileOutputStream(new File(uploadPath));
             InputStream is = filePart.getInputStream()) {

            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = is.read(buffer)) != -1) {
                fos.write(buffer, 0, bytesRead);
            }
        }
        
        
        // Save the tourist information along with the image path 
		Tourist tourist = new Tourist(id, fileName);
		
		boolean updated = tdao.updateProfileImg(tourist);
		
		if(updated) {
			
			System.out.println("Profile Photo uploaded Succesfull..");
			System.out.println(fileName);
			showUserProfile(req, res);
			
		}
		
	}

	// Helper method to extract the file name from Part
	private String getFileName(Part filePart) {
		
		 String contentDisposition = filePart.getHeader("content-disposition");
	        for (String cd : contentDisposition.split(";")) {
	            if (cd.trim().startsWith("filename")) {
	                return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
	            }
	        }
	        return null;
	}

	//Functions for Dynamic Home page
	private void getHomePageData(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	List<PackageModel> packList = new ArrayList<PackageModel>();
	List<GuideModel> guideList = new ArrayList<GuideModel>();
	System.out.println("get home page data");
	if(req.getServletPath().equals("/views/home")) {
		 packList = tdao.getAllPackagesHome();
		 guideList = tdao.getAllGuidesHome();
		 
		 System.out.println("size of packlist "+packList.size());
		 System.out.println("size of guideList "+guideList.size());
		 
		 req.setAttribute("packList", packList);
		 req.setAttribute("guideList", guideList);
		 forwardToPage("home.jsp",req,res);
	}else if(req.getServletPath().equals("/views/packagePage")){
		packList = tdao.getAllPackagesHome();
		 
		 req.setAttribute("packList", packList);
		 forwardToPage("packagePage.jsp",req,res);
	}
	
	
		
	}
	
	private void getOnePackage(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		
		PackageModel pack = tdao.getFullDetailsPackage(id);
		RequestDispatcher rd = req.getRequestDispatcher("one_package.jsp");
		req.setAttribute("pack", pack);
		rd.forward(req, res);
		
	}

	private void forwardToPage(String path, HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		   
		System.out.println("path - "+path);

		RequestDispatcher rd = req.getRequestDispatcher(path);
	    rd.forward(req, res);
	}

	//Login Function
	private void checkLogin(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		System.out.println(email+", "+password);
			
			if(ldao.checkTouritsPassword(email, password)) {
				
			//	System.out.println("Logged as a Tourist");
				
				Tourist tourist = ldao.loggedTourist(email, password);
				
			//	System.out.println("Logged tourist "+tourist.getId());
				
				HttpSession session = req.getSession();
				session.setAttribute("id", tourist.getId());
				session.setAttribute("name", tourist.getfName());
				session.setAttribute("role", tourist.getRole());
				
				res.sendRedirect("home");
				
				
				
			}else if(ldao.checkGuidePasswprd(email, password)) {
				
				System.out.println("Logged as a Guide");
				
				GuideModel guide = ldao.loggedGuide(email, password);
				
				System.out.println("Logged tourist "+guide.getId());
				
				HttpSession session = req.getSession();
				session.setAttribute("id", guide.getId());
				session.setAttribute("name", guide.getName());
				session.setAttribute("role", guide.getRole());
				
				res.sendRedirect("guide_dashboard");
				
			}else {
				
				res.sendRedirect("login.jsp?error=Invalid email or password. Please try again.");
				
				System.out.println("Wrong Pssword...");
				
			}
			
		}
			
}




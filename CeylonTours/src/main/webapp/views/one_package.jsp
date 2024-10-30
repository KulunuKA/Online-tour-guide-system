<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    if (session.getAttribute("role") == "guide") {
        response.sendRedirect("login.jsp");       
        return;  
    }
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Package</title>
<link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"
      integrity="sha384-4LISF5TTJX/fLmGSxO53rV4miRxdg84mZsxmO8Rx5jGtp/LbrixFETvWa5a6sESd"
      crossorigin="anonymous"
    />
<style type="text/css">

@import url("https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap");

:root {
  --mainColor: #26a59e;
  --secondColor: #22958f;
  --hoverColor: #2dc5bd;
  --textColor: #05063d;
  --fillColor: #f5fdfc;
  --smallFontColor: #626566;
}
/* General Styles */
*{
  list-style: none;
  text-decoration: none;
}
body {
     font-family: "outfit";
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    color: #333;
   
}

.flex {
  display: flex;
  align-items: center;
}

.container {
  width: 85%;
  margin: auto;
}

.btn {
  padding: 7px 10px;
}


.navbar {
  margin-top: 5px;
  width: 100%;
  height: 80px;
  justify-content: space-between;
}

.navbar .logo img {
  width: 170px;
}

.navLinks ul {
  gap: 50px;
}

li a {
  color: var(--textColor);
  text-decoration: none;
  font-weight: 600;
  cursor: pointer;
  position: relative;
  width: auto;
}
li a:before {
  content: "";
  position: absolute;
  background-color: var(--mainColor);
  height: 3px;
  width: 0;
  bottom: -10px;
  transition: 0.3s;
}

li a:hover:before {
  width: 100%;
}

.loginsignupbtn {
  gap: 15px;
}

.loginsignupbtn .login {
  background-color: var(--mainColor);
  padding: 6px 20px;
  color: #fff;
  border-radius: 5px;
}

.loginsignupbtn .login:hover {
  background-color: var(--hoverColor);
  color: #fff;
}

.loginsignupbtn .signup {
  padding: 6px 20px;
  border: 1px solid transparent;
  color: var(--textColor);
}

.loginsignupbtn .signup:hover {
  border: 1px solid var(--mainColor);
  border-radius: 5px;
}

.pg-container {
    width: 85%;
    margin: 0 auto;
    padding: 20px;
}

.title{
	color:#103b63;
	font-size: 1.7em;
	text-transform: capitalize;
}

/* Hero Section */
.pg-hero-section {
    background-image: url('https://miro.medium.com/v2/resize:fit:1400/1*S4rlhIZNFOqR-2AhqV3-Mw.jpeg');
    background-size: cover;
    background-position: center;
    height: 400px;
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    color: white;
}

.hero-content h1 {
    font-size: 2.5rem;
    margin-bottom: 10px;
}

.hero-content p {
    font-size: 1.2rem;
}

/* Package Details Section */
.package-details {
    background-color: #f9f9f9;
    padding: 60px 20px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.pg-container {
    max-width: 1200px;
    width: 100%;
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    background-color: #ffffff;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    padding: 40px;
    gap: 40px;
}

.pack-column {
    flex: 1;
}

.pack-column .title {
    font-size: 2.5rem;
    font-weight: 700;
    color: #333;
    margin-bottom: 20px;
}

.pack-column .description {
    font-size: 1.2rem;
    color: #666;
    line-height: 1.6;
    margin-bottom: 30px;
}

.pack-row {
    display: flex;
    gap: 20px;
    margin-bottom: 30px;
    align-items: center;
}

.pack-column .price {
    font-size: 1.5rem;
    color: #28a745;
    font-weight: 600;
}

.pack-column .days {
    font-size: 1.2rem;
    color: #555;
}

.pack-column a {
    display: inline-block;
    background-color: #26a59e;
    color: #ffffff;
    font-size: 1.2rem;
    font-weight: 600;
    text-transform: uppercase;
    padding: 12px 20px;
    border-radius: 5px;
    text-decoration: none;
    transition: background-color 0.3s ease;
}

.pack-column a:hover {
    background-color: #2dc5bd;
}

.package-img {
    max-width: 500px;
    width: 100%;
    border-radius: 8px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
}

/* Itinerary Section */
.itinerary-section {
    background-color: #f9f9f9;
    padding: 60px 20px; /* Increased padding for breathing space */
    text-align: center;
}

.itinerary-section h3 {
    font-size: 2rem;
    margin-bottom: 30px;
    text-align: center;
    font-weight: 600; /* Slightly bolder for emphasis */
    color: #05063d; /* Darker color for better readability */
}

.itinerary-section ul {
    list-style-type: none;
    padding: 0;
    max-width: 800px; /* Increased width for better spacing */
    margin: 0 auto;
    text-align: left;
}

.itinerary-section li {
    background-color: #ffffff; /* White background for each day */
    border-radius: 8px; /* Rounded corners for modern look */
    padding: 20px;
    margin-bottom: 20px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
    position: relative;
    overflow: hidden;
}

/* Day header styling */
.itinerary-section .day-header {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
}

.itinerary-section .day {
    color: #22958f;
    font-size: 1.6rem;
    font-weight: 700;
    margin-right: 10px;
}

/* Plan description styling */
.itinerary-section .plan-description {
    font-size: 1.1rem;
    color: #555; /* Softer color for readability */
    line-height: 1.6;
}

/* Custom bullet point */
.itinerary-section li::before {
    content: "";
    background-color: #2dc5bd; /* Orange bullet point */
    height: 12px;
    width: 12px;
    border-radius: 50%;
    position: absolute;
    left: -5px;
    top: 20px;
}


/* Gallery Section */
.gallery-section {
    padding: 40px 0;
}

.gallery-section h3 {
    font-size: 1.8rem;
    margin-bottom: 20px;
    text-align: center;
}

.gallery-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 15px;
}

.gallery-grid img {
    width: 100%;
    height: 500px;
    border-radius: 10px;
    object-fit: cover;
}

/* Footer Section */
.footer {
    background-color: #333;
    color: white;
    padding: 20px 0;
    text-align: center;
}

.footer p {
    margin: 0;
    font-size: 0.9rem;
}

</style>
</head>
<body>

	<header>
    <div class="container">
      <div class="navbar flex">
        <div class="logo">
        <img src="https://res.cloudinary.com/dy7o6eaby/image/upload/v1729239453/logo_qaanax.png" alt="logo" class="logoimg" />


        </div>
        <div class="navLinks">
          <ul class="flex">
            <li class="navLink"><a class="active-nav" href="home">Discover</a></li>
            <li class="navLink"><a href="packagePage">Tours</a></li>
            <li class="navLink"><a href="#">Guiders</a></li>
            <li class="navLink"><a href="#">About</a></li>
          </ul>
        </div>
        <div class="loginsignup">
          <div class="loginsignupbtn flex">
          
             <%               
                        String userName = (String) session.getAttribute("name");
                        if (userName != null) { 
                    %>
                        
                        <a href="userprofile?id=<%= session.getAttribute("id") %>" class="signup btn"> <%= userName %></a>
                        <a href="logout.jsp" class="login btn">Log out</a>
                        
                    <% } else { %>
                        
                        <a href="touristreg.jsp" class="signup btn">Sign up</a>
                        <a href="login.jsp" class="login btn">Log in</a>
                        
                    <% } %>
          </div>
        </div>
      </div>
    </div>
  </header>

   <section class="pg-hero-section">
        <div class="hero-content">
            <h1>Discover Sri Lanka's Wonders</h1>
            <p>Join us for a breathtaking tour across the island’s most beautiful landmarks.</p>
        </div>
    </section>

    <!-- Package Details Section -->
	<section class="package-details">
	    <div class="pg-container">
	        <div class="pack-column">
	        	 <h2 class="title"><c:out value="${pack.title}"></c:out></h2>
	        	<p class="description"><c:out value="${pack.description}"></c:out></p>
	        <div class="pack-row">
	        <p class="price">LKR <c:out value="${pack.price}"></c:out></p>
	        <p class="days">Duration: <c:out value="${pack.days}"></c:out> days</p>
	        </div>
	        <a href="bookTour?id=${pack.id}" >Book Now</a>
	        </div>
	        
	        <img src="<c:out value='${pack.image}'/>" alt="Package Image" class="package-img">
	    </div>
	</section>


    <!-- Itinerary Section -->
    <section class="itinerary-section">
    <div>
        <h3>Itinerary</h3>
        <ul>
            <c:forEach var="plan" items="${pack.daysPlans}" varStatus="status">
                <li>
                    <div class="day-header">
                        <b class="day">Day ${status.index + 1}</b>
                    </div>
                    <p class="plan-description"><c:out value='${plan}'/></p>
                </li>
            </c:forEach>
        </ul>
    </div>
</section>


    <!-- Gallery Section -->
    <section class="gallery-section">
        <div >
            <h3>Gallery</h3>
            <div class="gallery-grid">
                <img src="https://images.squarespace-cdn.com/content/v1/5a3bb03b4c326d76de73ddaa/1621680724537-9M52207EUEONJ90X9X0T/The+Common+Wanderer-6433.jpg" alt="Galle Fort">
                <img src="https://th.bing.com/th/id/OIP.onnUcZs0pbFoQ61QKo9PTAHaJQ?rs=1&pid=ImgDetMain" alt="Nuwara Eliya">
                <img src="https://th.bing.com/th/id/OIP.tgw4WkNxwpH-cDO5WRx_3QHaJQ?rs=1&pid=ImgDetMain" alt="Kandy">
                <img src="https://i.pinimg.com/736x/8d/7b/c9/8d7bc91db63b860b1638170fad5020c1.jpg" alt="Sigiriya">
            </div>
        </div>
    </section>


</body>
</html>
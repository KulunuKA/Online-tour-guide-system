<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<title>Landing page</title>
<link rel="stylesheet" type="text/css" href="../assests/css/landing.css">
<link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"
      integrity="sha384-4LISF5TTJX/fLmGSxO53rV4miRxdg84mZsxmO8Rx5jGtp/LbrixFETvWa5a6sESd"
      crossorigin="anonymous"
    />
    
    <style>

@import url("https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap");

:root {
  --mainColor: #26a59e;
  --secondColor: #22958f;
  --hoverColor: #2dc5bd;
  --textColor: #05063d;
  --fillColor: #f5fdfc;
  --smallFontColor: #626566;
}

* {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
  font-family: "outfit";
  list-style: none;
  text-decoration: none;
}

body {
  background-color: #fff;
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

li .active-nav:before {
  content: "";
  position: absolute;
  background-color: var(--mainColor);
  height: 3px;
  width: 100%;
  bottom: -10px;
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

.user-name {
    font-weight: 600;
    color: var(--textColor);
    margin-right: 15px;
}

.loginsignupbtn .logout {
    background-color: var(--mainColor);
    padding: 6px 20px;
    color: #fff;
    border-radius: 5px;
}

.loginsignupbtn .logout:hover {
    background-color: var(--hoverColor);
    color: #fff;
}


/*hero section css*/

.hero-section {
  width: 100%;
  height: 80vh;
  background-image: url("https://res.cloudinary.com/dy7o6eaby/image/upload/v1729240153/heroback2_mybpmv.png");
  margin-bottom: 90px;
}

.hero {
  width: 100%;
  display: flex;
}

.hero-left {
  width: 50%;
  margin-top: 90px;
}

.hero-left h2 {
  font-size: 40px;
  font-weight: 700;
  color: var(--textColor);
}

.hero-left h2 span {
  color: var(--mainColor);
}

.hero-left p {
  color: var(--textColor);
  margin-top: 25px;
}

.hero-btn {
  gap: 20px;
  margin-top: 40px;
}

.hero-btn .expbtn {
  background-color: var(--mainColor);
  color: #fff;
  border-radius: 5px;
}

.hero-btn .expbtn:hover {
  background-color: var(--hoverColor);
  color: #fff;
}

.hero-btn {
  color: var(--mainColor);
  gap: 40px;
}

.locationbtn {
  gap: 5px;
}

.locationbtn i {
  font-size: 23px;
  cursor: pointer;
}

.locationbtn-a {
  color: var(--textColor);
  text-decoration: none;
}

.hero-right {
  width: 50%;
  height: 80vh;
}

.hero-right-content {
  width: 100%;
  height: 100%;
}

.hero-right-img {
  width: 100%;
  position: relative;
}

.hero-right-img img {
  position: absolute;
  right: -50px;
  width: 550px;
  z-index: -20;
}

.bookbar {
  display: flex;
  align-items: center;
  justify-content: space-between;
  width: 700px;
  border: 2px solid var(--mainColor);
  border-radius: 7px;
  padding: 10px 15px;
  background-color: var(--fillColor);
  margin-top: -50px;
  margin-bottom: 70px;
  z-index: 100;
}

.details {
  display: flex;
  align-items: center;
  gap: 15px;
}

.det-text {
  display: flex;
  flex-direction: column;
  gap: 3px;
}

.det-topic {
  margin: 0;
  font-size: 15px;
  font-weight: 600;
}

.det-topic i {
  color: var(--mainColor);
}
.det-value {
  font-size: 12px;
  margin: 0;
}

.det-icon {
  width: 25px;
  height: 25px;
  border: 1px solid var(--mainColor);
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
}

.det-icon i {
  font-size: 14px;
}

.bookbtn .bbtn {
  background-color: var(--mainColor);
  border-radius: 5px;
  color: #fff;
}

.bookbtn .bbtn:hover {
  background-color: var(--hoverColor);
  color: #fff;
}

.topic-section {
  justify-content: space-between;
  margin-bottom: 40px;
}

.sec-topic {
  color: var(--textColor);
  font-size: 25px;
  font-weight: 600;
}

.sec-topic span {
  color: var(--mainColor);
}

.sec-topic-right p {
  color: var(--smallFontColor);
}

.searchbar {
  border: 1px solid var(--mainColor);
  border-radius: 50px;
  width: 300px;
  padding: 5px 10px;
  padding-left: 20px;
  justify-content: space-between;
  background-color: var(--fillColor);
}

.search input {
  background-color: transparent;
  outline: none;
  border: none;
  color: var(--smallFontColor);
}

.searchbar .bi-search {
  color: var(--mainColor);
}

.destination-card-section {
  width: 100%;
  height: fit-content;
  margin-bottom: 60px;
}

.destination-cards {
  width: 100%;
  display: flex;
  align-items: center;
  gap: 30px;
  overflow-x: hidden;
}

.desti-card {
  width: 250px;
  border-radius: 7px;
  display: flex;
  flex-direction: column;
}

.desti-card img {
  width: 250px;
  height: 250px;
  border-radius: 7px 7px 0 0;
  object-fit: cover;
}

.d-card-text-area {
  width: 100%;
  border-radius: 0 0 7px 7px;
  background-color: #d9d9d9;
  border: 1px solid var(--mainColor);
  border-top: none;
}

.name-fav {
  justify-content: space-between;
  padding: 0 10px;
  padding-top: 5px;
}

.name-fav p {
  margin: 0;
  font-size: 16px;
  font-weight: 600;
}

.fav-icon {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 18px;
  height: 18px;
  padding: 5px;
  padding-top: 8px;
  padding-left: 6px;
  background-color: #fff;
  border-radius: 50%;
}

.name-fav .fav-icon i {
  text-align: center;
  font-size: 10px;
  color: var(--mainColor);
}

.category-text {
  padding: 0 10px;
  padding-top: 5px;
}

.category-text p {
  margin: 0;
  font-size: 13px;
}

.price-rate {
  padding: 0 10px;
  padding-top: 5px;
  justify-content: space-between;
  padding-bottom: 15px;
}

.price-rate p {
  margin: 0;
  font-size: 16px;
  font-weight: 600;
}

.rate-ic {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 18px;
  height: 18px;
  background-color: #fff;
  border-radius: 50%;
}

.rate-ic i {
  text-align: center;
  font-size: 10px;
  color: #fdbb06;
}

.rate-sec {
  gap: 5px;
}

.rate-sec p {
  font-size: 13px;
  font-weight: 500;
}

.rate-sec p span {
  color: var(--mainColor);
}

.sec-desc-sec {
  width: 100%;
  justify-content: space-between;
}

.desc-sec-left {
  width: 50%;
}
.desc-sec-left p {
  width: 500px;
}

.desc-sec-right {
  width: 100px;
  margin-right: 40px;
  gap: 20px;
}

.desc-sec-right i {
  font-size: 25px;
  color: var(--mainColor);
}

.desc-sec-right i:hover {
  color: var(--hoverColor);
}

.topic-spcial-1 {
  margin-bottom: 20px;
}

.topic-sec-spcial-1 {
  margin-bottom: 10px;
}
.v-p-c-name-fav {
  width: 100%;
}

.v-p-c img {
  height: 200px;
}

.v-p-c-name-fav p {
  font-size: 17px;
  padding: 3px 0;
}

.v-p-c-duration {
  width: 100%;
  justify-content: space-between;
  padding: 0 10px;
}

.v-p-c-t-a {
  background-color: #fff;
}

.v-p-c-r-icon {
  color: #fdbb06;
}

.v-p-c-d-text {
  font-size: 12px;
  font-weight: 500;
  padding: 4px 0;
  margin-bottom: 5px;
}

.v-p-c-d-icon {
  color: var(--mainColor);
}

.blog-content {
  width: 100%;
  height: 70vh;
  margin-top: 30px;
  margin-bottom: 100px;
}

.blog-img {
  width: 45%;
}

.blog-img img {
  width: 450px;
  height: 500px;
  object-fit: cover;
  border-radius: 10px;
}

.blog-text {
  width: 55%;
}

.blog-topic {
  font-size: 25px;
  font-weight: 600;
  color: var(--textColor);
}

.blog-read {
  text-decoration: none;
  color: var(--mainColor);
}

.blog-read:hover {
  color: var(--hoverColor);
}

.footer-section {
  background-color: var(--textColor);
}

.footer-content {
  display: flex;
  padding-top: 70px;
  padding-bottom: 50px;
  justify-content: space-between;
}

.footer-logo img {
  width: 200px;
  margin-bottom: 20px;
}

.footer-logo p {
  color: var(--fillColor);
  font-size: 14px;
  margin-bottom: 20px;
}

.footer-logo a {
  padding: 15px 30px;
  background-color: var(--mainColor);
  text-align: center;
  color: var(--fillColor);
  text-decoration: none;
  font-size: 13px;
  border-radius: 3px;
}

.footer-logo a:hover {
  background-color: var(--hoverColor);
}

.f-topic {
  color: var(--fillColor);
  font-size: 22px;
  margin-bottom: 20px;
  cursor: pointer;
}

.f-secs {
  display: flex;
  flex-direction: column;
  gap: 5px;
}

.f-secs a {
  color: var(--fillColor);
  font-size: 14px;
  text-decoration: none;
}

.f-secs a:hover {
  color: var(--hoverColor);
}

.social-icon {
  display: flex;
  gap: 20px;
  margin-top: 40px;
}

.icon-area {
  width: 35px;
  display: flex;
  align-items: center;
  justify-content: center;
  height: 35px;
  border-radius: 50%;
  background-color: var(--fillColor);
}

.icon-area i {
  font-size: 15px;
  color: var(--textColor);
}

.icon-area:hover {
  background-color: var(--hoverColor);
}
    
    
    
    </style>
</head>
<body>
	
   <!-- header section -->
   <header>
    <div class="container">
      <div class="navbar flex">
        <div class="logo">
          <img src="https://res.cloudinary.com/dy7o6eaby/image/upload/v1729239453/logo_qaanax.png" alt="" class="logoimg" />
        </div>
        <div class="navLinks">
          <ul class="flex">
            <li class="navLink"><a class="active-nav" href="home.jsp">Discover</a></li>
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
  <!-- header section end -->


   
    <!-- hero section -->
    <div class="hero-section">
      <div class="container">
        <div class="hero">
          <div class="hero-left">
            <h2>
              Explore Ceylon,<br />
              Embrace <span>Adventure</span>
            </h2>
            <p>
              Explore the breathtaking beauty of Sri Lanka with personalized
              <br />tours, curated just for your perfect adventure.
            </p>
            <div class="hero-btn flex">
              <a href="#" class="btn expbtn">Find Out More</a>
              <div class="locationbtn flex">
                <i class="bi bi-geo-alt-fill"></i>
                <a href="#" class="locationbtn-a">Find Location</a>
              </div>
            </div>
          </div>
          <div class="hero-right">
            <div class="hero-right-content">
              <div class="hero-right-img">
                <img src="https://res.cloudinary.com/dy7o6eaby/image/upload/v1729239536/heroimg4_or0xqf.png" alt="" />
              </div>
            </div>
          </div>
        </div>
        <div class="bookbar">
          <div class="details det1">
            <div class="det-icon"><i class="bi bi-geo-alt-fill"></i></div>
            <div class="det-text">
              <p class="det-topic">
                Location<i class="bi bi-chevron-down"></i>
              </p>
              <p class="det-value">Kandy, Sri Lanka</p>
            </div>
          </div>
          <div class="details det1">
            <div class="det-icon"><i class="bi bi-calendar-event"></i></div>
            <div class="det-text">
              <p class="det-topic">Date<i class="bi bi-chevron-down"></i></p>
              <p class="det-value">Sat, 25 May, 2024</p>
            </div>
          </div>
          <div class="details det1">
            <div class="det-icon"><i class="bi bi-currency-dollar"></i></div>
            <div class="det-text">
              <p class="det-topic">Price<i class="bi bi-chevron-down"></i></p>
              <p class="det-value">$2000-$3000</p>
            </div>
          </div>
          <div class="bookbtn">
            <a href="#" class="bbtn btn">Book Now</a>
          </div>
        </div>
      </div>
    </div>
    <!-- hero section end -->

   <!-- destination section -->
    <div class="destination-section">
      <div class="container">
        <div class="topic-section flex">
          <h2 class="sec-topic">
            Find your best <br /><span>destination</span>
          </h2>
          <div class="sec-topic-right">
            <p>We have more than 350+ destinations you can choose</p>
            <div class="searchbar flex">
              <div class="search">
                <i class="bi bi-geo-alt"></i>
                <input type="text" placeholder="Search Destinations..." />
              </div>
              <i class="bi bi-search"></i>
            </div>
          </div>
        </div>
        <div class="destination-card-section">
          <div class="destination-cards">
          
          <c:forEach  var="pack" items="${packList}">
          <a style="color: black" href="onePackage?id=${pack.id}">
            <div class="desti-card">
              <img src="<c:out value='${pack.image}'/>" alt="" />
              <div class="d-card-text-area">
                <div class="name-fav flex">
                  <p><c:out value="${pack.title}" /></p>
                  <div class="fav-icon"><i class="bi bi-heart-fill"></i></div>
                </div>
                <div class="category-text">
                  <p><c:out value="${pack.category}" /></p>
                </div>
                <div class="price-rate flex">
                  <p>LKR <c:out value="${pack.price}" /></p>
                  <div class="rate-sec flex">
                    <div class="rate-ic"><i class="bi bi-star-fill"></i></div>
                    <p>4.4 <span>56 Ratings</span></p>
                  </div>
                </div>
              </div>
            </div>
            </a>
 			</c:forEach>
 			
          </div>
        </div>
      </div>
    </div>

    <!-- vacation plan section -->
    <div class="destination-section">
      <div class="container">
        <div class="topic-section topic-sec-spcial-1">
          <h2 class="sec-topic topic-spcial-1">
            Best <span>Tour guiders</span>
          </h2>
          <div class="sec-desc-sec flex">
            <div class="desc-sec-left">
              <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.<br> Facere reiciendis et </p>
            </div>
            <div class="desc-sec-right flex">
              <i class="bi bi-arrow-left-circle-fill i-left arrow-icon-left" id="left"></i>
              <i class="bi bi-arrow-right-circle-fill i-right arrow-icon-right" id="right"></i>
            </div>
          </div>
        </div>
        <div class="destination-card-section v-p-s">
          <div class="destination-cards v-p-s-s">
          
           <c:forEach  var="guide" items="${guideList}">
            <div class="desti-card v-p-c">
              <img src="<c:out value='${guide.profilePic}' />" alt="profile" />
              <div class="d-card-text-area v-p-c-t-a">
                <div class="name-fav flex v-p-c-name-fav">
                  <p><c:out value="${guide.name}" /></p>
                  <div class="v-p-c-price-tag"><p><c:out value="${guide.country}" /></p></div>
                </div>
                <div class="v-p-c-duration flex">
                  <p class="v-p-c-d-text"><i class="bi bi-send-fill v-p-c-d-icon"></i><c:out value="${guide.phone}" /></p>
                  <div class="rate-sec v-p-c-rate flex">
                    <p><i class="bi bi-star-fill v-p-c-r-icon"></i>4.4 </p>
                  </div>
                </div>
              </div>
            </div>
            
          </c:forEach>
       
        </div>
      </div>
    </div>

    <!-- blog section -->
    <div class="destination-section">
      <div class="container">
        <div class="topic-section topic-sec-spcial-1">
          <h2 class="sec-topic topic-spcial-1">
            Our <span>Blog</span>
          </h2>
          <div class="sec-desc-sec flex">
            <div class="desc-sec-left">
              <p>Lorem ipsum dolor sit amet consectetur </p>
            </div>
          </div>
        </div>

        <div class="blog-content flex">
          <div class="blog-img">
            <img src="https://i.pinimg.com/564x/e4/16/b2/e416b24fa4b041cc1d3e5c0196a73436.jpg" alt="">
          </div>
          <div class="blog-text">
            <p class="blog-topic">Beautiful Italy<br>Let's Travel</p>
            <p class="blog-para">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Deserunt facere accusantium, accusamus explicabo eos voluptas hic quaerat earum unde odio similique nam sequi voluptate voluptatum saepe porro cumque? A porro itaque modi autem repudiandae quam enim, praesentium nihil placeat impedit. Molestiae unde odio, non debitis voluptates perspiciatis laboriosam voluptatum reiciendis!</p>
            <a class="blog-read" href="#">Read more <i class="bi bi-arrow-right"></i></a>
          </div>
        </div>
      </div>
    </div>


    <!-- footer section -->
    <div class="footer-section">
      <div class="container">
        <div class="footer-content">
          <div class="footer-logo">
            <img src="https://res.cloudinary.com/dy7o6eaby/image/upload/v1729240019/logo_f_ultpyn.png" alt="">
            <p>Get our travel tips to your inbox</p>
            <a href="#">Subscribe</a>
          </div>
          <div class="company-info">
            <p class="f-topic">Company Info</p>
            
             <div class="f-secs">
              <a href="#" class="f-sec">About Us</a>
              <a href="#" class="f-sec">Carrier</a>
              <a href="#" class="f-sec">We are hiring</a>
              <a href="#" class="f-sec">Unlimited Support</a>
              <a href="#" class="f-sec">Privacy</a>
             </div>
            
          </div>
          <div class="contact-info">
            <p class="f-topic">Contact Info</p>
            
              <div class="f-secs">
                <a class="f-sec" href="#">(+94) 78 452 6897</a>
              <a class="f-sec" href="#">ceylontour@gmail.com</a>
              </div>
            
            <div class="social-icon">
              <div class="icon-area"><i class="bi bi-facebook"></i></div>
              <div class="icon-area"><i class="bi bi-twitter-x"></i></div>
              <div class="icon-area"><i class="bi bi-instagram"></i></div>
            </div>
          </div>
        </div>
      </div>
    </div>
	
	
	<script>
	const cards = document.querySelector(".destination-cards");

    // Function to handle mouse wheel scrolling
    const handleWheel = (event) => {
        event.preventDefault(); // Prevent default scroll behavior
        const delta = Math.sign(event.deltaY); // Determine the scroll direction
        cards.scrollBy({ left: delta * 300, behavior: 'smooth' }); // Adjust scroll amount
    }

    // Add event listener for the mouse wheel
    cards.addEventListener("wheel", handleWheel);

	
	</script>
</body>
</html>
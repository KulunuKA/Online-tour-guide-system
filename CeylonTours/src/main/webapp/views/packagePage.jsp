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
<title>Package</title>
<link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
      integrity="sha384-tViUnnbYAV00FLIhhi3v/dWt3Jxw4gZQcNoSCxCIFNJVCx7/D55/wXsrNIRANwdD"
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

.hero-section {
  margin-top: 40px;
}

.hero-content {
  width: 90%;
  margin: auto;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.hero-topic {
  margin-bottom: 30px;
}

.hero-topic h1 {
  font-size: 50px;
  font-weight: 800;
}

.hero-cat {
  gap: 25px;
  margin-bottom: 20px;
}

.cat-set {
  gap: 7px;
  cursor: pointer;
}

.cat-set i,
.cat-set p {
  color: var(--smallFontColor);
  font-size: 18px;
  font-weight: 600;
}

.cat-set i:hover,
.cat-set p:hover {
  color: var(--textColor);
}

.active i,
.active p {
  color: var(--textColor);
}

.searchbar {
  border: 2px solid #ccc;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  border-radius: 50px;
  padding: 17px 6px;
}

.searchbar a {
  padding: 13px 23px;
  background-color: var(--mainColor);
  border-radius: 50px;
  color: black;
  font-weight: 500;
}

.searchbar a:hover {
  background-color: var(--hoverColor);
}

.searchbar input {
  width: 590px;
  border: none;
  outline: none;
}

.searchbar input::placeholder {
  font-size: 16px;
}

.searchbar i {
  padding: 0 4px;
  font-size: 18px;
}

.hello-img {
  width: 100%;
  height: 70vh;
  margin-top: 60px;
  margin-bottom: 40px;
}

.hello-img img {
  width: 100%;
  height: 70vh;
  object-fit: cover;
  border-radius: 15px;
}

.card-section {
  margin-top: 70px;
  margin-bottom: 40px;
}

.card-sec-topic p {
  font-size: 25px;
  color: var(--textColor);
  font-weight: 600;
}

.card-sec-topic p span {
  color: var(--mainColor);
}

.card-sec-desc p {
  color: var(--smallFontColor);
}

.card-sec-container {
  width: 100%;
  overflow: hidden;
  padding: 20px 0;
  position: relative;
}

.card-sec {
  display: flex;
  gap: 20px;
  overflow-x: scroll;
  cursor: grab;
  scroll-behavior: smooth;
  -webkit-overflow-scrolling: touch;
}

.card-sec::-webkit-scrollbar {
  display: none;
}

.item-card {
  width: 250px;
  height: 330px;
  background-color: #fff;
  border-radius: 7px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  overflow: hidden;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  margin: 20px auto;
  display: flex;
  flex-shrink: 0;
  flex-direction: column;
}

.item-card:hover {
  transform: translateY(-10px);
  box-shadow: 0 6px 16px rgba(0, 0, 0, 0.2);
}

.card-image img {
  width: 100%;
  height: 200px;
  object-fit: cover;
}

.card-content {
  padding: 5px 15px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.card-title {
  font-size: 17px;
  margin: 0 0 5px;
  color: black;
}

.card-description {
	height:50px;
  font-size: 15px;
  color: #555;
  margin-bottom: 5px;
}

.card-det {
  gap: 10px;
}

.card-det i {
  font-size: 14px;
  color: var(--mainColor);
}

.card-det p {
  font-size: 15px;
  color: black;
  font-weight: 500;
}

.card-sec-desc-2 {
  width: 100%;
  justify-content: space-between;
}

.card-sec-desc-2 {
  color: var(--smallFontColor);
}

.card-sec-container-2 {
  position: relative;
  width: 100%;
  overflow: hidden;
  display: flex;
  align-items: center;
  margin-top: 20px;
}

.carousel {
  display: flex;
  gap: 20px;
  padding: 20px;
  overflow-x: scroll;
  scroll-behavior: smooth;
  -webkit-overflow-scrolling: touch;
}

.carousel::-webkit-scrollbar {
  display: none;
}

.arrow {
  transform: translateY(-50%);
  background-color: var(--mainColor);
  color: white;
  border: none;
  padding: 10px;
  cursor: pointer;
  z-index: 10;
}

.arrow:hover {
  background-color: var(--hoverColor);
}

.left-arrow {
  left: 10px;
}

.right-arrow {
  right: 10px;
}

.item-card-2 {
  min-width: 300px;
  height: 350px;
  background-color: #fff;
  border-radius: 10px;
  overflow: hidden;
  flex-shrink: 0;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  display: flex;
  flex-direction: column;
}

.item-card-2:hover {
  transform: scale(1.05);
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
}

.card-image-2 img {
  width: 100%;
  height: 180px;
  border-radius: 10px;
  object-fit: cover;
}

.card-content-2 {
  padding: 5px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.card-title-2 {
  font-size: 16px;
  font-weight: 550;
  color: black;
  margin: 10px 0 15px;
}

.card-description-2 {
  font-size: 18px;
  color: black;
  margin: 0 0 15px;
  font-weight: 600;
}

.card-button-2 {
  padding: 10px 20px;
  background-color: var(--mainColor);
  color: white;
  border: none;
  border-radius: 5px;
  font-size: 1em;
  cursor: pointer;
}

.card-button-2:hover {
  background-color: var(--hoverColor);
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
            <li class="navLink"><a href="home">Discover</a></li>
            <li class="navLink" class="active-nav"><a href="packagePage">Tours</a></li>
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
        <div class="hero-content">
          <div class="hero-topic">
            <h1>Where to?</h1>
          </div>
          <div class="hero-cat flex">
            <div class="cat-set flex active">
              <i class="bi bi-house"></i>
              <p>Search All</p>
            </div>
            <div class="cat-set flex">
              <i class="bi bi-houses"></i>
              <p>Hotels</p>
            </div>
            <div class="cat-set flex">
              <i class="bi bi-map"></i>
              <p>Things to Do</p>
            </div>
            <div class="cat-set flex">
              <i class="bi bi-shop"></i>
              <p>Resturants</p>
            </div>
            <div class="cat-set flex">
              <i class="bi bi-airplane"></i>
              <p>Flights</p>
            </div>
            <div class="cat-set flex">
              <i class="bi bi-house-lock"></i>
              <p>Vacation Rentals</p>
            </div>
          </div>
          <div class="hero-search">
            <div class="searchbar">
              <i class="bi bi-search"></i>
              <input
                type="text"
                placeholder="Place to go, things to do, hotels..."
              />
              <a href="#" class="search-btn">Search</a>
            </div>
          </div>
        </div>
        <div class="hello-img">
          <img id="helloheroimg" src="https://nexttravelsrilanka.com/wp-content/uploads/2023/02/Colombo.jpg" alt="" />
        </div>
      </div>
    </div>

    <!-- card section -->
    <div class="card-section">
      <div class="container">
        <div class="card-sec-titile">
          <div class="card-sec-topic">
            <p>Destination Spotlight: <span>Colombo</span></p>
          </div>
          <div class="card-sec-desc">
            <p>
              Discover why Sri Lanka ranks among our 2024 Travelers' Choice Best
              of the Best Destinations.
            </p>
          </div>
        </div>
        <div class="card-sec-container">
          <div class="card-sec">
          
          <c:forEach var="pack" items="${packList}">
			    <a href="onePackage?id=${pack.id}">
			        <div class="item-card">
			            <div class="card-image">
			                <img src="${pack.image}" alt="Item Image" />
			            </div>
			            <div class="card-content">
			                <h3 class="card-title">${pack.title}</h3>
			                <p class="card-description">
			                    ${pack.category}
			                </p>
			                <div class="card-det flex">
			                    <i class="bi bi-send-fill"></i>
			                    <p>${pack.days} days trip</p>
			                </div>
			            </div>
			        </div>
			    </a>
			</c:forEach>

            
          </div>
        </div>
      </div>
    </div>

    <!-- card -section 2 -->
    <div class="card-section">
      <div class="container">
        <div class="card-sec-titile">
          <div class="card-sec-topic">
            <p>Get inspired by our fave travel creators</p>
          </div>
          <div class="card-sec-desc-2 flex">
            <p>Tried-and-true guidance to fuel your next big trip</p>
            <div class="arrow-sec">
              <button class="arrow left-arrow">&lt;</button>
              <button class="arrow right-arrow">&gt;</button>
            </div>
          </div>
        </div>
        <div class="card-sec-container-2">
          <div class="carousel">
            <div class="item-card-2">
              <div class="card-image-2">
                <img src="./src/hello_hero.png" alt="Item 1" />
              </div>
              <div class="card-content-2">
                <p class="card-title-2">By Dilshan kr</p>
                <p class="card-description-2">
                  3 family-friendly days in colombo
                </p>
                <a class="card-button-2">Book Now</a>
              </div>
            </div>
            <div class="item-card-2">
              <div class="card-image-2">
                <img src="./src/hello_hero.png" alt="Item 1" />
              </div>
              <div class="card-content-2">
                <p class="card-title-2">By Dilshan kr</p>
                <p class="card-description-2">
                  3 family-friendly days in colombo
                </p>
                <a class="card-button-2">Book Now</a>
              </div>
            </div>
            <div class="item-card-2">
              <div class="card-image-2">
                <img src="./src/hello_hero.png" alt="Item 1" />
              </div>
              <div class="card-content-2">
                <p class="card-title-2">By Dilshan kr</p>
                <p class="card-description-2">
                  3 family-friendly days in colombo
                </p>
                <a class="card-button-2">Book Now</a>
              </div>
            </div>
            <div class="item-card-2">
              <div class="card-image-2">
                <img src="./src/hello_hero.png" alt="Item 1" />
              </div>
              <div class="card-content-2">
                <p class="card-title-2">By Dilshan kr</p>
                <p class="card-description-2">
                  3 family-friendly days in colombo
                </p>
                <a class="card-button-2">Book Now</a>
              </div>
            </div>
            <div class="item-card-2">
              <div class="card-image-2">
                <img src="./src/hello_hero.png" alt="Item 1" />
              </div>
              <div class="card-content-2">
                <p class="card-title-2">By Dilshan kr</p>
                <p class="card-description-2">
                  3 family-friendly days in colombo
                </p>
                <a class="card-button-2">Book Now</a>
              </div>
            </div>
            <div class="item-card-2">
              <div class="card-image-2">
                <img src="./src/hello_hero.png" alt="Item 1" />
              </div>
              <div class="card-content-2">
                <p class="card-title-2">By Dilshan kr</p>
                <p class="card-description-2">
                  3 family-friendly days in colombo
                </p>
                <a class="card-button-2">Book Now</a>
              </div>
            </div>
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


<script type="text/javascript">

document.addEventListener("DOMContentLoaded", function () {
	 console.log(window.location.pathname)
	  const loginImage = document.getElementById("helloheroimg");
	 
	  let index = 0;
	  const images = [
	    {
	      url: "https://cf.bstatic.com/xdata/images/hotel/max1024x768/588945741.jpg?k=0c6c7b0fd96d38c70101f6b57ddb2e75eeece3889616d3a28877f5cc3d5fd7ef&o=&hp=1",
	  
	    },
	    {
	      url: "https://archives1.dailynews.lk/sites/default/files/news/2019/08/21/beauti-sl.jpg",
	     
	    },
	    {
	      url: "https://nextvacay.com/wp-content/uploads/2022/07/KW-why-travel-is-important.jpg",
	      
	    },
	  ];

	  setInterval(() => {
	    loginImage.src = images[index].url;
	    index = (index + 1) % images.length;
	  }, 3000);
	});
	


const carousel = document.querySelector('.card-sec');
let isDragging = false;
let startPos = 0;
let currentTranslate = 0;
let prevTranslate = 0;
let animationID = 0;
let startX = 0;

carousel.addEventListener('mousedown', (e) => {
  isDragging = true;
  startPos = getPositionX(e);
  startX = carousel.scrollLeft;
  carousel.classList.add('grabbing');
});

carousel.addEventListener('mousemove', (e) => {
  if (!isDragging) return;
  const currentPosition = getPositionX(e);
  const movement = startPos - currentPosition;
  carousel.scrollLeft = startX + movement;
});

carousel.addEventListener('mouseup', () => {
  isDragging = false;
  carousel.classList.remove('grabbing');
});

carousel.addEventListener('mouseleave', () => {
  isDragging = false;
  carousel.classList.remove('grabbing');
});

carousel.addEventListener('touchstart', (e) => {
  isDragging = true;
  startPos = getPositionX(e.touches[0]);
  startX = carousel.scrollLeft;
});

carousel.addEventListener('touchmove', (e) => {
  if (!isDragging) return;
  const currentPosition = getPositionX(e.touches[0]);
  const movement = startPos - currentPosition;
  carousel.scrollLeft = startX + movement;
});

carousel.addEventListener('touchend', () => {
  isDragging = false;
});

function getPositionX(e) {
  return e.pageX || e.touches[0].clientX;
}

const carousel2 = document.querySelector('.carousel');
const leftArrow = document.querySelector('.left-arrow');
const rightArrow = document.querySelector('.right-arrow');
let scrollAmount = 0;

leftArrow.addEventListener('click', () => {
  carousel2.scrollLeft -= 300; 
});

rightArrow.addEventListener('click', () => {
  carousel2.scrollLeft += 300;
});


</script>

</body>
</html>
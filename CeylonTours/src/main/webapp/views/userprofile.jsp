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
<title>User Profile</title>
<link rel="stylesheet" href="../assests/css/userprofile.css"/>
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
/* Profile Section */
.profile-sec {
  width: 100%;
  padding: 50px 0;
  margin-bottom: 50px;
  display: flex;
  align-items: center;
  justify-content: space-around;
  border: 1px solid #e6e6e6;
  border-radius: 10px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
}

.pro-img {
  text-align: center;
}

.pro-text {
  width: 60%;
  padding-left: 40px;
}

.img-sec img {
  width: 120px;
  height: 120px;
  object-fit: cover;
  border-radius: 50%;
}

.img-name-sec {
  display: flex;
  flex-direction: column;
  gap: 10px;
  align-items: center;
  margin-top: 10px;
}

.img-name-sec p {
  font-size: 20px;
  font-weight: 600;
  color: var(--textColor);
}

.img-name-sec a {
  text-decoration: none;
  background-color: var(--mainColor);
  padding: 4px 8px;
  color: var(--fillColor);
  border-radius: 5px;
  font-size: 13px;
}

.img-name-sec a:hover {
  background-color: var(--hoverColor);
}

.double-sec,
.singl-sec {
  display: flex;
  gap: 40px;
  margin-bottom: 20px;
}

.info-sec,
.info-secs {
  width: 50%;
}

.sec-det {
  background-color: #f8f8f8;
  height: 38px;
  padding: 8px 12px;
  border-radius: 5px;
  font-size: 15px;
  color: #333;
  border: 1px solid #e0e0e0;
}

.button-section {
  margin-top: 30px;
  text-align: center;
}

.history-btn {
  background-color: var(--mainColor);
  color: var(--fillColor);
  padding: 10px 25px;
  border-radius: 5px;
  font-size: 14px;
  text-decoration: none;
}

.history-btn:hover {
  background-color: var(--hoverColor);
  color: #fff;
}

/* Footer Section */
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


      /* Modal container */
      .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        justify-content: center;
        align-items: center;
      }

      /* Modal content */
      .modal-content {
        background-color: #fefefe;
        padding: 20px;
        border-radius: 10px;
        text-align: center;
        width: 300px;
      }

      /* Close button */
      .close-btn {
        color: #aaa;
        float: right;
        font-size: 24px;
        font-weight: bold;
        cursor: pointer;
      }

      .close-btn:hover,
      .close-btn:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
      }

      /* Update button */
      .update-btn {
        background-color: #26a59e;
        border: none;
        padding: 10px;
        color: white;
        cursor: pointer;
        border-radius: 5px;
      }

      .update-btn:hover {
        background-color: #2dc5bd;
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
    <!-- header section end -->

    <!-- Profile Section -->
    <div class="profile-section">
      <div class="container">
        <div class="profile-sec">
          <div class="pro-img">
            <div class="img-sec">
            <img class="profile-img" id="profileImg" src="<c:out value="${ts.profileImg }"></c:out>" />


              
              <div class="img-name-sec">
                <p class="name-tag"><c:out value="${ts.fName }"></c:out> <c:out value="${ts.lName }"></c:out></p>
                <a href="updateProfile?id=<%= session.getAttribute("id") %>"><i class="bi bi-pen"></i> Edit</a>
              </div>
            </div>
          </div>
          <div class="pro-text">
            <div class="double-sec">
              <div class="info-sec">
                <p class="sec-name">First Name</p>
                <p class="sec-det"><c:out value="${ts.fName }"></c:out></p>
              </div>
              <div class="info-sec">
                <p class="sec-name">Last Name</p>
                <p class="sec-det"><c:out value="${ts.lName }"></c:out></p>
              </div>
            </div>
            <div class="double-sec">
              <div class="info-sec">
                <p class="sec-name">Country</p>
                <p class="sec-det"><c:out value="${ts.country }"></c:out></p>
              </div>
              <div class="info-sec">
                <p class="sec-name">Telephone</p>
                <p class="sec-det"><c:out value="${ts.telephone }"></c:out></p>
              </div>
            </div>
            <div class="singl-sec">
              <div class="info-secs">
                <p class="sec-name">Email</p>
                <p class="sec-det"><c:out value="${ts.email }"></c:out></p>
              </div>
            </div>
            <div class="button-section">
              <a href="bookingHistory?id=<%= session.getAttribute("id") %>" class="btn history-btn">Tour Booking History</a>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- footer section -->
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
      <!-- Modal for updating profile image -->
    <div id="profileModal" class="modal">
      <div class="modal-content">
        <span class="close-btn" id="closeModal">&times;</span>
        <h3>Update Profile Image</h3>
        <form
          action="uploadProfileimage"
          method="post"
          enctype="multipart/form-data"
        >
          <input
            type="file"
            name="profileImg"
            accept="image/*"
            required
          /><br /><br />
          <button type="submit" class="update-btn">Update</button>
        </form>
      </div>
    </div>

    <script>
      // Get the modal and profile image
      var modal = document.getElementById("profileModal");
      var profileImg = document.getElementById("profileImg");

      // Get the close button
      var closeModal = document.getElementById("closeModal");

      // When the user clicks on the profile image, open the modal
      profileImg.onclick = function () {
        modal.style.display = "flex";
      };

      // When the user clicks on the close button, close the modal
      closeModal.onclick = function () {
        modal.style.display = "none";
      };

      // When the user clicks anywhere outside of the modal, close it
      window.onclick = function (event) {
        if (event.target == modal) {
          modal.style.display = "none";
        }
      };
    </script>

</body>
</html>
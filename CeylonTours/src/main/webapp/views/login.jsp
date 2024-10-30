<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Loging form</title>

<link rel="stylesheet" href="../assests/css/login.css"/>
<link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
    />
    
</head>

<style>

@import url("https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap");

* {
  font-family: "outfit";
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
.loginConatiner {
  display: flex;
  justify-content: space-between;
  align-items: center;
  height: 100vh;
  /* background: #f5f5f5; */
}
.imgSlider {
  width: 50%;
  height: 100%;
}
.imgSlider img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  position: relative;
  border-radius: 0 50px 50px 0;
}
.imgSlider p {
  width: 50%;
  height: 20%;
  font-size: 40px;
  text-align: center;
  position: absolute;
  bottom: 0;
  left: 0;
  background: rgba(0, 0, 0, 0.5);
  border-radius: 0 0 50px 0;
  color: #fff;
  padding: 10px;
}
.loginBox {
  width: 50%;
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.loginSec {
  width: 400px;
  height: 500px;
  padding: 10px;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 50px;
}

.loginSec form {
  width: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 20px;
}

.login-input {
  width: 100%;
  padding: 10px;
  border-radius: 30px;
  border: #b3abbc 1px solid;
  font-family: outfit;
  font-size: 16px;
  font-weight: 400;
  color: rgba(104, 88, 121, 1);
  display: inline-flex;
  align-items: center;
}

.login-input input {
  width: 100%;
  height: 20px;
  padding: 10px;
  border-radius: 30px;
  border: none;
  font-family: outfit;
  font-size: 16px;
  font-weight: 400;
  color: rgba(104, 88, 121, 1);
}

.login-input input:focus {
  outline: none;
}
.remember {
  display: flex;
  justify-content: space-between;
  font-size: 16px;
  font-weight: 400;
  color: rgba(104, 88, 121, 1);
  width: 100%;
}

.remember a{
  text-decoration: none;
  color: rgba(104, 88, 121, 1);
}


.loginSec form button {
  width: 100%;
  padding: 10px;
  border-radius: 30px;
  font-family: outfit;
  font-size: 16px;
  font-weight: 400;
  color: #fff;
  background: #26a59e;
  border: none;
  cursor: pointer;
}
.google-login {
  width: 100%;
  background: #fff;
  display: inline-flex;
  justify-content: center;
  align-items: center;
  gap: 10px;
  font-family: outfit;
  font-size: 16px;
  border-radius: 30px;
  font-weight: 400;
  color: rgba(104, 88, 121, 1);
  border: #b3abbc 1px solid;
  padding: 5px 0;
}
.google-login:hover {
  cursor: pointer;
}
.signup{
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 10px;
  font-family: outfit;
  font-size: 16px;
  font-weight: 400;
  color: rgba(104, 88, 121, 1);
}

.signup span{
  text-decoration: none;
  color: #26a59e;
  font-weight: 600;
  cursor: pointer;
}

/* Popup */
.sign-up-popup{
  display: none;
  /* display: flex; */
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  z-index: 1000;
  justify-content: center;
  align-items: center;
}

.sign-up-popup-content{
  width: 1000px;
  /* height: 00px; */
  background: #fff;
  border-radius: 20px;
  padding: 20px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-between;
  animation: fadeIn 0.5s ease;
  transform: scale(0.7); 
  transition: opacity 0.3s ease, transform 0.3s ease;
}

.sign-up-popup-header{
  width: 100%;
  display: flex;
  justify-content: flex-end;
  align-items: center;
  font-size: 40px;
}


.loginModal-con {
  width: 900px;
  min-height: 412px;
  padding: 20px;
  display: inline-flex;
  align-items: center;
  justify-content: space-between;
  gap: 10;
}

.subContainer {
  width: 390px;
  min-height: 320px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  padding: 24px;
  border-radius: 20px;
  cursor: pointer;
  border: 2px solid rgba(179, 171, 188, 1);
  text-decoration: none;
}

.subContainer img {
  width: 200px;
  height: 200px;
  object-fit: fill;
}

.subContainer:hover {
  border: 2px solid #26a59e;
}

.subSection {
  width: 242px;
  height: 56px;
  text-align: center;
}

.subSection p:first-child {
  font-size: 26px;
  font-weight: 800;
  font-family: outfit;
}

.subSection p:nth-child(2) {
  font-weight: 400;
  font-size: 20px;
  color: rgba(104, 88, 121, 1);
  font-family: outfit;
}

 /* Notification box styling */
  .notification-box {
    position: fixed;
    top: -100px; /* Initially hide above the viewport */
    left: 50%;
    transform: translateX(-50%);
    width: 90%; /* Responsive width */
    max-width: 400px;
    background-color: #f44336; /* Red background for error */
    color: white;
    padding: 15px;
    text-align: center;
    font-size: 16px;
    border-radius: 5px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    opacity: 0;
    transition: top 0.5s ease, opacity 0.5s ease;
    z-index: 1000; /* Make sure it appears on top */
  }

  /* Class to show the notification */
  .show-notification {
    top: 20px; /* Slide down from the top */
    opacity: 1;
  }
  

</style>


<body>

 <div class="loginConatiner">
      <div class="imgSlider">
        <img
          src="https://images.pexels.com/photos/17291164/pexels-photo-17291164/free-photo-of-television-tower-in-brasilia.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
          alt="login"
          id="loginImage"
        />
        <p id="imgInfo">Travel with safe guider</p>
      </div>
      <div class="loginBox">
   <% 
    String errorMessage = request.getParameter("error");
    if (errorMessage != null) { 
%>
    <div id="error-message" class="notification-box">
        <%= errorMessage %>
    </div>
<% 
    } 
%>
        <div class="loginSec">
          <h1>Login</h1>
          <form action="loginUser" method="post">
            <section class="login-input">
              <i class="bi bi-envelope"></i>
              <input
                type="email"
                name="email"
                placeholder="Email"
                required
              />
            </section>
            <section class="login-input">
              <i class="bi bi-lock"></i>
              <input
                type="password"
                name="password"
                placeholder="Password"
                required
              />
            </section>
            <section class="remember">
              <section>
                <input type="checkbox" name="remember" id="remember" />
                <label for="remember">Remember me</label>
              </section>
              <a href="#">Forgot password?</a>
            </section>
            <button type="submit">Login</button>
          </form>

          <section class="google-login">
            <img src="https://res.cloudinary.com/dy7o6eaby/image/upload/v1729288964/google-logo_gz49qv.png" style="width: 28px" />
            <p>Login with google</p>
          </section>

          <section class="signup">
            <p>Don't have an account?</p>
            <span onclick="handleModal(true)">Sign up</span>
          </section>
        </div>
      </div>
    </div>

    <!-- Sign up popup -->
     <div class="sign-up-popup" onclick="handleModal(false)">
      <div class="sign-up-popup-content">
        <div class="sign-up-popup-header">
          <i class="bi bi-x" id="close" style="cursor: pointer;" onclick="handleModal(false)"></i>
          </div>
        <section  class="loginModal-con">
          <a
          href="touristreg.jsp"
            class="subContainer"
          >
            <img src="https://image.freepik.com/free-vector/tourist-couple-cartoons_24640-35071.jpg" alt="Foodie" />
            <section class="subSection">
              <p>Tourist</p>
              <p>Join with Us to Plan your next trip</p>
            </section>
          </a>

          <a
            class="subContainer"
            href="guidereg.jsp"
          >
            <img src="https://th.bing.com/th/id/R.d5a95f43bb6cddc85a21a7de615fde29?rik=FN6bOtJdqJZ5rQ&pid=ImgRaw&r=0"  alt="Restaurant" />
            <section class="subSection">
              <p>Guider</p>
              <p>Be a Ceylon Tour Guider</p>
            </section>
          </a>
        </section>
     </div>
     
     <script>
     
     document.addEventListener("DOMContentLoaded", function () {
    	 console.log(window.location.pathname)
    	  const loginImage = document.getElementById("loginImage");
    	  const imgInfo = document.getElementById("imgInfo");

    	  let index = 0;
    	  const images = [
    	    {
    	      url: "https://images.pexels.com/photos/17291164/pexels-photo-17291164/free-photo-of-television-tower-in-brasilia.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    	      text: "Having a tour through the city streets",
    	    },
    	    {
    	      url: "https://images.pexels.com/photos/5064672/pexels-photo-5064672.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    	      text: "Travel with safe guider",
    	    },
    	    {
    	      url: "https://images.pexels.com/photos/6140458/pexels-photo-6140458.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    	      text: "Travel with safe guider",
    	    },
    	  ];

    	  setInterval(() => {
    	    loginImage.src = images[index].url;
    	    imgInfo.innerText = images[index].text;
    	    index = (index + 1) % images.length;
    	  }, 3000);
    	});

    	const handleModal = (state) => {
    	  const modal = document.getElementsByClassName("sign-up-popup");
    	  if (!state) {
    	    modal[0].style.display = "none";

    	    return;
    	  } else {
    	    modal[0].style.display = "flex";
    	    modal[0].style.transform = "scale(1)";
    	  }
    	};
		
    	 // JavaScript to show and hide the error message after 5 seconds
  	  window.onload = function() {
  	    const errorBox = document.getElementById('error-message');
  	    if (errorBox) {
  	      // Add class to show notification
  	      errorBox.classList.add('show-notification');
  	      
  	      // Hide the notification after 5 seconds
  	      setTimeout(function() {
  	        errorBox.classList.remove('show-notification');
  	      }, 5000); // 5 seconds
  	    }
  	  };
     
     </script>

</body>
</html>
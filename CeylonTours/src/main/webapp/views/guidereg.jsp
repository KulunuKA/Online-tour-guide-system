<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
    />
    <title>register</title>
    <link rel="stylesheet" href="style.css" />
    
    <style>
    
    @import url("https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap");

* {
  font-family: "outfit";
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
.tourist-regi {
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

.t-regi-box {
  width: 50%;
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.t-regi-sec {
  width: 400px;
  min-height: 500px;
  padding: 10px;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 50px;
}

.t-regi-sec form {
  width: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 20px;
}

.t-regi-input {
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

.t-regi-input input {
  width: 100%;
  height: 20px;
  padding: 10px;
  border: none;
  outline: none;
  font-family: outfit;
  font-size: 16px;
  font-weight: 400;
  color: rgba(104, 88, 121, 1);
}

.t-regi-input input:focus {
  outline: none;
}

.t-regi-input select {
  width: 100%;
  height: 20px;
  padding: 10px;
  border: none;
  outline: none;
  font-family: outfit;
  font-size: 16px;
  font-weight: 400;
  color: rgba(104, 88, 121, 1);
}

.t-regi-input option {
  font-family: outfit;
  font-size: 16px;
  font-weight: 400;
  color: rgba(104, 88, 121, 1);
}

.t-regi-sec form button {
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
.signup {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 10px;
  font-family: outfit;
  font-size: 16px;
  font-weight: 400;
  color: rgba(104, 88, 121, 1);
}

.signup span {
  text-decoration: none;
  color: #26a59e;
  font-weight: 600;
  cursor: pointer;
}

.t-regi-input {
    margin-bottom: 10px; /* Add space between input sections */
    position: relative;
  }

  /* Ensure error message is positioned below the input */
  .error-message {
    color: red;
    font-size: 12px;
    margin-top: 5px;
    display: block;
    position: absolute; /* Keeps error message in flow of document but positions it relative to input */
    bottom: -18px; /* Positions error message just under the input */
    left: 40px; /* Adjust based on icon and input alignment */
  }

  .t-regi-input input {
    width: 100%;
    padding: 10px;
    box-sizing: border-box;
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
    
  </head>

  <body>
    <div class="tourist-regi">
      <div class="imgSlider">
        <img
          src="https://images.pexels.com/photos/17291164/pexels-photo-17291164/free-photo-of-television-tower-in-brasilia.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
          alt="login"
          id="loginImage"
        />
        <p id="imgInfo">Travel with safe guider</p>
      </div>

      <div class="t-regi-box">
        <div class="t-regi-sec">
          <h1>Register</h1>
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
          
          
          <form action="registerGuide" onsubmit="return validateForm()">
            <section class="t-regi-input">
              <i class="bi bi-person"></i>
              <input
                type="text"
                name="username"
                placeholder="Username"
                required
              />
            </section>
  <section class="t-regi-input">
    <i class="bi bi-envelope"></i>
    <input
      type="email"
      name="email"
      placeholder="Email"
      required
      oninput="validateEmail(this)"
    />
    <!-- Error message for Email -->
    <span class="error-message" id="email-error"></span>
  </section>
  
              <section class="t-regi-input">
    <i class="bi bi-lock"></i>
    <input
      type="password"
      name="password"
      placeholder="Password"
      minlength="5"
      required
    />
    <!-- Error message for Password -->
    <span class="error-message" id="password-error"></span>
  </section>
            <section class="t-regi-input">
              <i class="bi bi-globe-americas"></i>
              <select id="countrySelect" name="country" aria-label="Select your country">
                <option value="0" disabled selected>Select your country</option>
                <option value="Bangladesh">Bangladesh</option>
                <option value="India">India</option>
                <option value="Pakistan">Pakistan</option>
                <option value="Sri Lanka">Sri Lanka</option>
                <option value="Nepal">Nepal</option>
                <option value="Bhutan">Bhutan</option>
              </select>
            </section>

            <section class="t-regi-input">
              <i class="bi bi-telephone"></i>
              <input type="text" name="telephone" required placeholder="Phone" />
            </section>

            <button type="submit">Register</button>
          </form>
          <section class="google-login">
            <img src="https://res.cloudinary.com/dy7o6eaby/image/upload/v1729288964/google-logo_gz49qv.png" style="width: 28px" />
            <p>Sign up with google</p>
          </section>

          <section class="signup">
            <p>Do have an account?</p>
            <a href="login.jsp">Login</a>
          </section>
        </div>
      </div>
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
    	
    	// Custom email validation
  	  function validateEmail(input) {
  	    const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
  	    const emailError = document.getElementById("email-error");

  	    if (!emailPattern.test(input.value)) {
  	      emailError.textContent = "Please enter a valid email address.";
  	    } else {
  	      emailError.textContent = ""; // Clear error message
  	    }
  	  }

  	  // Custom form validation
  	  function validateForm() {
  	    let valid = true; // Keeps track if the form is valid

  	    // First Name Validation
  	    const fname = document.querySelector('input[name="fname"]');
  	    const fnameError = document.getElementById("fname-error");
  	    if (fname.value.trim() === "") {
  	      fnameError.textContent = "First name is required.";
  	      valid = false;
  	    } else {
  	      fnameError.textContent = ""; // Clear error message
  	    }

  	    // Last Name Validation
  	    const lname = document.querySelector('input[name="lname"]');
  	    const lnameError = document.getElementById("lname-error");
  	    if (lname.value.trim() === "") {
  	      lnameError.textContent = "Last name is required.";
  	      valid = false;
  	    } else {
  	      lnameError.textContent = ""; // Clear error message
  	    }

  	    // Email Validation
  	    const email = document.querySelector('input[name="email"]');
  	    const emailError = document.getElementById("email-error");
  	    const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
  	    if (!emailPattern.test(email.value)) {
  	      emailError.textContent = "Please enter a valid email address.";
  	      valid = false;
  	    } else {
  	      emailError.textContent = ""; // Clear error message
  	    }

  	    // Password Validation
  	    const password = document.querySelector('input[name="password"]');
  	    const passwordError = document.getElementById("password-error");
  	    if (password.value.length < 5) {
  	      passwordError.textContent = "Password must be at least 5 characters long.";
  	      valid = false;
  	    } else {
  	      passwordError.textContent = ""; // Clear error message
  	    }

  	    // Return whether the form is valid or not
  	    return valid;
  	  }
    	
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
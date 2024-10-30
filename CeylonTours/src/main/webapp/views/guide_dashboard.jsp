<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<% 
 if(session.getAttribute("id") == null && session.getAttribute("role") != "guide"){
	 response.sendRedirect("login.jsp");       
     return;  
 }
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>

<style type="text/css">
@import url("https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap");

* {
  font-family: "outfit";
}

.navbar {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 15px 60px;
  box-shadow: 0 1px 3px -2px black;
  margin-bottom: 1px;
  background: white;
}
.navbar img {
  width: 150px;
}
.dashBoard {
  display: flex;
  gap: 30px;
}

.sidebar {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding-top: 30px;
  gap: 20px;
  width: 358px;
  height: 100vh;
  background: white;
}
.sidebar-item {
  display: flex;
  align-items: center;
  padding-left: 30px;
  border-radius: 6px;
  background: #f6f6f6;
  width: 294px;
  height: 64px;
  gap: 20px;
  cursor: pointer;
  font-size: 17px;
  font-weight: 500;
}
.sidebar-item img {
  width: 50px;
  object-fit: fill;
}

.content{
	width: 100%;
 
}

.addproduct {
  width: 800px;
  min-height: 750px;
  padding: 40px 75px;
  margin-top: 30px;
  border-radius: 6px;
  background: #fff;
}
.addproduct-itemfield {
  width: 100%;
  color: #7b7b7b;
  font-size: 18px;
  font-weight: 500;
}

.addproduct-itemfield input {
  width: 100%;
  height: 65px;
  border-radius: 4px;
  padding-left: 20px;
  border: 1px solid #c3c3c3;
  outline: none;
  color: #7b7b7b;
  font-family: Poppins;
  font-size: 15px;
  font-family: "outfit";
}

textarea{
width: 100%;
  height: 65px;
}
.addproduct-price {
  display: flex;
  gap: 50px;
}
.add-product-selector {
  padding: 10px 10px;
  height: 65px;
  font-size: 18px;
  color: #7b7b7b;
  border: 1px solid #7b7b7b8d;
  border-radius: 4px;
}
.addproduct-itemfield div {
  display: flex;
  width: 25%;
}
.addproduct-thumbnail-img {
  height: 120px;
  width: 120px;
  border-radius: 10px;
  object-fit: contain;
}
.addproduct-itemfield div img {
  margin-left: -30px;
}
.addproduct-btn {
  margin-top: 50px;
  width: 205px;
  height: 60px;
  border-radius: 6px;
  background: #26a59e;
  border: none;
  cursor: pointer;
  color: #fff;
  font-size: 18px;
  font-weight: 500;
} .listproduct {
            margin: 40px auto;
            padding: 20px;
            width: 80%;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .listproduct-title {
            text-align: center;
            font-size: 2rem;
            color: var(--textColor);
            margin-bottom: 30px;
        }

        .listproduct-table {
            width: 100%;
            border-collapse: collapse;
            background-color: var(--tableBackground);
        }

        .listproduct-header-row {
            background-color: var(--mainColor);
            color: white;
        }

        .listproduct-header {
            padding: 12px;
            text-align: left;
            font-weight: bold;
            border-bottom: 1px solid var(--borderColor);
        }

        .listproduct-row:nth-child(even) {
            background-color: #f3f3f3;
        }

        .listproduct-data {
            padding: 12px;
            border-bottom: 1px solid var(--borderColor);
        }

        .listproduct-product-icon {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 8px;
        }

        .edit-btn, .remove-button {
            padding: 8px 12px;
            border: 1px solid #26a59e;
            color: #26a59e;
            text-decoration: none;
            border-radius: 5px;
            font-size: 0.9rem;
            transition: background-color 0.3s, color 0.3s;
            display: inline-block;
        }

        .edit-btn:hover {
            background-color: #26a59e;
            color: white;
        }

        .remove-button:hover {
            background-color: red;
            color: white;
            border-color: red;
        }

        @media (max-width: 768px) {
            .listproduct {
                width: 95%;
            }

            .listproduct-title {
                font-size: 1.5rem;
            }

            .listproduct-product-icon {
                width: 60px;
                height: 60px;
            }
        }}
/* General profile styling */
.profile {
    background-color: #f9f9f9; /* Light background */
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
}

.profile-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    position: relative;
}

/* Cover Photo Section */
.cover-photos {
    width: 100%;
    height: 250px; /* Adjust the height of the cover photo */
    overflow: hidden;
    position: relative;
    margin-bottom: -60px; /* Negative margin to overlap profile photo */
}

.cover-photo {
    width: 100%;
    height: 100%;
    object-fit: cover; /* Ensure the cover photo fills the container */
    border-radius: 10px;
}

/* Profile Info Section */
.profile-info {
    text-align: center;
    padding: 15px;
}

.profile-header {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-bottom: 20px;
}

/* Profile Photo (Logo) */
.profile-logo {
    width: 120px;
    height: 120px;
    border-radius: 50%;
    object-fit: cover; /* Ensure the profile photo fits within the circular container */
    border: 4px solid white; /* White border to make it stand out */
    position: relative;
    top: -60px; /* Moves the profile photo to overlap the cover photo */
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2); /* Add shadow for better visibility */
}

.profile-name {
    font-size: 28px;
    color: #333; /* Darker text color */
    margin: 15px 0 5px;
    position: relative;
    top: -40px; /* Adjust position to follow the profile photo overlap */
}

.profile-description {
    font-size: 16px;
    color: #555;
    margin-bottom: 15px;
    position: relative;
    top: -40px; /* Adjust position */
}

/* Contact Info */
.contact-info {
    background-color: #fff;
    padding: 15px;
    border-radius: 8px;
    box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
    width: 100%;
    max-width: 400px;
    text-align: left;
    position: relative;
    top: -40px; /* Adjust position */
}

.contact-info p {
    font-size: 14px;
    color: #444;
}

/* Action Buttons */
.profile-actions {
    display: flex;
    gap: 10px;
    justify-content: center;
    margin-top: 10px;
    position: relative;
    top: -40px; /* Adjust position */
}

.profile-actions a {
    text-decoration: none;
    padding: 10px 20px;
    font-size: 16px;
    font-weight: 600;
    color: white;
    border-radius: 8px;
    border: none;
    transition: background-color 0.3s ease, transform 0.3s ease;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    cursor: pointer;
}

/* Edit button */
.edit-button {
    background-color: #26a59e; /* Blue */
}

.edit-button:hover {
    background-color: #2dc5bd; /* Darker blue */
}

/* Delete button */
.delete-button {
    background-color: #dc3545; /* Red */
}

.delete-button:hover {
    background-color: #c82333; /* Darker red */
}

/* Logout button */
.logout-button {
    background-color: #6c757d; /* Gray */
}

.logout-button:hover {
    background-color: #5a6268; /* Darker gray */
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

	
	 <div class="navbar">
      <img src="https://res.cloudinary.com/dy7o6eaby/image/upload/v1729239453/logo_qaanax.png" alt="logo" />
    </div>
    
    <div class="dashBoard">
      <div class="sidebar">
        <div class="sidebar-item" onclick="changeTab(1)">
          <img src="https://res.cloudinary.com/dy7o6eaby/image/upload/v1729286634/user_nkaihu.png" alt="" />
          <p>Profile</p>
        </div>
        <div class="sidebar-item" onclick="changeTab(2)">
          <img src="https://res.cloudinary.com/dy7o6eaby/image/upload/v1729286746/note_j5uiqw.png" alt="" />
          <p>Add Package</p>
        </div>
        <div class="sidebar-item" onclick="changeTab(3)">
          <img src="https://res.cloudinary.com/dy7o6eaby/image/upload/v1729286633/folder_ujvdrv.png" alt="" />
          <p>Package List</p>
        </div>
      </div>

      <div class="content">
      
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

        <!-- Add Package -->
        <div class="addproduct" id="tab1">
        <form action="addpackage" method="post">
          <div class="addproduct-itemfield">
            <p>Package title</p>
            <input type="text" name="title" required placeholder="Type here" value="Honeymoon Tour in Sri Lanka
            "/>
          </div>
          <div class="addproduct-itemfield">
            <p>Description</p>
            <input
              type="text"
              name="description"
              placeholder="description here"
              maxLength="255"
              required
             value="Experience the ultimate 12-day romantic getaway with our Honeymoon Tour Package in Sri Lanka. Discover the serene beauty and rich heritage of Kurunegala, Dambulla, Polonnaruwa, Habarana, and Minneriya"
            />
          </div>
          <div class="addproduct-price">
            <div class="addproduct-itemfield">
              <p>Price</p>
              <input type="text" required name="price" placeholder="Type here" value="100000"/>
            </div>
            <div class="addproduct-itemfield">
              <p>Days</p>
              <select name="days" class="add-product-selector" id="daysSelector">
              <option value="">Select Days</option>
              <option value="7">7 Days</option>
              <option value="20">20 Days</option>
              <option value="30">30 Days</option>
            </select>
            </div>
          </div>
          
           <div class="addproduct-itemfield" id="daysContainer">
         </div>
          
          <div class="addproduct-itemfield">
            <p>Package Image</p>
            <label for="file-input">
              <img class="addproduct-thumbnail-img" src="" alt="add Img" id="display"/>
            </label>
            <input type="text" required name="image" id="file-input" placeholder="Enter image URL"/>
          </div>
          
          <div class="addproduct-itemfield">
            <p>Package category</p>
            <select name="category" class="add-product-selector">
              <option value="Honeymoon Tour in Sri Lanka">Honeymoon Tour in Sri Lanka</option>
              <option value="Sri Lankan 10 Days Round Tour">Sri Lankan 10 Days Round Tour</option>
              <option value="kid">Kid</option>
            </select>
          </div>
          
        

          <button type="submit" class="addproduct-btn">ADD</button>
          </form>
        </div>

        <!-- List -->
        <div class="listproduct" id="tab2">
        <h1 class="listproduct-title">All Package List</h1>

        <table class="listproduct-table">
            <thead>
                <tr class="listproduct-header-row">
                    <th class="listproduct-header">Image</th>
                    <th class="listproduct-header">Id</th>
                    <th class="listproduct-header">Title</th>
                    <th class="listproduct-header">Category</th>
                    <th class="listproduct-header">Price</th>
                    <th class="listproduct-header">Days</th>
                    <th class="listproduct-header">Edit</th>
                    <th class="listproduct-header">Remove</th>
                </tr>
            </thead>
            <tbody>
                <!-- Iterate over the package list -->
                <c:forEach var="pack" items="${packList}">
                    <tr class="listproduct-row">
                        <!-- Package image -->
                        <td class="listproduct-data">
                            <img class="listproduct-product-icon" src="<c:out value='${pack.image}' />" alt="Package Image" />
                        </td>

                        <!-- Package details -->
                        <td class="listproduct-data"><c:out value="${pack.id}" /></td>
                        <td class="listproduct-data"><c:out value="${pack.title}" /></td>
                        <td class="listproduct-data"><c:out value="${pack.category}" /></td>
                        <td class="listproduct-data"><c:out value="${pack.price}" /></td>
                        <td class="listproduct-data"><c:out value="${pack.days}" /></td>

                        <!-- Edit button -->
                        <td class="listproduct-data">
                            <a href="editPackage?id=<c:out value='${pack.id}' />" class="edit-btn">Edit</a>
                        </td>

                        <!-- Remove button -->
                        <td class="listproduct-data">
                            <a href="removePackage?id=<c:out value='${pack.id}' />" class="remove-button">Remove</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
        



        <!-- Profile -->
        <div class="profile" id="tab3">
          <div class="profile-container">
            <!-- Cover Photos Section -->
            <div class="cover-photos">
            
            	<img src="<c:out value='${user.coverPic}'/>" alt="Cover Photo 1" class="cover-photo">
                
               
            </div>
    
            <!-- Profile Section -->
            <div class="profile-info">
                <!-- Logo and Basic Info -->
                <div class="profile-header">
                    <img src="<c:out value='${user.profilePic}'/>" alt="Logo" class="profile-logo">
                    <h1 class="profile-name"><c:out value="${user.name}"></c:out></h1>
                    <p class="profile-description"><c:out value="${user.description}"></c:out></p>
                </div>
    
                <!-- Contact Info -->
                <div class="contact-info">
                    <p><strong>Email:</strong><c:out value="${user.email}"></c:out></p>
                    <p><strong>Phone:</strong><c:out value="${user.phone}"></c:out></p>
                </div>
    
                <!-- Action Buttons -->
                <div class="profile-actions">
  				  <a href="updateGuideProfile?id=<%= session.getAttribute("id") %>" class="edit-button">Edit Info</a>
 				  <a href="deleteGuideProfile?id=<%= session.getAttribute("id") %>" class="delete-button">Delete Account</a>
  				  <a href="logout.jsp" class="logout-button">Logout</a>
				</div>
            </div>
        </div>
        </div>
      </div>
    </div>
    
    <script>
    document.addEventListener("DOMContentLoaded", function () {
  	  const addPackage = document.getElementById("tab1");
  	  const listProduct = document.getElementById("tab2");
  	  const profile = document.getElementById("tab3");

  	  window.changeTab = function (tabNo) {
  		  
  	    // Hide all tabs initially
  	    profile.style.display = "none";
  	    addPackage.style.display = "none";
  	    listProduct.style.display = "none";

  	    // Show the selected tab based on tabNo
  	    if (tabNo === 1) {
  	      profile.style.display = "block";
  	  
  	    } else if (tabNo === 2) {
  	      addPackage.style.display = "block";
  	      
  	    } else if (tabNo === 3) {
  	      listProduct.style.display = "block";
  	 
  	    
  	    }
  	    
  	    const newUrl = '/CeylonTours/views/guide_dashboard';
          window.history.pushState({ tab: tabNo }, '', newUrl);
          
          
  	  };

  	
	    let defaultTab = 1;
	

	    const urlParams = new URLSearchParams(window.location.search);
	    console.log(urlParams)
	    const tabParam = urlParams.get('tab');
	    console.log(tabParam)
	    
	    if (tabParam) {
	        defaultTab = parseInt(tabParam, 10);
	    }
	
	    changeTab(defaultTab); 
  	  
  	  <!-- Container for dynamically added text areas -->
  		const dropDown = document.getElementById("daysSelector");
  		const daysContainer = document.getElementById("daysContainer");
  		
  		dropDown.addEventListener("change",function(){
  			let days = this.value;
  			daysContainer.innerHTML = '';
  			
  			for(let i =1;days >= i;i++){
  				const label = document.createElement("p");
  				label.textContent = `Day ` + i;
  				
  				
  				const textarea = document.createElement('textarea');
  			    textarea.name = `day`;
  			    textarea.placeholder = `Enter plan for day ${i}`;
  			    textarea.class = "textarea";
  			    textarea.value = "Day" + i
  	
  			    
  			    daysContainer.appendChild(label);
  			    daysContainer.appendChild(textarea);
  			      
  			}
  		})
  		
  		const imgInput = document.getElementById("file-input");
  		const displayTag = document.getElementById("display");

  		imgInput.addEventListener("input", function() {
  		    let url = this.value; 
  		    displayTag.src = url; 
  		    console.log(url); 
  		});

  		
  		
  	});
    
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
    if (session.getAttribute("role") == "tourist") {
        response.sendRedirect("login.jsp");       
        return;  
    }
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Form</title>

<style>

@import url("https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap");

	
* {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
  font-family: "outfit";
  list-style: none;
  text-decoration: none;
}



  .update-form-container {
    width: 70%;
    max-width: 500px;
    margin: auto;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  }

  .update-form h2 {
    text-align: center;
    margin-bottom: 20px;
    color: var(--textColor);
  }

  .form-group {
    margin-bottom: 15px;
  }
  
  .addproduct-thumbnail-img {
  height: 120px;
  width: 120px;
  border-radius: 10px;
  object-fit: contain;
}

  .form-group label {
    display: block;
    margin-bottom: 5px;
    color: var(--textColor);
    font-weight: 600;
  }

  .form-group input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    outline: none;
  }

  .form-group input[type="file"] {
    padding: 5px;
  }

  .form-actions {
    text-align: center;
    margin-top: 15px;
  }

  .btn {
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    color: #fff;
    cursor: pointer;
    font-size: 16px;
  }

  .update-btn {
    background-color: #26a59e;
  }

  .update-btn:hover {
    background-color: #2dc5bd;
  }

  .delete-btn {
    background-color: #ff4d4d;
    margin-top: 10px;
  }
  
  .delete-btn a{
    text-decoration: none;
     color: #fff;
  }

  .delete-btn:hover {
    background-color: #ff6666;
  }

  :root {
    --textColor: #05063d;
    --mainColor: #26a59e;
    --hoverColor: #2dc5bd;
  }

</style>

</head>
<body>

<!-- Update Form Section -->
<div class="update-form-container">
  <form class="update-form" action="updateGuide" method="post" >
    <h2>Update Profile</h2>

    <!-- First Name Field -->
    <div class="form-group">
      <label for="fname">Username</label>
      <input type="text" id="name" name="name" value="<c:out value='${gd.name }'></c:out>" />
    </div>


    <!-- Country Field -->
    <div class="form-group">
      <label for="country">Country</label>
      <input type="text" id="country" name="country" value="<c:out value='${gd.country }'></c:out>" />
    </div>

    <!-- Telephone Field -->
    <div class="form-group">
      <label for="telephone">Telephone</label>
      <input type="text" id="telephone" name="telephone" value="<c:out value='${gd.phone }'></c:out>" />
    </div>

    <!-- Email Field -->
    <div class="form-group">
      <label for="email">Description</label>
      <input type="text" id="description" name="desciption" value="<c:out value='${gd.description }'></c:out>" />
    </div>

    <!-- Profile Photo Field -->
   <div class="form-group">
      <label for="email">Profile Image</label>
   <img class="addproduct-thumbnail-img" src="" alt="add Img" id="display1"/>
      <input type="text" id="pimg" name="pimg" placeholder="Add Profile Picture URL" />
    </div>
    
    <div class="form-group">
      <label for="email">Cover Image</label>
   <img class="addproduct-thumbnail-img" src="" alt="add Img" id="display2"/>
      <input type="text" id="cimg" name="cimg" placeholder="Add Cover Picture URL" />
    </div>

    <!-- Update Button -->
    <div class="form-actions">
      <button type="submit" class="btn update-btn">Update</button>
    </div>

  </form>
</div>

<script type="text/javascript">

const imgInput = document.getElementById("pimg");
const imgCInput = document.getElementById("cimg");
const displayTag2 = document.getElementById("display2");
const displayTag1 = document.getElementById("display1");

imgInput.addEventListener("input", function() {
    let url = this.value; // Get the input value (URL)
    displayTag1.src = url; // Set the image src to the entered URL
    console.log(url); // Log the URL to console for debugging
});

imgCInput.addEventListener("input", function() {
    let url = this.value; // Get the input value (URL)
    displayTag2.src = url; // Set the image src to the entered URL
    console.log(url); // Log the URL to console for debugging
});

</script>


</body>
</html>
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
  
  .add-product-selector {
  width: 100%;
  padding: 10px; /* Match the padding of the input fields */
  border: 1px solid #ddd; /* Same border as input fields */
  border-radius: 5px; /* Same border-radius for consistency */
  outline: none; /* Remove default focus outline */
  font-size: 14px; /* Same font size as inputs */
  background-color: #fff; /* White background for consistency */
  appearance: none; /* Remove default dropdown arrow in some browsers */
  cursor: pointer;
}

.add-product-selector:focus {
  border-color: #26a59e; /* Highlight border on focus */
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
  <form class="update-form" action="updatePackage">
    <h2>Update Package Details</h2>
	
	
	<input type="text" id="id" name="id" value="<c:out value='${pack.id }'></c:out>" hidden/>
    <!-- First Name Field -->
    <div class="form-group">
      <label for="fname">Title</label>
      <input type="text" id="title" name="title" value="<c:out value='${pack.title }'></c:out>" />
    </div>


    <!-- Package Category Field -->
   <div class="form-group">
  		<label for="category">Package Category</label>
  		<select name="category" id="category" class="add-product-selector" value="<c:out value='${pack.category }'></c:out>">
    		<option value="Honeymoon Tour in Sri Lanka">Honeymoon Tour in Sri Lanka</option>
   			<option value="Sri Lankan 10 Days Round Tour">Sri Lankan 10 Days Round Tour</option>
   			<option value="Kid">Kid</option>
  		</select>
	</div>


    <!-- Telephone Field -->
    <div class="form-group">
      <label for="price">Price</label>
      <input type="text" id="price" name="price" value="<c:out value='${pack.price }'></c:out>" />
    </div>

    <!-- Email Field -->
    <div class="form-group">
      <label for="email">Description</label>
      <input type="text" id="description" name="description" value="<c:out value='${pack.description }'></c:out>" />
    </div>

    <!-- Profile Photo Field -->
   

    <!-- Update Button -->
    <div class="form-actions">
      <button type="submit" class="btn update-btn">Update</button>
    </div>

  </form>
</div>


</body>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("role") == "guide") {
        response.sendRedirect("login.jsp");       
        return;  
    }
%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking History</title>
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

     .booking-history-section {
            width: 80%;
            margin: 40px auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            font-size: 1.2rem;
            color: #26a59e;
        }

        .section-header h2 {
            margin: 0;
        }

        .user-name {
            font-size: 1rem;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #26a59e;
            color: white;
        }

        .action-links {
            display: flex;
            justify-content: center;
            gap: 10px; /* Space between buttons */
        }

        .action-links a {
            margin: 0 5px;
            padding: 5px 10px;
            border: 1px solid #26a59e; /* Added border */
            border-radius: 4px;
            text-decoration: none;
            color: #26a59e; /* Text color matching border */
            font-weight: bold;
            font-size: 0.85rem;
            transition: background-color 0.3s ease; /* Smooth hover transition */
        }

        /* Hover effects for buttons */
        .action-links a:hover {
            background-color: #26a59e; /* Same color as border */
            color: white;
        }

        /* Change the Cancel button hover to red */
        .action-links .cancel:hover {
            background-color: #ff4c4c;
            border-color: #ff4c4c;
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
	

    <div class="booking-history-section">
        <!-- Section header with "Booking History" title and user's name -->
        <div class="section-header">
            <h2>Booking History</h2>
            <div class="user-name">Hello Traveller, <strong><%= session.getAttribute("name") %></strong></div>
        </div>

        <!-- Table to display booking history -->
        <table>
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Package ID</th>
                    <th>Booked Date</th>
                    <th>Starting Date</th>
                    <th>Number of Travelers</th>
                    <th>Room Type</th>
                    <th>Meal Plan</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
             <c:forEach var="book" items="${bookList}">
                <tr>
                    <td>CTB-<c:out value="${book.id}" /></td>
                    <td><c:out value="${book.packageId}" /></td>
                    <td><c:out value="${book.bookingDate}" /></td>
                    <td><c:out value="${book.startDate}" /></td>
                    <td><c:out value="${book.numbeOfTravelers}" /></td>
                    <td><c:out value="${book.accommodationPreference}" /></td>
                    <td><c:out value="${book.mealRequest}" /></td>
                    <td class="action-links">
                        <a href="editBooking?id=<c:out value="${book.id}" />" class="edit">Edit</a>
                        <a href="deleteBooking?id=<c:out value="${book.id}" />" class="cancel">Cancel</a>
                    </td>
                </tr>
               </c:forEach>
            </tbody>
        </table>
    </div>

</body>
</html>



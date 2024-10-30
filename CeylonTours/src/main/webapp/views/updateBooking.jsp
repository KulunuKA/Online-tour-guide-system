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
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Booking Form</title>
    <style>
        :root {
            --mainColor: #26a59e;
            --hoverColor: #2dc5bd;
            --textColor: #05063d;
            --inputBackground: #f5fdfc;
            --borderColor: #ccc;
        }

        body {
            font-family: "Outfit", sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            color: var(--textColor);
            background-color: #f9f9f9;
        }

        .container {
            width: 40%; /* Reduced width */
            margin: 40px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .form-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .form-header h2 {
            font-size: 1.6rem; /* Reduced size */
            color: var(--textColor);
        }

        .form-header p {
            font-size: 1.1rem;
            color: var(--mainColor);
        }

        form {
            padding: 20px;
        }

        .form-group {
            margin-bottom: 10px; /* Reduced margin */
        }

        label {
            display: block;
            font-weight: 600;
            margin-bottom: 5px;
            color: var(--textColor);
        }

        input[type="text"],
        input[type="number"],
        input[type="date"],
        select,
        textarea {
            width: 100%;
            padding: 8px; /* Reduced padding */
            border: 1px solid var(--borderColor);
            border-radius: 5px;
            background-color: var(--inputBackground);
            font-size: 0.9rem; /* Reduced font size */
        }

        select {
            background-color: white;
        }

        .form-group textarea {
            height: 80px; /* Reduced height */
            resize: none;
        }

        /* Styled Button */
        .btn-book {
            display: block;
            width: 100%;
            background-color: var(--mainColor);
            color: white;
            padding: 12px; /* Reduced padding */
            border: none;
            border-radius: 5px;
            font-size: 1rem; /* Reduced font size */
            cursor: pointer;
            text-align: center;
            transition: background-color 0.3s;
        }

        .btn-book:hover {
            background-color: var(--hoverColor);
        }

        @media (max-width: 768px) {
            .container {
                width: 90%;
            }
        }
    </style>
</head>

<body>

    <div class="container">
        <div class="form-header">
            <h2>Edit your Booking</h2>
        </div>

        <form class="book-form" action="updateBooking" method="post">
            <!-- Package ID (hidden) -->
            <input type="text" id="bid" name="bid" value="<c:out value='${book.id}'/>" hidden >
            
            <!-- Number of Travelers -->
            <div class="form-group">
                <label for="travellers">Number of Travelers</label>
                <input type="number" id="travellers" name="travellers" value="<c:out value='${book.numbeOfTravelers}'/>" required>
            </div>

            <!-- Start Date -->
            <div class="form-group">
                <label for="startDate">Preferred Start Date</label>
                <input type="date" id="startDate" name="startDate" value="<c:out value='${book.startDate}'/>" required>
            </div>

            <!-- Accommodation Preference -->
            <div class="form-group">
                <label for="accommodation">Accommodation Preference</label>
                <select id="accommodation" name="accommodation" required>
                    <option value="">Select Accommodation</option>
                    <option value="standard" <c:if test="${book.accommodationPreference == 'standard'}">selected</c:if>>Standard</option>
                    <option value="deluxe" <c:if test="${book.accommodationPreference == 'deluxe'}">selected</c:if>>Deluxe</option>
                    <option value="luxury" <c:if test="${book.accommodationPreference == 'luxury'}">selected</c:if>>Luxury</option>
                </select>
            </div>
            
            <!-- Meal Request -->
            <div class="form-group">
                <label for="meal">Meal Request</label>
                <select id="meal" name="meal" required>
                    <option value="">Select Meal Preference</option>
                    <option value="vegetarian" <c:if test="${book.mealRequest == 'vegetarian'}">selected</c:if>>Vegetarian</option>
                    <option value="non-vegetarian" <c:if test="${book.mealRequest == 'non-vegetarian'}">selected</c:if>>Non-Vegetarian</option>
                    <option value="special" <c:if test="${book.mealRequest == 'special'}">selected</c:if>>Special Request</option>
                </select>
            </div>
    
            <!-- Done Button -->
            <button type="submit" class="btn-book">Done</button>
        </form>
    </div>

</body>

</html>

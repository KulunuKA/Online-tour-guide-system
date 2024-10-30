<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tour Booking Form</title>
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
            width: 60%;
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
            font-size: 1.8rem;
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
            margin-bottom: 15px;
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
            padding: 10px;
            border: 1px solid var(--borderColor);
            border-radius: 5px;
            background-color: var(--inputBackground);
            font-size: 1rem;
        }

        select {
            background-color: white;
        }

        .form-group textarea {
            height: 100px;
            resize: none;
        }

        /* Styled Link as Button */
         .btn-book {
            display: block;
            width: 100%;
            background-color: var(--mainColor);
            color: white;
            padding: 15px;
            border: none;
            border-radius: 5px;
            font-size: 1.2rem;
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
        
        .error-message {
        color: red;
        font-size: 14px;
        margin-top: 5px;
    }
        
    </style>
</head>

<body>

    <div class="container">
    
        <div class="form-header">
            <h2>Book Your Tour</h2>
            <p><span id="tourTitle"><c:out value="${pack.title}"></c:out> </span> - <span id="tourCategory"><c:out value='${pack.category }'></c:out></span></p>
        </div>

        <form class="book-form" action="bookTourNow" method="post" onsubmit="return validateForm()">
    <!-- Number of Travelers -->
    <input type="text" id="pid" name="pid" value="<c:out value='${pack.id}'/>" hidden>

    <div class="form-group">
        <label for="travellers">Number of Travelers</label>
        <input type="number" id="travellers" name="travellers" placeholder="Enter number of travelers" required min="1">
        <small class="error-message" id="travellers-error"></small>
    </div>

    <!-- Start Date -->
    <div class="form-group">
        <label for="startDate">Preferred Start Date</label>
        <input type="date" id="startDate" name="startDate" required>
        <small class="error-message" id="start-date-error"></small>
    </div>

    <!-- Accommodation Preference -->
    <div class="form-group">
        <label for="accommodation">Accommodation Preference</label>
        <select id="accommodation" name="accommodation" required>
            <option value="">Select Accommodation</option>
            <option value="standard">Standard</option>
            <option value="deluxe">Deluxe</option>
            <option value="luxury">Luxury</option>
        </select>
        <small class="error-message" id="accommodation-error"></small>
    </div>

    <!-- Transport Requests -->
    <div class="form-group">
        <label for="transport">Transport Requests</label>
        <textarea id="transport" name="transport" placeholder="Enter any specific transport requests"></textarea>
        <small class="error-message" id="transport-error"></small>
    </div>

    <!-- Meal Request -->
    <div class="form-group">
        <label for="meal">Meal Request</label>
        <select id="meal" name="meal" required>
            <option value="">Select Meal Preference</option>
            <option value="vegetarian">Vegetarian</option>
            <option value="non-vegetarian">Non-Vegetarian</option>
            <option value="special">Special Request</option>
        </select>
        <small class="error-message" id="meal-error"></small>
    </div>

    <!-- Special Requests -->
    <div class="form-group">
        <label for="specialRequests">Special Requests</label>
        <textarea id="specialRequests" name="specialRequests" placeholder="Enter any special requests"></textarea>
        <small class="error-message" id="special-requests-error"></small>
    </div>

    <!-- Payment Method -->
    <div class="form-group">
        <label for="payment">Payment Method</label>
        <select id="payment" name="payment" required>
            <option value="">Select Payment Method</option>
            <option value="credit-card">Credit Card</option>
            <option value="paypal">PayPal</option>
            <option value="bank-transfer">Bank Transfer</option>
        </select>
        <small class="error-message" id="payment-error"></small>
    </div>

    <!-- Book Button -->
    <button type="submit" class="btn-book">Book Now</button>
</form>
    </div>
    
    
    <script>
    function validateForm() {
        // Clear previous error messages
        document.querySelectorAll('.error-message').forEach(el => el.textContent = '');

        let isValid = true;

        // Validate Number of Travelers
        const travellers = document.getElementById('travellers').value;
        if (travellers < 1) {
            document.getElementById('travellers-error').textContent = 'Number of travelers must be at least 1.';
            isValid = false;
        }

        // Validate Start Date
        const startDate = new Date(document.getElementById('startDate').value);
        const today = new Date();
        today.setHours(0, 0, 0, 0); // Set time to midnight for comparison
        if (startDate < today) {
            document.getElementById('start-date-error').textContent = 'Start date cannot be in the past.';
            isValid = false;
        }

        // Validate Accommodation Preference
        const accommodation = document.getElementById('accommodation').value;
        if (!accommodation) {
            document.getElementById('accommodation-error').textContent = 'Please select an accommodation option.';
            isValid = false;
        }

        // Validate Meal Request
        const meal = document.getElementById('meal').value;
        if (!meal) {
            document.getElementById('meal-error').textContent = 'Please select a meal preference.';
            isValid = false;
        }

        // Additional validations can be added here as needed

        return isValid; // Return true if all validations pass
    }
</script>

</body>

</html>


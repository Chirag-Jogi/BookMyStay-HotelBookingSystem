<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Payment Receipt</title>
    <link rel="stylesheet" type="text/css" href="admin/booking_details.css">

    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .submit_button {
    background-color: #3498db; /* Blue color */
    color: #fff; /* White text color */
    padding: 10px 20px; /* Increase padding for larger size */
    font-size: 16px; /* Increase font size */
    border: none; /* Remove border */
    border-radius: 5px; /* Rounded corners */
    cursor: pointer; /* Show pointer cursor on hover */
}
        
        
        
    </style>
</head>
<body>
    <h1>Payment Details</h1>
    <div>
        <h3>Booking Details:</h3>
        <p><strong>Name:</strong> <%= request.getAttribute("full_name") %></p>
        <p><strong>Check-In Date:</strong> <%= request.getAttribute("check_in_date") %></p>
        <p><strong>Check-Out Date:</strong> <%= request.getAttribute("check_out_date") %></p>
        <p><strong>Room Type:</strong> <%= request.getAttribute("room_type") %></p>
        <p><strong>Number of Guests:</strong> <%= request.getAttribute("number_of_guests") %></p>

        <%
            String roomType = (String) request.getAttribute("room_type");
            String numberOfGuestsStr = (String) request.getAttribute("number_of_guests");
            String checkInDateStr = (String) request.getAttribute("check_in_date");
            String checkOutDateStr = (String) request.getAttribute("check_out_date");

            int numberOfGuests = 0;
            int numberOfRooms = 0;
            int basePrice = 0;
            int gstPercentage = 18; // Assuming GST is 18%
            double taxPercentage = 5.5; // Assuming additional tax percentage
            int totalPrice = 0;

            // Parse number of guests
            if (numberOfGuestsStr != null && !numberOfGuestsStr.isEmpty()) {
                try {
                    numberOfGuests = Integer.parseInt(numberOfGuestsStr);
                } catch (NumberFormatException e) {
                    out.println("Invalid number of guests");
                }
            } else {
                out.println("Number of guests is missing");
            }

            // Determine base price based on room type
            if (roomType.equals("single")) {
                basePrice = 1500;
            } else if (roomType.equals("double")) {
                basePrice = 2500;
            } else if (roomType.equals("deluxe")) {
                basePrice = 5000;
            }

            // Calculate total rooms based on number of guests
            if (roomType.equals("single")) {
                numberOfRooms = numberOfGuests;
            } else if (roomType.equals("double") || roomType.equals("deluxe")) {
                if (numberOfGuests == 1) {
                    numberOfRooms = numberOfGuests;
                } else if (numberOfGuests % 2 != 0) {
                    numberOfRooms = numberOfGuests - 1;
                } else {
                    numberOfRooms = numberOfGuests / 2;
                }
            }

            // Calculate the number of days between check-in and check-out dates
            long diffInMillis = 0;
            try {
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
                java.util.Date checkInDate = sdf.parse(checkInDateStr);
                java.util.Date checkOutDate = sdf.parse(checkOutDateStr);
                diffInMillis = checkOutDate.getTime() - checkInDate.getTime();
            } catch (java.text.ParseException e) {
                out.println("Invalid dates provided");
            }
            int numberOfDays = (int) (diffInMillis / (1000 * 60 * 60 * 24));

            // Calculate total price without taxes
            totalPrice = numberOfRooms * basePrice * numberOfDays;

            // Calculate GST and additional taxes
            double gstAmount = (totalPrice * gstPercentage) / 100;
            double taxAmount = (totalPrice * taxPercentage) / 100;
            double totalAmount = totalPrice + gstAmount + taxAmount;
        %>

        <table>
            <tr>
                <th>Field</th>
                <th>Value</th>
            </tr>
            <tr>
                <td><strong>Name</strong></td>
                <td><%= request.getAttribute("full_name") %></td>
            </tr>
            <tr>
                <td><strong>Check-In Date</strong></td>
                <td><%= request.getAttribute("check_in_date") %></td>
            </tr>
             <tr>
                <td><strong>Check-Out Date</strong></td>
                <td><%= request.getAttribute("check_out_date") %></td>
            </tr>
           
            <tr>
                <td><strong>Room Type</strong></td>
                <td><%= request.getAttribute("room_type") %></td>
            </tr>
            <tr>
                <td><strong>Number of Guests</strong></td>
                <td><%= request.getAttribute("number_of_guests") %></td>
            </tr>
            
            <tr>
                <td><strong>Base Price / Night</strong></td>
                <td><%= basePrice %> Rs</td>
            </tr>
            <tr>
                <td><strong>Total Rooms</strong></td>
                <td><%= numberOfRooms  %> room</td>
            </tr>
             <tr>
                <td><strong>Total Days Stay</strong></td>
                <td><%= numberOfDays %>Days</td>
            </tr>
            <tr>
                <td><strong>Total Price (without taxes) </strong></td>
                <td><%= totalPrice %> Rs</td>
            </tr>
            <tr>
                <td><strong>GST (18%)</strong></td>
                <td><%= gstAmount %> Rs</td>
            </tr>
            <tr>
                <td><strong>Additional Tax (5.5%)</strong></td>
                <td><%= taxAmount %> Rs</td>
            </tr>
            <tr>
                <td><strong>Total Amount (including taxes)</strong></td>
                <td><%= totalAmount %> Rs</td>
            </tr>
        </table>
    </div>
   <form action="PaymentServlet" method="get">
            <input type="hidden" name="full_name" value="<%= request.getAttribute("full_name") %>">
            <input type="hidden" name="check_in_date" value="<%= request.getAttribute("check_in_date") %>">
            <input type="hidden" name="check_out_date" value="<%= request.getAttribute("check_out_date") %>">
            <input type="hidden" name="room_type" value="<%= request.getAttribute("room_type") %>">
            <input type="hidden" name="number_of_guests" value="<%= request.getAttribute("number_of_guests") %>">
            <input type="hidden" name="email" value="<%= request.getAttribute("email") %>">
            <input type="hidden" name="phone" value="<%= request.getAttribute("phone") %>">
            <input type="hidden" name="userId" value="<%= request.getAttribute("userId") %>">
            
            <input class="submit_button" type="submit" value="Pay Now">
        </form>
    <%@ include file="message.jsp" %>
</body>
</html>



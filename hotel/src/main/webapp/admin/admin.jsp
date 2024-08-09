<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="admin-style.css">
   
</head>

<body style="">
    <nav class="navbar">
        <div class="nav-left">
            <a href="#" class="nav-item">Home</a>
            <a href="#" class="nav-item">Dashboard</a>
        </div>
        <div class="nav-right">
            <a href="../homepage.jsp" class="nav-item">LogOut</a>
        </div>
    </nav>
    
    <h1>Admin Dashboard</h1>
    
    <div class="admin-section">
        <h2>Room Management</h2>
        <button >View Rooms</button>
        <button>Add Room</button>
        <div id="rooms-list"></div>
    </div>
    
    <div class="admin-section">
        <h2>Booking Management</h2>
      <a href="booking_list.jsp">
    <button type="button">View Bookings</button>
</a>
        <div id="bookings-list"></div>
    </div>
    
    <div class="admin-section">
        <h2>Payment Processing</h2>
        <button >View Payments</button>
        <div id="payments-list"></div>
    </div>
    
     <div class="admin-section">
        <h2>User Registration</h2>
        <a href="user_list.jsp" >
        <button type="button">user list</button>
        
        </a>
        
        <div id="rooms-list"></div>
    </div>
    

    <div id="form-container"></div>

   
</body>
</html>

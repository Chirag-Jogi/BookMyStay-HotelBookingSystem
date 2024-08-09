<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="css/register-style.css">
</head>
<body>
    <div class="register-container">
        <h1>Register</h1>
        <form id="register-form" action="AddUserServlet" method="get">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br>
            
            <label for="full_name">Full Name:</label>
            <input type="text" id="full_name" name="full_name" required><br>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br>
           
            <button type="submit">Sign Up</button>
        </form>
    </div>
    
    <%@ include file="message.jsp" %>
  
</body>
</html>

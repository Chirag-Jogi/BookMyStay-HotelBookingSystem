<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Book My Stay - Login</title>
<link rel="stylesheet" href="css/login-style.css">
<style>
body {
    background-image: url('images/hotel1.png');
    background-position: center;
}
</style>
</head>
<body>
<div class="login-container">
    <h1>Login</h1>
    <form id="login-form" action="LoginServlet" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>
        <button type="submit">Login</button>
    </form>
    <div class="register-link">
        <p>
            Don't have an account? <a href="register.jsp">Sign Up</a>
        </p>
    </div>
    <% 
        String message = request.getParameter("message");
        if (message != null && !message.isEmpty()) {
    %>
       
            <% out.print(message);%>
      
    <% } %>
	 <jsp:include page="message.jsp" />
</div>
	
</body>

</html>
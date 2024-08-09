<%@page import="user.mgmt.entities.UserInfo"%>
<%@page import="user.mgmt.dao.UserDao"%>
<%@page import="user.mgmt.dao.UserDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update User</title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
  body {
    background-color: #ffffff;
  }
  .form-container {
    width: 50%;
    margin: auto;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 5px;
  }
  #disable {
    background-color: lightGray;
  }
</style>
</head>
<body>
<%
   String userId = request.getParameter("userId");
   int idInt = Integer.parseInt(userId);

   UserDao userDao = new UserDaoImpl();
   UserInfo userInfo = userDao.getUserInfo(idInt);
%>

<div class="container mt-5">
  <div class="form-container">
    <form action="../UpdateUserServlet" method="get">
      <fieldset>
        <legend>Update User Details</legend>
        <div class="form-group">
          <label for="userId">User ID</label>
          <input id="disable" type="number" class="form-control" name="userId" value="<%= userInfo.getUserId() %>" readonly="readonly">
        </div>
        <div class="form-group">
          <label for="password">Password</label>
          <input type="text" class="form-control" name="password" value="<%= userInfo.getPassword() %>">
        </div>
        <div class="form-group">
          <label for="fullname">Full Name</label>
          <input type="text" class="form-control" name="fullname" value="<%= userInfo.getFull_Name() %>">
        </div>
        <div class="form-group">
          <label for="email">Email</label>
          <input type="text" class="form-control" name="email" value="<%= userInfo.getEmail() %>">
        </div>
        <button type="submit" value="Submit" class="btn btn-primary">Submit</button>
        <button type="reset" value="Reset" class="btn btn-warning">Reset</button>
        
      </fieldset>
    </form>
    
    
        <%@include file="message.jsp" %>
  </div>
</div>



<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

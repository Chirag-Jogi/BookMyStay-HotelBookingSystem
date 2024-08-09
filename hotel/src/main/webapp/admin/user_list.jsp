<%@page import="user.mgmt.entities.UserInfo"%>
<%@page import="user.mgmt.dao.UserDaoImpl"%>
<%@page import="user.mgmt.dao.UserDao"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	padding: 5px;
}

caption {
	margin-bottom: 20px;
	font-size: 20px;
	text-decoration: underline;
	color: green;
	font-weight: bold;
}

.button{
	 display: inline-block;
    padding: 10px 20px;
    font-size: 16px;
    color: white;
    background-color: #007BFF;
    text-align: center;
    text-decoration: none;
    border-radius: 5px;
    border: none;
    cursor: pointer;
}
#button:hover{
	   background-color: #0056b3;
}
</style>
</head>
<body>



<%
    UserDao userDao=new UserDaoImpl();
	List<UserInfo> userList=userDao.getAllUserInfo();

%>
	
	<table>
	
	<caption>User List</caption>
	
	<tr>
	
	<th>UserId</th>
	<th>Username</th>
	<th>password</th>
	<th>fullName</th>
	<th>emailId</th>
	<th>Action</th>
	
	</tr>
	<%
		for(UserInfo userInfo:userList){

	%>
	<tr>
	<td><%= userInfo.getUserId() %></td>
	<td><%= userInfo.getUsername()   %></td>
	<td><%= userInfo.getPassword()  %></td>
	<td><%= userInfo.getFull_Name() %></td>
	<td><%= userInfo.getEmail() %></td>
	<td><a href="updateUser.jsp?userId=<%= userInfo.getUserId() %>" class="button" style="background-color: yellow; color:black;">Update User</a> </td>
      <td><a href="deleteUser.jsp?userId=<%= userInfo.getUserId() %>"
				class="button" style="background-color: red;">Delete</a></td>
	</tr>
	<% } %>
	
	</table>
	
	<%@  include file="message.jsp" %> 
	
</body>
</html>
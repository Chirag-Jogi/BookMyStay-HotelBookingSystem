<%@page import="user.mgmt.entities.BookingInfo"%>
<%@page import="user.mgmt.dao.BookingDaoImpl"%>
<%@page import="user.mgmt.dao.BookingDao"%>
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
<title>Booking list</title>

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
    BookingDao bookingDao=new BookingDaoImpl();
	List<BookingInfo> BookingList=bookingDao.getAllBookingInfo();

%>
	
	<table>
	
	<caption>Booking List</caption>
	
	<tr>
	
	<th>BookingId</th>
	<th>chekinDate</th>
	<th>chekoutDate</th>
	<th>room_type</th>
	<th>no_of_guests</th>
	<th>full_name</th>
	<th>e_mail</th>
	<th>phone_no</th>
	<th>UserId</th>
	<th>Action</th>
	
	</tr>
	<%
		for(BookingInfo bookingInfo:BookingList){

	%>
	<tr>
	<td><%= bookingInfo.getBookingId() %></td>
	<td><%= bookingInfo.getChekinDate() %></td>
	<td><%= bookingInfo.getChekoutDate() %></td>
	<td><%= bookingInfo.getRoom_type()%></td>
	<td><%= bookingInfo.getNo_of_guests()%></td>
	<td><%= bookingInfo.getFull_name()%></td>
	<td><%= bookingInfo.getE_mail()%></td>
	<td><%= bookingInfo.getPhone_no()%></td>
	<td><%= bookingInfo.getUserId() %></td>
	
	<td><a href="#" class="button" style="background-color: yellow; color:black;">Update Booking</a> </td>
      <td><a href="#"
				class="button" style="background-color: red;">Delete</a></td>
	</tr>
	<% } %>
	
	</table>
	
	
	
</body>
</html>
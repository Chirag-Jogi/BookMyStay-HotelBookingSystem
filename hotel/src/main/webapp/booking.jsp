<!DOCTYPE html>
<%@page import="user.mgmt.entities.UserInfo"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Book My Stay-booking</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="css/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="css/responsive.css">
<!-- Additional Custom CSS for booking page -->
<link rel="stylesheet" href="css/booking-style.css">
<!-- Favicon -->
<link rel="icon" href="images/favicon.png" type="image/png">
<style>
.booking-form-container {
	max-width: 600px;
	margin: 50px auto;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 10px;
	background-color: #f9f9f9;
}

.booking-form-container h1 {
	text-align: center;
	margin-bottom: 20px;
}

.btn-custom {
	background-color:green;
	color:black;
}
</style>
</head>
<body class="main-layout">
	<!-- header -->
	<header>
		<!-- header inner -->
		<div class="header">
			<div class="container">
				<div class="row">
					<div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col logo_section">
						<div class="full">
							<div class="center-desk">
								<div class="logo">
									< <a href="index.html"><img src="images/Preview.jpg" alt="#" /></a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-9 col-lg-9 col-md-9 col-sm-9">
						<nav class="navigation navbar navbar-expand-md navbar-dark ">
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#navbarsExample04"
								aria-controls="navbarsExample04" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="navbar-toggler-icon"></span>
							</button>
							<div class="collapse navbar-collapse" id="navbarsExample04">
								<ul class="navbar-nav mr-auto">
									<li class="nav-item active"><a class="nav-link"
										href="homepage.jsp">Home</a></li>
									<li class="nav-item"><a class="nav-link" href="about.html">About</a>
									</li>
									<li class="nav-item"><a class="nav-link" href="room.html">Our
											room</a></li>
									<li class="nav-item"><a class="nav-link"
										href="gallery.html">Gallery</a></li>
									<li class="nav-item"><a class="nav-link" href="blog.html">Blog</a>
									</li>
									<li class="nav-item"><a class="nav-link"
										href="contact.html">Contact Us</a></li>
										<!-- This nav bar section of login is created  -->
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
										role="button" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">
										 <% if(session.getAttribute("loggedInUser") != null) { %>
										  User Logout
										   <% }
										 else { %> 
										 User Login 
										 <% } %>
										  </a> <!-- Dropdown menu for login/logout options -->
										<div class="dropdown-menu" aria-labelledby="navbarDropdown">
										
									<a class="dropdown-item" href="admin/adminlogin.jsp">Admin
										Login</a>
											<% if (session.getAttribute("loggedInUser") != null) { %>
											<form action="LogOutServlet" method="post">
												<!-- Assuming LogOutServlet handles logout action -->
												<button type="submit" class="dropdown-item">Logout</button>
												<!-- Use a button for logout -->
											</form>
											<% } else { %> <a class="dropdown-item" href="index.jsp">User
												Login</a>
											<!-- Add login page URL -->
											<% } %>
										</div></li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- end header inner -->
	<!-- end header -->

	<div class="container">
		<div class="booking-form-container">
			<h1>Book a Room</h1>
			<form id="booking-form" action="BookingServlet" method="GET">
				
					<label for="check-in-date">Check-In Date:</label> <input
						type="date" class="form-control" id="check-in-date" required
						name="check_in_date"
						value="<%=request.getParameter("arrival") != null ? request.getParameter("arrival") : ""%>">
				
				
					<label for="check-out-date">Check-Out Date:</label> <input
						type="date" class="form-control" id="check-out-date"
						name="check_out_date" required
						value="<%=request.getParameter("departure") != null ? request.getParameter("departure") : ""%>">
			
				
					<label for="room-type">Room Type:</label>
					 <select
						class="form-control" id="room-type" name="room_type" required>
                    <option value="single" <%= "single".equals(request.getParameter("room_type")) ? "selected" : "" %>>Single Room</option>
                    <option value="double" <%= "double".equals(request.getParameter("room_type")) ? "selected" : "" %>>Double Room</option>
                    <option value="deluxe" <%= "Deluxe".equals(request.getParameter("room_type")) ? "selected" : "" %>> Deluxe Room</option>
					</select>
				
				
					<label for="number-of-guests">Number of Guests:</label> <input
						type="number" class="form-control" id="number-of-guests"
						name="number_of_guests" min="1" max="10" required>
				
				
					<label for="full-name">Full Name:</label> <input type="text"
						class="form-control" id="full-name" name="full_name" required>
				
				
					<label for="email">Email:</label> <input type="email" required
						class="form-control" id="email" name="email">
				
				<label for="phone">Phone:</label>
				<input type="tel" required class="form-control" id="phone" name="phone" pattern="[0-9]{10}"
				 maxlength="10" >
				 
<input type="hidden" id="userId" name="userId" value="<%= session.getAttribute("user") != null ? ((UserInfo) session.getAttribute("user")).getUserId() : "" %>">
				
				<button type="submit" class="btn btn-custom btn-block">Proceed to Payment</button>
			</form>
		</div>
	</div>

	<!-- Javascript files-->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery-3.0.0.min.js"></script>
	<script src="js/plugin.js"></script>
	<!-- sidebar -->
	<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="js/custom.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
		<!-- added -->

<script>
    document.addEventListener("DOMContentLoaded", function() {
        var today = new Date().toISOString().split('T')[0];
        var checkInDateInput = document.getElementById("check-in-date");
        var checkOutDateInput = document.getElementById("check-out-date");

        checkInDateInput.setAttribute('min', today);
        checkOutDateInput.setAttribute('min', today);

        checkInDateInput.addEventListener("change", function() {
            var checkInDate = new Date(this.value);
            var nextDay = new Date(checkInDate);
            nextDay.setDate(checkInDate.getDate() + 1);
            var nextDayStr = nextDay.toISOString().split('T')[0];
            checkOutDateInput.setAttribute('min', nextDayStr);
            if (checkOutDateInput.value < nextDayStr) {
                checkOutDateInput.value = nextDayStr;
            }
        });
    });
</script>
</body>
</html>

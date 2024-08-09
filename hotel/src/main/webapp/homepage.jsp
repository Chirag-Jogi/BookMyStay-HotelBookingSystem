<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- mobile metas -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<!-- site metas -->
<title>Book My Stay</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">
<!-- bootstrap css -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- style css -->
<link rel="stylesheet" href="css/style.css">
<!-- Responsive-->
<link rel="stylesheet" href="css/responsive.css">
<!-- fevicon -->
<link rel="icon" href="images/fevicon.png" type="image/gif" />
<!-- Scrollbar Custom CSS -->
<link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
<!-- Tweaks for older IEs-->
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css"
	media="screen">
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<!-- body -->
<body class="main-layout">
	<!-- loader  -->
	<div class="loader_bg">
		<div class="loader">
			<img src="images/loading.gif" alt="#" />
		</div>
	</div>
	<!-- end loader -->
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
									<div class="logo">
										<div class="logo">
											<a href="index.html"><img src="images/Preview.jpg"
												alt="#"
												style="width: 150px; height: 150px; padding-bottom: 60px;" /></a>
										</div>

									</div>
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
	<!-- banner -->
	<section class="banner_main">
		<div id="myCarousel" class="carousel slide banner"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="first-slide" src="images/banner1.jpg" alt="First slide">
					<div class="container"></div>
				</div>
				<div class="carousel-item">
					<img class="second-slide" src="images/banner2.jpg"
						alt="Second slide">
				</div>
				<div class="carousel-item">
					<img class="third-slide" src="images/banner3.jpg" alt="Third slide">
				</div>
			</div>
			<a class="carousel-control-prev" href="#myCarousel" role="button"
				data-slide="prev"> <span class="carousel-control-prev-icon"
				aria-hidden="true"></span> <span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#myCarousel" role="button"
				data-slide="next"> <span class="carousel-control-next-icon"
				aria-hidden="true"></span> <span class="sr-only">Next</span>
			</a>
		</div>
		<div class="booking_ocline">
			<div class="container">
				<div class="row">
					<div class="col-md-5">
						<div class="book_room">
							<h1>Book a Room Online</h1>
							<form class="book_now" action="booking.jsp" method="GET">
								<div class="row">
									<div class="col-md-12">
										<span>Arrival</span> <img class="date_cua"
											src="images/date.png"> <input class="online_book"
											placeholder="dd/mm/yyyy" type="date" name="arrival">
									</div>
									<div class="col-md-12">
										<span>Departure</span> <img class="date_cua"
											src="images/date.png"> <input class="online_book"
											placeholder="dd/mm/yyyy" type="date" name="departure">
									</div>
									<div class="col-md-12">
										<button class="book_btn" type="submit">Book Now</button>
									</div>
								</div>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- end banner -->
	<!-- about -->
	<div class="about">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-5">
					<div class="titlepage">
						<h2>About Us</h2>
						<p>The passage experienced a surge in popularity during the
							1960s when Letraset used it on their dry-transfer sheets, and
							again during the 90s as desktop publishers bundled the text with
							their software. Today it's seen all around the web; on templates,
							websites, and stock designs. Use our generator to get your own,
							or read on for the authoritative history of lorem ipsum.</p>
						<a class="read_more" href="Javascript:void(0)"> Read More</a>
					</div>
				</div>
				<div class="col-md-7">
					<div class="about_img">
						<figure>
							<img src="images/about.png" alt="#" />
						</figure>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end about -->
	<!-- our_room -->
	<div class="our_room">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="titlepage">
						<h2>Our Room</h2>
						<p>Lorem Ipsum available, but the majority have suffered</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4 col-sm-6">
					<div id="serv_hover" class="room">
						<a href="booking.jsp?room_type=single">
							<div class="room_img">
								<figure>
									<img src="images/room1.jpg" alt="#" />
								</figure>
							</div>
							<div class="bed_room">
								<h3>Single Room</h3>
								<p>Lorem Ipsum available, but the majority have suffered</p>
								<br>
								<h3>Rs 1500/Day</h3>
						</a>
					</div>
				</div>
			</div>
			<div class="col-md-4 col-sm-6">
				<div id="serv_hover" class="room">
					<a href="booking.jsp?room_type=double"> <!-- added -->

						<div class="room_img">
							<figure>
								<img src="images/room2.jpg" alt="#" />
							</figure>
						</div>
						<div class="bed_room">
							<h3>Double Room</h3>
							<p>Lorem Ipsum available, but the majority have suffered</p>
							<br>
							<h3>Rs 2500/Day</h3></a>
				</div>
			</div>
		</div>
		<div class="col-md-4 col-sm-6">
			<div id="serv_hover" class="room">

				<a href="booking.jsp?room_type=double"> <!-- added -->
					<div class="room_img">
						<figure>
							<img src="images/room3.jpg" alt="#" />
						</figure>
					</div>
					<div class="bed_room">
						<h3>Deluxue Room</h3>
						<p>Lorem Ipsum available, but the majority have suffered</p>
						<br>
						<h3>Rs 5000/Day</h3></a>
			</div>
		</div>
	</div>
	</div>
	</div>
	</div>
	<!-- end our_room -->
	<!-- gallery -->
	<div class="gallery">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="titlepage">
						<h2>Gallery</h2>
						<p>Lorem Ipsum available, but the majority have suffered</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4 col-sm-6">
					<div class="gallery_img">
						<figure>
							<img src="images/gallery1.jpg" alt="#" />
						</figure>
					</div>
				</div>
				<div class="col-md-4 col-sm-6">
					<div class="gallery_img">
						<figure>
							<img src="images/gallery2.jpg" alt="#" />
						</figure>
					</div>
				</div>
				<div class="col-md-4 col-sm-6">
					<div class="gallery_img">
						<figure>
							<img src="images/gallery3.jpg" alt="#" />
						</figure>
					</div>
				</div>
				<div class="col-md-4 col-sm-6">
					<div class="gallery_img">
						<figure>
							<img src="images/gallery4.jpg" alt="#" />
						</figure>
					</div>
				</div>
				<div class="col-md-4 col-sm-6">
					<div class="gallery_img">
						<figure>
							<img src="images/gallery5.jpg" alt="#" />
						</figure>
					</div>
				</div>
				<div class="col-md-4 col-sm-6">
					<div class="gallery_img">
						<figure>
							<img src="images/gallery6.jpg" alt="#" />
						</figure>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end gallery -->
	<!-- blog -->
	<div class="blog">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="titlepage">
						<h2>Blog</h2>
						<p>Lorem Ipsum available, but the majority have suffered</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4 col-sm-6">
					<div class="room">
						<div class="room_img">
							<figure>
								<img src="images/blog1.jpg" alt="#" />
							</figure>
						</div>
						<div class="bed_room">
							<h3>Luxury Room</h3>

							<p>Lorem Ipsum available, but the majority have suffered</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-6">
					<div class="room">
						<div class="room_img">
							<figure>
								<img src="images/blog2.jpg" alt="#" />
							</figure>
						</div>
						<div class="bed_room">
							<h3>Luxury Room</h3>

							<p>Lorem Ipsum available, but the majority have suffered</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-6">
					<div class="room">
						<div class="room_img">
							<figure>
								<img src="images/blog3.jpg" alt="#" />
							</figure>
						</div>
						<div class="bed_room">
							<h3>Luxury Room</h3>

							<p>Lorem Ipsum available, but the majority have suffered</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end blog -->
	<!--  footer -->
	<footer>

		<div class="copyright">
			<div class="container">
				<p>© 2024 All Rights Reserved by BookMyStay</p>
			</div>
		</div>
		>
	</footer>
	<!-- end footer -->
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
		
		      <%@ include file="message.jsp" %>
</body>
</html>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>TheEvent - Bootstrap Event Template</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">


<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">



  <!-- Favicons -->
  <link href="img/logo.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="lib/animate/animate.min.css" rel="stylesheet">
  <link href="lib/venobox/venobox.css" rel="stylesheet">
  <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="css/style.css" rel="stylesheet">

  <!-- =======================================================
    Theme Name: TheEvent
    Theme URL: https://bootstrapmade.com/theevent-conference-event-bootstrap-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
<style>
.logout{
    background-color:#432e543b;
}
</style>
</head>
<body>

  <!--==========================
    Header
  ============================-->
  <header id="header">
    <div class="container">

      <div id="logo" class="pull-left">
        <!-- Uncomment below if you prefer to use a text logo -->
        <h2 style="color: red;"><img src="img/logo.png" alt="" title=""> Pocket<span>B</span>uddy</a></h2>
        <h4 style="color: red; font-weight: 500;">Welcome,<strong> ${user.firstName }</strong> </h4>
        <!-- <a href="#intro" class="scrollto"><img src="img/logo.png" alt="" title=""></a> -->
      </div>

      <nav id="nav-menu-container">
        <ul class="nav-menu">
          <li class="menu-active"><a href="#intro">Home</a></li> 
          <li><a href="#venue">Events</a></li>
          <li><a href="#schedule">Schedule</a></li>
          <!-- <li><a href="#hotels">Hotels</a></li>
          <li><a href="#gallery">Gallery</a></li>
          <li><a href="#sponsors">Sponsors</a></li>  -->
          <li><a href="#contact">Contact</a></li>
          <li><a href="#about">About</a></li>
          <li><a href="#" onclick="openPopup()">Rate Us</a></li>
<!--           <li class="buy-tickets"><a href="#buy-tickets">Buy Tickets  <i class="bi bi-ticket-perforated" style="font-size:16px"></i></a></li> -->
          <li class="buy-tickets"><a href="logout" class="logout" style="background-color:#432E54">Log Out</a></li>
          <li class="buy-tickets"><img src="${user.profilePicPath }" alt="" 
            style="width: 40px; height: 40px;  border-radius: 50%; object-fit: cover; border: 2px solid rgb(255, 0, 0);"></li>
        </ul>
      </nav><!-- #nav-menu-container -->
    </div>
  </header><!-- #header -->
</body>
</html> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>TheEvent - Bootstrap Event Template</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <!-- Favicons -->
  <link href="img/logo.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="lib/animate/animate.min.css" rel="stylesheet">
  <link href="lib/venobox/venobox.css" rel="stylesheet">
  <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="css/style.css" rel="stylesheet">

  <!-- =======================================================
    Theme Name: TheEvent
    Theme URL: https://bootstrapmade.com/theevent-conference-event-bootstrap-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
<style>

nav ul li a{
 text-decoration:none !important;
}
.logout{
    background-color:#432e543b;
}
/* Style for dropdown menu */
.dropdown-menu {
    background-color: #f8f9fa;
    border: none;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}
.dropdown-item {
    color: #333;
    padding: 8px 20px;
}
.dropdown-item:hover {
    background-color: #f82249;
    color: white;
}
.nav-menu .menu-has-children {
    position: relative;
}
</style>
</head>
<body>

  <!--==========================
    Header
  ============================-->
  <header id="header">
    <div class="container">

      <div id="logo" class="pull-left">
        <!-- Uncomment below if you prefer to use a text logo -->
        <h2 style="color: red;"><img src="img/logo.png" alt="" title=""> Pocket<span>B</span>uddy</a></h2>
        <h4 style="color: red; font-weight: 500;">Welcome,<strong> ${user.firstName }</strong> </h4>
        <!-- <a href="#intro" class="scrollto"><img src="img/logo.png" alt="" title=""></a> -->
      </div>

      <nav id="nav-menu-container">
        <ul class="nav-menu">
          <li class="menu-active"><a href="#intro">Home</a></li> 
          <li class="menu-has-children"><a href="#">Events</a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="home">Business</a></li>
              <li><a class="dropdown-item" href="musicshow">Music</a></li>
              <li><a class="dropdown-item" href="concert">Concerts</a></li>
              <li><a class="dropdown-item" href="dance">Dances</a></li>
              <!-- <li><a class="dropdown-item" href="comedy">Comedy</a></li> -->
            </ul>
          </li>
          <li><a href="#schedule">Schedule</a></li>
          <li><a href="#contact">Contact</a></li>
          <li><a href="#about">About</a></li>
          <li><a href="#" onclick="openPopup()">Rate Us</a></li>
          <li class="buy-tickets"><a href="logout" class="logout" style="background-color:#432E54">Log Out</a></li>
          <li class="buy-tickets"><img src="${user.profilePicPath }" alt="" 
            style="width: 40px; height: 40px;  border-radius: 50%; object-fit: cover; border: 2px solid rgb(255, 0, 0);"></li>
        </ul>
      </nav><!-- #nav-menu-container -->
    </div>
  </header><!-- #header -->
</body>
</html>
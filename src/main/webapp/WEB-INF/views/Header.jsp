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
  <link href="img/logo.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800" rel="stylesheet">
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="lib/animate/animate.min.css" rel="stylesheet">
  <link href="lib/venobox/venobox.css" rel="stylesheet">
  <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">

  <style>
    nav ul li a {
      text-decoration: none !important;
    }

    .logout {
      background-color: #432e543b;
    }

    /* City Dropdown Styling */
    .city-dropdown {
      position: relative;
      display: inline-block;
      margin-top: 10px;
    }

    .city-btn {
      background-color: #432E54;
      color: white;
      padding: 8px 16px;
      border-radius: 8px;
      font-weight: bold;
      cursor: pointer;
      transition: all 0.3s ease;
      border: none;
      box-shadow: 0 0 10px rgba(67, 46, 84, 0.4);
    }

    .city-btn:hover {
      background-color: #060d22;
      box-shadow: 0 0 15px rgba(67, 46, 84, 0.7);
    }

    .city-list {
      display: none;
      position: absolute;
      background-color: white;
      border-radius: 8px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
      margin-top: 5px;
      z-index: 1000;
      list-style: none;
      padding: 0;
      width: 170px;
    }

    .city-list li {
      padding: 10px 16px;
      color: #333;
      cursor: pointer;
      transition: background-color 0.2s;
    }

    .city-list li:hover {
      background-color: #060d22;
      color: white;
    }

    .city-dropdown.open .city-list {
      display: block;
    }

    .city-list li i {
      margin-right: 8px;
      color: #f82249;
    }

    .city-btn i {
      margin-right: 8px;
    }

    .welcome-text {
      color: white;
      font-size: 14px;
      font-weight: bold;
      margin-top: 10px;
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
        <!-- Logo and app title -->
        <h2 style="color: red;">
          <img src="img/logo.png" alt="" title="">
          Pocket<span>B</span>uddy
        </h2>

        <!-- City Dropdown Menu using UL with Icons -->
       

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
              <li><a class="dropdown-item" href="comedy">Comedy</a></li>
            </ul>
          </li>
          <li><a href="#schedule">Schedule</a></li>
          <li><a href="#contact">Contact</a></li>
          <li><a href="#about">About</a></li>
          <li><a href="#" onclick="openPopup()">Rate Us</a></li>
          <li class="buy-tickets"><a href="logout" class="logout" style="background-color:#432E54">Log Out</a></li>
          <li class="buy-tickets">
            <img src="${user.profilePicPath}" alt="User"
              style="width: 40px; height: 40px; border-radius: 50%; object-fit: cover; border: 2px solid red;">
            <span style="color:white;">Hello, <strong>${user.firstName}</strong></span>
          </li>
        </ul>
      </nav><!-- #nav-menu-container -->

    </div>
  </header><!-- #header -->

  <!-- JavaScript for Dropdown -->
  <script>
    function toggleCityDropdown() {
      document.getElementById('cityDropdown').classList.toggle('open');
    }

    function selectCity(city) {
      const btn = document.querySelector('.city-btn');
      btn.innerHTML = '<i class="fas fa-map-marker-alt"></i> ' + city;
      document.getElementById('cityDropdown').classList.remove('open');
      console.log("Selected city:", city);

      // Optional: Redirect or store selected city
      // window.location.href = `/events?city=${city}`;
    }

    // Close dropdown on outside click
    document.addEventListener('click', function(event) {
      const dropdown = document.getElementById('cityDropdown');
      if (!dropdown.contains(event.target)) {
        dropdown.classList.remove('open');
      }
    });
  </script>

</body>
</html>

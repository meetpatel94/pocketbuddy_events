<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home page</title>
</head>
<body>
  <jsp:include page="HomeHeader.jsp"></jsp:include>
<h3>Welcome, ${user.firstName } </h3><br><br>

</body>
</html> --%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>TheEvent - Bootstrap Event Template</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

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
</head>

<body>

    <!--========================== Header ============================-->
    <jsp:include page="Header.jsp"></jsp:include>

    <!--========================== Intro Section ============================-->
    <jsp:include page="Intro.jsp"></jsp:include>

<main id="main">
  
    <!--========================== About Section ============================-->
    <jsp:include page="AboutPage.jsp"></jsp:include>
  
    <!--======================== Speakers Section ==========================-->
    <jsp:include page="Speaker.jsp"></jsp:include>

    <!--========================== Event Venue Section ============================-->
    <jsp:include page="EventVenue.jsp"></jsp:include>  

    <!--========================== Hotels Section ============================-->
    <jsp:include page="Hotel.jsp"></jsp:include>

    <!--========================== Gallery Section ============================-->
    <jsp:include page="Gallery.jsp"></jsp:include>

    <!--========================== Sponsors Section ============================-->
    <jsp:include page="Sponsors.jsp"></jsp:include>

    <!--========================== F.A.Q Section ============================-->
    <jsp:include page="FAQ.jsp"></jsp:include>

    <!--========================== Subscribe Section ============================-->
    <jsp:include page="Subscribe.jsp"></jsp:include>
    
    <!--========================== Contact Section ============================-->
    <jsp:include page="ContactUs.jsp"></jsp:include>

</main>


  <!--============================== Footer ============================-->
  <jsp:include page="Footer.jsp"></jsp:include>

  <a href="#" class="back-to-top"><i class="fa fa-angle-up"></i></a>

  <!-- JavaScript Libraries -->
  <jsp:include page="JS.jsp"></jsp:include>
  
</body>
</html>

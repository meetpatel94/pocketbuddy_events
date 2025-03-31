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
  <title>PocketBuddy-ShowNearByEvents</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="img/logo.png" rel="icon">
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
   <style>
  button {
    background-color: #007bff;
    color: white;
    padding: 12px 24px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 18px;
    transition: 0.3s ease-in-out;
}

button:hover {
    background-color: #0056b3;
}

/* Popup Styles */
.popup {
    display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%) scale(0.8);
    background: white;
    padding: 20px 20px 0px 20px;
    box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.3);
    border-radius: 12px;
    width: 440px;
    text-align: center;
    opacity: 0;
    transition: transform 0.3s ease-out, opacity 0.3s ease-out;
    z-index: 1000;
}

.popup.show {
    display: block;
    opacity: 1;
    transform: translate(-50%, -50%) scale(1);
}

/* Star Rating */
.stars {
    display: flex;
    justify-content: center;
    margin: 10px 0;
}

.star {
    font-size: 35px;
    cursor: pointer;
    color: lightgray;
    transition: color 0.2s ease-in-out;
}

.star:hover,
.star.active {
    color: gold;
}

/* Form Styling */
form {
    display: flex;
    flex-direction: column;
    align-items: center;
}

select, input[type="number"], input[type="text"] {
    width: 90%;
    padding: 8px;
    margin: 8px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
}

input[type="submit"] {
    background-color: #28a745;
    color: white;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
    border-radius: 5px;
    font-size: 16px;
    transition: 0.3s ease-in-out;
}

input[type="submit"]:hover {
    background-color: #218838;
}

/* Close Button */
.close {
    background: red;
    color: white;
    border: none;
    padding: 8px 15px;
    cursor: pointer;
    border-radius: 5px;
    margin-top: 10px;
    transition: 0.3s ease-in-out;
}

.close:hover {
    background: darkred;
}

/* Emoji Display */
.emoji {
    font-size: 40px;
    margin-top: 10px;
    opacity: 0;
    transition: opacity 0.3s ease-in-out, transform 0.3s ease-in-out;
}

.emoji.show {
    opacity: 1;
    transform: scale(1.1);
}

/* Responsive Design */
@media (max-width: 400px) {
    .popup {
        width: 90%;
    }
}
</style>
</head>
<body>

    <!--========================== Header ============================-->
      <header id="header">
    <div class="container">

      <div id="logo" class="pull-left">
        <!-- Uncomment below if you prefer to use a text logo -->
        <h2 style="color: red;"><img src="img/logo.png" alt="" title=""> Pocket<span>B</span>uddy</a></h2>
        <!-- <a href="#intro" class="scrollto"><img src="img/logo.png" alt="" title=""></a> -->
      </div>

      <nav id="nav-menu-container">
        <ul class="nav-menu">
          <li class="menu-active"><a href="#intro">Home</a></li> 
          <li><a href="#venue">Events</a></li>
           <li><a href="#schedule">Schedule</a></li>
          <!-- <li><a href="#hotels">Hotels</a></li> -->
          <li><a href="#gallery">Gallery</a></li>
          <li><a href="#sponsors">Sponsors</a></li>
          <li><a href="#contact">Contact</a></li>
          <li><a href="#about">About</a></li>
          <li class="buy-tickets"><a href="login">Login</a></li>
          <li class="buy-tickets"><img src="img/user-img.png" alt="" 
            style="width: 40px; height: 40px;  border-radius: 50%; object-fit: cover; border: 2px solid rgb(255, 0, 0);"></li>
        </ul>
      </nav><!-- #nav-menu-container -->
    </div>
  </header><!-- #header -->
    
    <!--========================== RatingPopupPage ============================-->
    <jsp:include page="RatingPopupPage.jsp"></jsp:include>
    
    <!--========================== Intro Section ============================-->
    <jsp:include page="Intro.jsp"></jsp:include>

<main id="main">
  
    <!--========================== About Section ============================-->
    <jsp:include page="AboutPage.jsp"></jsp:include>
  
    <!--======================== Speakers Section ==========================-->
    <jsp:include page="Speaker.jsp"></jsp:include>

    <!--======================== Event Schedule Section ==========================-->
    <jsp:include page="EventSchedule.jsp"></jsp:include>

    <!--========================== Event Venue Section ============================-->
    <jsp:include page="EventVenue.jsp"></jsp:include>  

    <!--========================== Hotels Section ============================-->
    <%-- <jsp:include page="Hotel.jsp"></jsp:include> --%>

    <!--========================== Gallery Section ============================-->
    <jsp:include page="Gallery.jsp"></jsp:include>

    <!--========================== Sponsors Section ============================-->
    <jsp:include page="Sponsors.jsp"></jsp:include>

    <!--========================== F.A.Q Section ============================-->
    <jsp:include page="FAQ.jsp"></jsp:include>

    <!--========================== Subscribe Section ============================-->
    <jsp:include page="Subscribe.jsp"></jsp:include>
    
    <!--========================== BuyTicket Section ============================-->
      <!--==========================
      Buy Ticket Section
    ============================-->
    <section id="buy-tickets" class="section-with-bg wow fadeInUp">
      <div class="container">

        <div class="section-header">
          <h2>Buy Tickets</h2>
          <p>Velit consequatur consequatur inventore iste fugit unde omnis eum aut.</p>
        </div>

        <div class="row">
          <div class="col-lg-4">
            <div class="card mb-5 mb-lg-0">
              <div class="card-body">
                <h5 class="card-title text-muted text-uppercase text-center">Standard Access</h5>
                <h6 class="card-price text-center">$150</h6>
                <hr>
                <ul class="fa-ul">
                  <li><span class="fa-li"><i class="fa fa-check"></i></span>Regular Seating</li>
                  <li><span class="fa-li"><i class="fa fa-check"></i></span>Coffee Break</li>
                  <li><span class="fa-li"><i class="fa fa-check"></i></span>Custom Badge</li>
                  <li class="text-muted"><span class="fa-li"><i class="fa fa-times"></i></span>Community Access</li>
                  <li class="text-muted"><span class="fa-li"><i class="fa fa-times"></i></span>Workshop Access</li>
                  <li class="text-muted"><span class="fa-li"><i class="fa fa-times"></i></span>After Party</li>
                </ul>
                <hr>
                <div class="text-center">
                  <button type="button" class="btn" data-toggle="modal" data-target="#buy-ticket-modal" data-ticket-type="standard-access" disabled>Buy Now</button>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="card mb-5 mb-lg-0">
              <div class="card-body">
                <h5 class="card-title text-muted text-uppercase text-center">Pro Access</h5>
                <h6 class="card-price text-center">$250</h6>
                <hr>
                <ul class="fa-ul">
                  <li><span class="fa-li"><i class="fa fa-check"></i></span>Regular Seating</li>
                  <li><span class="fa-li"><i class="fa fa-check"></i></span>Coffee Break</li>
                  <li><span class="fa-li"><i class="fa fa-check"></i></span>Custom Badge</li>
                  <li><span class="fa-li"><i class="fa fa-check"></i></span>Community Access</li>
                  <li class="text-muted"><span class="fa-li"><i class="fa fa-times"></i></span>Workshop Access</li>
                  <li class="text-muted"><span class="fa-li"><i class="fa fa-times"></i></span>After Party</li>
                </ul>
                <hr>
                <div class="text-center">
                  <button type="button" class="btn" data-toggle="modal" data-target="#buy-ticket-modal" data-ticket-type="pro-access" disabled>Buy Now</button>
                </div>
              </div>
            </div>
          </div>
          <!-- Pro Tier -->
          <div class="col-lg-4">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title text-muted text-uppercase text-center">Premium Access</h5>
                <h6 class="card-price text-center">$350</h6>
                <hr>
                <ul class="fa-ul">
                  <li><span class="fa-li"><i class="fa fa-check"></i></span>Regular Seating</li>
                  <li><span class="fa-li"><i class="fa fa-check"></i></span>Coffee Break</li>
                  <li><span class="fa-li"><i class="fa fa-check"></i></span>Custom Badge</li>
                  <li><span class="fa-li"><i class="fa fa-check"></i></span>Community Access</li>
                  <li><span class="fa-li"><i class="fa fa-check"></i></span>Workshop Access</li>
                  <li><span class="fa-li"><i class="fa fa-check"></i></span>After Party</li>
                </ul>
                <hr>
                <div class="text-center">
                  <button type="button" class="btn" data-toggle="modal" data-target="#buy-ticket-modal" data-ticket-type="premium-access" disabled>Buy Now</button>
                </div>

              </div>
            </div>
          </div>
        </div>

      </div>

      <!-- Modal Order Form -->
      <div id="buy-ticket-modal" class="modal fade">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title" >Buy Tickets</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <form method="POST" action="#">
                <div class="form-group">
                  <input type="text" class="form-control" name="your-name" placeholder="Your Name">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control" name="your-email" placeholder="Your Email">
                </div>
                <div class="form-group">
                  <select id="ticket-type" name="ticket-type" class="form-control" >
                    <option value="">-- Select Your Ticket Type --</option>
                    <option value="standard-access">Standard Access</option>
                    <option value="pro-access">Pro Access</option>
                    <option value="premium-access">Premium Access</option>
                  </select>
                </div>
                <div class="text-center">
                  <button type="submit" class="btn">Buy Now</button>
                </div>
              </form>
            </div>
          </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
      </div><!-- /.modal -->

    </section>
    
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

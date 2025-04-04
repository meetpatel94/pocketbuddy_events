<%--  <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Admin | List User</title>

<jsp:include page="AdminCss.jsp"></jsp:include>


<link  href="https://cdn.datatables.net/2.2.2/css/dataTables.bootstrap5.min.css" rel="stylesheet"/>
  <!-- Bootstrap CSS File -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="lib/animate/animate.min.css" rel="stylesheet">
  <link href="lib/venobox/venobox.css" rel="stylesheet">
  <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="css/style.css" rel="stylesheet">
  <style>
  .container-fluid{
   padding-left: 320px;
  }
  .header{
   height:60px !important;
  }
  .align-items-center{
   padding-left: 10px;
  }

    /* Add the CSS you provided here */
    #venue {
      padding: 60px 0;
    }
    /* ... rest of your CSS ... */
    
    /* Additional responsive styles */
    @media (max-width: 992px) {
      .venue-map, .venue-info {
        height: 400px;
      }
    }
    
    @media (max-width: 768px) {
      .venue-map, .venue-info {
        height: 300px;
      }
      
      #venue .venue-info h3 {
        font-size: 28px;
      }
    }
    
    .venue-details {
      background: rgba(255,255,255,0.1);
      padding: 20px;
      margin-bottom: 15px;
      border-radius: 5px;
    }
    
    .venue-rating {
      color: #FFD700;
      margin: 10px 0;
    }
</style>

</head>
<body>
	<jsp:include page="AdminHeader.jsp"></jsp:include>

	<jsp:include page="AdminSidebar.jsp"></jsp:include>


	<!-- main content end  -->
	<section id="venue" class="wow fadeInUp">
  <div class="container-fluid">
    <div class="section-header">
      <h2>Events Venue</h2>
      <p>Event venue location info and gallery</p>
    </div>

    <div class="row no-gutters">
      <div class="col-lg-6 venue-map">
        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12097.433213460943!2d-74.0062269!3d40.7101282!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb89d1fe6bc499443!2sDowntown+Conference+Center!5e0!3m2!1smk!2sbg!4v1539943755621" frameborder="0" style="border:0" allowfullscreen></iframe>
      </div>

      <div class="col-lg-6 venue-info">
        <div class="row justify-content-center">
          <div class="col-11 col-lg-8">
            <h3>Downtown Conference Center, New York</h3>
            <div class="venue-details">
              <p><strong>Address:</strong> 157 William St, New York, NY 10038, United States</p>
              <div class="venue-rating">4.3 ★★★★☆ (82 reviews)</div>
              <p>Nearby: 9/11 Memorial & Museum</p>
              <p>Area: Lower Manhattan (Chinatown)</p>
            </div>
            <p>Iste nobis eum sapiente sunt enim dolores labore accusantium autem. Cumque beatae ipsam. Est quae sit qui voluptatem corporis velit. Qui maxime accusamus possimus. Consequatur sequi et ea suscipit enim nesciunt quia velit.</p>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="container-fluid venue-gallery-container">
    <div class="row no-gutters">
      <div class="col-6 col-md-4 col-lg-3">
        <div class="venue-gallery">
          <a href="img/venue-gallery/1.jpg" class="venobox" data-gall="venue-gallery">
            <img src="img/venue-gallery/1.jpg" alt="Venue image 1" class="img-fluid">
          </a>
        </div>
      </div>
      <!-- Repeat for other gallery items, changing col-6 for mobile -->
    </div>
  </div>
</section>

	<footer id="footer" class="footer" style="background-color:white">
	<div class="copyright">
		© Copyright <strong><span>Pocketbuddy</span></strong>. All Rights
		Reserved
	</div>
</footer>
<a href="#" class="back-to-top"><i class="fa fa-angle-up"></i></a>
	<jsp:include page="AdminJs.jsp"></jsp:include>
	
	

	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

 	<script src="https://cdn.datatables.net/2.2.2/js/dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/2.2.2/js/dataTables.bootstrap5.min.js"></script>
  
 
  

  <!-- JavaScript Libraries -->
  <jsp:include page="JS.jsp"></jsp:include>
 

	<script type="text/javascript">

	$( document ).ready(function() {
		let table = new DataTable('#myTable',{
			 
		});
	});
	</script>

</body>
</html>

 --%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pocketbuddy-AdminDashboard</title>
<link
      rel="icon"
      href="img/logo.png"
      type="image/x-icon"
    />
    <jsp:include page="AdminCss.jsp"></jsp:include>


<link  href="https://cdn.datatables.net/2.2.2/css/dataTables.bootstrap5.min.css" rel="stylesheet"/>
  <!-- Bootstrap CSS File -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="lib/animate/animate.min.css" rel="stylesheet">
  <link href="lib/venobox/venobox.css" rel="stylesheet">
  <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="css/style.css" rel="stylesheet">
  <style>
  .container-fluid{
   padding-left: 320px;
  }
  .header{
   height:60px !important;
  }
  .align-items-center{
   padding-left: 10px;
  }

    /* Add the CSS you provided here */
    #venue {
      padding: 60px 0;
    }
    /* ... rest of your CSS ... */
    
    /* Additional responsive styles */
    @media (max-width: 992px) {
      .venue-map, .venue-info {
        height: 400px;
      }
    }
    
    @media (max-width: 768px) {
      .venue-map, .venue-info {
        height: 300px;
      }
      
      #venue .venue-info h3 {
        font-size: 28px;
      }
    }
    
    .venue-details {
      background: rgba(255,255,255,0.1);
      padding: 20px;
      margin-bottom: 15px;
      border-radius: 5px;
    }
    
    .venue-rating {
      color: #FFD700;
      margin: 10px 0;
    }
</style>

    <!-- Fonts and icons -->
    <script src="aset/assets/js/plugin/webfont/webfont.min.js"></script>
    <script>
      WebFont.load({
        google: { families: ["Public Sans:300,400,500,600,700"] },
        custom: {
          families: [
            "Font Awesome 5 Solid",
            "Font Awesome 5 Regular",
            "Font Awesome 5 Brands",
            "simple-line-icons",
          ],
          urls: ["aset/assets/css/fonts.min.css"],
        },
        active: function () {
          sessionStorage.fonts = true;
        },
      });
    </script>
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
    <!-- CSS Files -->
    <link rel="stylesheet" href="aset/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="aset/assets/css/plugins.min.css" />
    <link rel="stylesheet" href="aset/assets/css/kaiadmin.min.css" />

    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link rel="stylesheet" href="aset/assets/css/demo.css" />
    <style>
     main{
        margin-left:20px;
     }
     .user-box .u-text {
    padding: 0 5px;
}

/* Hide the notification popup */
[data-notify="container"] {
    display: none !important;
    visibility: hidden !important;
    opacity: 0 !important;
    pointer-events: none !important;
}

/* Prevent animation */
.animated, .fadeInDown {
    animation: none !important;
}

    </style>
</head>
<body>
   
   <!-- sidebar -->
   <div class="wrapper">
   <jsp:include page="ADMIN_Sidebar.jsp"></jsp:include>
   
   <!-- header -->
   <jsp:include page="ADMIN_Header.jsp"></jsp:include>
   
   <!-- container  -->
   <div class="container">
   	<section id="venue" class="wow fadeInUp">
  <div class="container-fluid">
    <div class="section-header">
      <h2>Events Venue</h2>
      <p>Event venue location info and gallery</p>
    </div>

    <div class="row no-gutters">
      <div class="col-lg-6 venue-map">
        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12097.433213460943!2d-74.0062269!3d40.7101282!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb89d1fe6bc499443!2sDowntown+Conference+Center!5e0!3m2!1smk!2sbg!4v1539943755621" frameborder="0" style="border:0" allowfullscreen></iframe>
      </div>

      <div class="col-lg-6 venue-info">
        <div class="row justify-content-center">
          <div class="col-11 col-lg-8">
            <h3>Downtown Conference Center, New York</h3>
            <div class="venue-details">
              <p><strong>Address:</strong> 157 William St, New York, NY 10038, United States</p>
              <div class="venue-rating">4.3 ★★★★☆ (82 reviews)</div>
              <p>Nearby: 9/11 Memorial & Museum</p>
              <p>Area: Lower Manhattan (Chinatown)</p>
            </div>
            <p>Iste nobis eum sapiente sunt enim dolores labore accusantium autem. Cumque beatae ipsam. Est quae sit qui voluptatem corporis velit. Qui maxime accusamus possimus. Consequatur sequi et ea suscipit enim nesciunt quia velit.</p>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="container-fluid venue-gallery-container">
    <div class="row no-gutters">
      <div class="col-6 col-md-4 col-lg-3">
        <div class="venue-gallery">
          <a href="img/venue-gallery/1.jpg" class="venobox" data-gall="venue-gallery">
            <img src="img/venue-gallery/1.jpg" alt="Venue image 1" class="img-fluid">
          </a>
        </div>
      </div>
      <!-- Repeat for other gallery items, changing col-6 for mobile -->
    </div>
  </div>
</section>

    <!-- footer -->
   <jsp:include page="ADMIN_Footer.jsp"></jsp:include>
   </div>
    
<%--    <jsp:include page="ColorPalate.jsp"></jsp:include> --%>
   </div>
          
    <!-- JS -->
   <jsp:include page="ADMIN_Js.jsp"></jsp:include>

</body>
</html>
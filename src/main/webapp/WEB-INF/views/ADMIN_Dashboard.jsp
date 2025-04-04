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
   <jsp:include page="ADMIN_Home.jsp"></jsp:include>

    <!-- footer -->
   <jsp:include page="ADMIN_Footer.jsp"></jsp:include>
   </div>
    
<%--    <jsp:include page="ColorPalate.jsp"></jsp:include> --%>
   </div>
          
    <!-- JS -->
   <jsp:include page="ADMIN_Js.jsp"></jsp:include>

</body>
</html>
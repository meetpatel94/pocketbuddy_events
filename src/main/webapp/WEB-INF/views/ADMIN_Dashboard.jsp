<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    
/* For the entire document */
::-webkit-scrollbar {
  width: 12px;               /* width of the scrollbar */
}

::-webkit-scrollbar-track {
  background: #f1f1f1;       /* color of the track */
}

::-webkit-scrollbar-thumb {
  background: #432E54;          /* color of the scrollbar */
  border-radius: 6px;        /* rounded corners */
}

::-webkit-scrollbar-thumb:hover {
  background: #f82249;          /* color on hover */
}
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
.non{
  display:none;
}
/* Toast Notification Styles */
.toast-notification {
    position: fixed;
    bottom: 30px;
    right: 30px;
    background-color: #4BB543;
    color: white;
    padding: 15px 25px;
    border-radius: 5px;
    display: flex;
    align-items: center;
    box-shadow: 0 4px 12px rgba(0,0,0,0.15);
    z-index: 99999;
    transform: translateY(100px);
    opacity: 0;
    transition: all 0.3s ease;
}

.toast-notification.show {
    transform: translateY(0);
    opacity: 1;
}

.toast-icon {
    margin-right: 15px;
    font-size: 24px;
}

.toast-message {
    font-size: 16px;
    font-weight: 500;
}
    </style>
</head>
<body>
 <div id="loginToast" class="toast-notification">
  <div class="toast-icon">
    <i class="fas fa-check-circle"></i>
  </div>
  <div class="toast-message">Login Successful!</div>
</div>  
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
<script>
// Function to show toast notification
function showLoginToast() {
    const toast = document.getElementById('loginToast');
    toast.classList.add('show');
    
    // Hide after 3 seconds
    setTimeout(() => {
        toast.classList.remove('show');
    }, 3000);
}

// Check for login success parameter in URL
document.addEventListener('DOMContentLoaded', function() {
    const urlParams = new URLSearchParams(window.location.search);
    const loginSuccess = urlParams.get('login');
    
    if (loginSuccess === 'success') {
        showLoginToast();
        
        // Clean the URL (remove the parameter)
        const cleanUrl = window.location.protocol + "//" + window.location.host + window.location.pathname;
        window.history.replaceState({}, document.title, cleanUrl);
    }
});
</script>
</body>
</html>
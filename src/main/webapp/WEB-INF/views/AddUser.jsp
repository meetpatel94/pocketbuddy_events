<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
/* New Ripple Loader styles */
.loader-container {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(255, 255, 255, 0.9);
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  z-index: 9999;
  display: none;
}

.loader-text {
  margin-bottom: 20px;
  font-size: 18px;
  color: #000000;
  font-weight: bold;
}

.lds-ripple,
.lds-ripple div {
  box-sizing: border-box;
}
.lds-ripple {
  display: inline-block;
  position: relative;
  width: 80px;
  height: 80px;
}
.lds-ripple div {
  position: absolute;
  border: 4px solid currentColor;
  opacity: 1;
  border-radius: 50%;
  animation: lds-ripple 1s cubic-bezier(0, 0.2, 0.8, 1) infinite;
  color: #514b82; /* Purple color for the ripple */
}
.lds-ripple div:nth-child(2) {
  animation-delay: -0.5s;
}
@keyframes lds-ripple {
  0% {
    top: 36px;
    left: 36px;
    width: 8px;
    height: 8px;
    opacity: 0;
  }
  4.9% {
    top: 36px;
    left: 36px;
    width: 8px;
    height: 8px;
    opacity: 0;
  }
  5% {
    top: 36px;
    left: 36px;
    width: 8px;
    height: 8px;
    opacity: 1;
  }
  100% {
    top: 0;
    left: 0;
    width: 80px;
    height: 80px;
    opacity: 0;
  }
}
</style>
</head>
<body>
   <!-- Loader -->
   <div class="loader-container">
     <div class="loader-text">Loading</div>
     <div class="lds-ripple"><div></div><div></div></div>
   </div>
   
   <!-- sidebar -->
   <div class="wrapper">
   <jsp:include page="ADMIN_Sidebar.jsp"></jsp:include>
   
   <!-- header -->
   <jsp:include page="ADMIN_Header.jsp"></jsp:include>
   
   <!-- container  -->
   	 <div class="container">
     <main id="main" class="main">
        <div class="pagetitle animate__animated animate__fadeIn">
            <h1>Add User</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="admindashboard">Home</a></li>
                    <li class="breadcrumb-item active">Add User</li>
                </ol>
            </nav>
        </div><!-- End Page Title -->

    	<section class="section dashboard" style="color:black;">
			<form action="adminsaveuser" method="post" enctype="multipart/form-data" onsubmit="showLoader()">
				First Name: <input type="text" name="firstName"> &emsp;
				Last Name: <input type="text" name="lastName"> <br><br> 
			    Gender:<select name="gender"  >
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="trans">Transgender</option>
                    <option value="other">Other</option>
                </select> <br><br>
	            Email : <input type="email" name="email"/> &emsp;
	            Password: <input type="password" name="password"> <br><br>
	            Date Of birth: <input type="date" name="bornYear"> <br><br>
	            Contact No.: <input type="text" name="contactNum"> <br><br>
	            Upload Photo: <input type = "file" name ="profilePic"><br><br>
				<input type="submit" value="Save Member">
			</form>
    	</section>
 </div>
</main>
    <!-- main content end  -->

    <!-- footer -->
    <jsp:include page="ADMIN_Footer.jsp"></jsp:include>
    </div>  
    <!-- JS -->
    <jsp:include page="ADMIN_Js.jsp"></jsp:include>
    
    <script>
    // Show loader when form is submitted
    function showLoader() {
        document.querySelector('.loader-container').style.display = 'flex';
    }
    
    // Hide loader when page is fully loaded
    window.addEventListener('load', function() {
        document.querySelector('.loader-container').style.display = 'none';
    });
    </script>
</body>
</html> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
/* Custom Loader styles */
.admin-loading-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(255, 255, 255, 0.9);
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  z-index: 9999;
  display: none;
}

.admin-loading-text {
  margin-bottom: 20px;
  font-size: 18px;
  color: #514b82;
  font-weight: bold;
}

.admin-spinner-loader {
  width: 40px;
  aspect-ratio: 1;
  position: relative;
  transform: rotate(45deg);
}

.admin-spinner-loader:before,
.admin-spinner-loader:after {
  content: "";
  position: absolute;
  inset: 0;
  border-radius: 50% 50% 0 50%;
  background: #514b82;
  -webkit-mask: radial-gradient(circle 10px at 50% 50%,#0000 94%,#000);
}

.admin-spinner-loader:after {
  animation: admin-spin-animation 1s infinite;
  transform: perspective(300px) translateZ(0px)
}

@keyframes admin-spin-animation {
  to {transform: perspective(300px) translateZ(150px);opacity:0}
}
</style>
</head>
<body>
   <!-- Loader -->
   <div class="admin-loading-overlay">
     <div class="admin-loading-text">Loading...</div>
     <div class="admin-spinner-loader"></div>
   </div>
   
   <!-- sidebar -->
   <div class="wrapper">
   <jsp:include page="ADMIN_Sidebar.jsp"></jsp:include>
   
   <!-- header -->
   <jsp:include page="ADMIN_Header.jsp"></jsp:include>
   
   <!-- container  -->
   	 <div class="container">
     <main id="main" class="main">
        <div class="pagetitle animate__animated animate__fadeIn">
            <h1>Add User</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="admindashboard">Home</a></li>
                    <li class="breadcrumb-item active">Add User</li>
                </ol>
            </nav>
        </div><!-- End Page Title -->

    	<section class="section dashboard" style="color:black;">
			<form action="adminsaveuser" method="post" enctype="multipart/form-data" onsubmit="showAdminLoader()">
				First Name: <input type="text" name="firstName"> &emsp;
				Last Name: <input type="text" name="lastName"> <br><br> 
			    Gender:<select name="gender"  >
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="trans">Transgender</option>
                    <option value="other">Other</option>
                </select> <br><br>
	            Email : <input type="email" name="email"/> &emsp;
	            Password: <input type="password" name="password"> <br><br>
	            Date Of birth: <input type="date" name="bornYear"> <br><br>
	            Contact No.: <input type="text" name="contactNum"> <br><br>
	            Upload Photo: <input type = "file" name ="profilePic"><br><br>
				<input type="submit" value="Save Member">
			</form>
    	</section>
 </div>
</main>
    <!-- main content end  -->

    <!-- footer -->
    <jsp:include page="ADMIN_Footer.jsp"></jsp:include>
    </div>  
    <!-- JS -->
    <jsp:include page="ADMIN_Js.jsp"></jsp:include>
    
    <script>
    // Show loader when form is submitted
    function showAdminLoader() {
        document.querySelector('.admin-loading-overlay').style.display = 'flex';
    }
    
    // Hide loader when page is fully loaded
    window.addEventListener('load', function() {
        document.querySelector('.admin-loading-overlay').style.display = 'none';
    });
    </script>
</body>
</html>
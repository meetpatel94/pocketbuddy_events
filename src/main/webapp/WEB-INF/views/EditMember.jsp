<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Member</title>
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
    	<main id="main" class="main">
       <div class="nen">
    	<div class="pagetitle">
      		<h1>Edit Member</h1>
      		<nav>
        		<ol class="breadcrumb">
          			<li class="breadcrumb-item"><a href="admindashboard">Home</a></li>
          			<li class="breadcrumb-item active"><a href="listmembers">List Member</a></li>
          			<li class="breadcrumb-item active">Edit Member</li>
        		</ol>
      		</nav>
    	</div><!-- End Page Title -->

    	<section class="section dashboard" style="color:black;">
			<form action="updatemember" method="post" enctype="multipart/form-data">
				Member Name: <input type="text" name="memberName" value="${member.memberName }"> &emsp;
	            Age : <input type="text" name="age" value="${member.age }"/><br><br>
	            Upload Photo: <input type = "file" name ="profilePic" ><br><br>
	            <input type="hidden" name="memberId" value="${member.memberId }" />
	            <input type="hidden" name="role" value="${member.role }" />
				<input type="submit" value="Save User"> <br><br>
				<a href="listmembers">Back</a>
			</form>
    	</section>
 </div>

  	</main><!-- End #main -->
    
    <!-- main content end  -->

    <!-- footer -->
    <jsp:include page="ADMIN_Footer.jsp"></jsp:include>
    </div>  
    <!-- JS -->
    <jsp:include page="ADMIN_Js.jsp"></jsp:include>
</body>
</html>
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
      		<h1>Edit User</h1>
      		<nav>
        		<ol class="breadcrumb">
          			<li class="breadcrumb-item"><a href="admindashboard">Home</a></li>
          			<li class="breadcrumb-item active"><a href="listuser">List User</a></li>
          			<li class="breadcrumb-item active">Edit User</li>
        		</ol>
      		</nav>
    	</div><!-- End Page Title -->

    	<section class="section dashboard" style="color:black;">
			<form action="updateuser" method="post" enctype="multipart/form-data">
				First Name: <input type="text" name="firstName" value="${user.firstName }"> &emsp;
				Last Name : <input type="text" name="lastName" value="${user.lastName }"/><br><br> 
				Gender : <select name="gender" value="${user.gender }" >
				<option value="male">Male</option>
				<option value="female">Female</option>
				<option value="trans">Transgender</option>
				<option value="other">Other</option>
				</select><br><br>
	            Email : <input type="email" name="email" value="${user.email }"/><br><br>
	            D.O.B. : <input type="date" name="bornYear" value="${user.bornYear }"/><br><br>
	            ContactNo : <input type="text" name="contactNum" value="${user.contactNum }"/><br><br>
	            Upload Photo: <input type = "file" name ="profilePic" ><br><br>
	            <%-- <input type="hidden" name="role" value="${user.role }" /> --%>
	            Role:<select name="role" >
	               <option value="${user.role }">${user.role }</option>
	               <option value="USER">User</option>
	               <option value="ADMIN">Admin</option>
	            </select><br><br>
	            <input type="hidden" name="userId" value="${user.userId }" />
	         
				<input type="submit" value="Save User"> <br><br>
				<a href="listuser">Back</a>
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
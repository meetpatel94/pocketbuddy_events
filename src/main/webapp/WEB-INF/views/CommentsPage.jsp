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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    

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
section, .pan{
 margin-left:20px !important;
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
     <main id="main" class="main"></main>
        <div class="pagetitle animate__animated animate__fadeIn pan">
            <h1>Add User</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="admindashboard">Home</a></li>
                    <li class="breadcrumb-item active">Add User</li>
                </ol>
            </nav>
        </div><!-- End Page Title -->

    	<section class="section dashboard">
  <div class="row">
    <c:forEach items="${comments}" var="c">
      <div class="col-md-6 col-lg-4 mb-4">
        <div class="card shadow-sm border-0">
          <div class="card-body">
            <h5 class="card-title mb-2 text-primary">
              <i class="fas fa-user-circle me-2"></i>${c.name}
            </h5>
            <p class="mb-1">
              <i class="fas fa-envelope me-2 text-muted"></i>
              <strong>Email:</strong> ${c.email}
            </p>
            <p class="mb-1">
              <i class="fas fa-tag me-2 text-muted"></i>
              <strong>Subject:</strong> ${c.subject}
            </p>
            <p>
              <i class="fas fa-comment-dots me-2 text-muted"></i>
              <strong>Description:</strong> ${c.message}
            </p>
          </div>
          <div class="card-footer text-end bg-white border-0">
            <a href="deletecomments?commentUserId=${c.commentUserId }" class="btn btn-sm btn-outline-danger">
              <i class="fas fa-trash-alt"></i> Delete
            </a>
          </div>
        </div>
      </div>
    </c:forEach>
  </div>
</section>
  </div>
</main>
    <!-- main content end  -->

    <!-- footer -->
    <jsp:include page="ADMIN_Footer.jsp"></jsp:include>
    </div>  
    <!-- JS -->
    <jsp:include page="ADMIN_Js.jsp"></jsp:include>
</body>
</html>
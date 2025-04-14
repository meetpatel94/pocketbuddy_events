<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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

</head>
<body>
	<jsp:include page="AdminHeader.jsp"></jsp:include>

	<jsp:include page="AdminSidebar.jsp"></jsp:include>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>List User</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="admindashboard">Home</a></li>
					<li class="breadcrumb-item active">List Members</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->
		<section class="section dashboard">
			<div class="row" style="min-height: 500px;">
				<div class="col-lg-12">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body">
									<h5 class="card-title">Users<span>/all</span></h5>
									   MemberName: ${member.memberName } <br><br>
									   Age: ${member.age} <br><br>
									   Profile photo: ${member.profilePhoto } <br><br>
									    <div style="color:red;">
									      <a href="#" style="color:red;">Edit</a> | 
									      <a href="deletemember?memberId=${m.memberId}" style="color:red;">Delete</i></a> <br><br>
									    </div>
									 <p style="color:blue; text-decoration: underline"><a href="listmembers"> Back </a> </p>
							   </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- main content end  -->

	<jsp:include page="AdminFooter.jsp"></jsp:include>

	<jsp:include page="AdminJs.jsp"></jsp:include>
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
 	<script src="https://cdn.datatables.net/2.2.2/js/dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/2.2.2/js/dataTables.bootstrap5.min.js"></script>
	<script type="text/javascript">

	$( document ).ready(function() {
		let table = new DataTable('#myTable',{
			 
		});
	});
	</script>

</body>
</html>--%>
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

        .container {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 390px;
            text-align: center;
        }
        
        .info {
            margin-top: 10px;
            text-align: left;
        }
        .info p {
            margin: 8px 0;
            font-size: 16px;
        }
        .info strong {
            color: #333;
        }
        .actions {
            margin-top: 15px;
        }
        .actions a {
            text-decoration: none;
            color: white;
            padding: 8px 12px;
            border-radius: 5px;
            margin: 5px;
        }
        .edit {
            background-color: #28a745;
        }
        .edit:hover {
            background-color: green;
        }
        .delete {
            background-color: #dc3545;
        }
        .delete:hover{
            background-color: red;
            transform: scale(2);
        }   
        .back {
            display: block;
            margin-top: 15px;
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }
        .back:hover{
            color: blue;
            text-decoration: underline;
        }
   
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

		<div class="pagetitle">
			<h1 style="display:flex;">List User</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="admindashboard">Home</a></li>
					<li class="breadcrumb-item"><a href="listuser">List users</a></li>
					<li class="breadcrumb-item active">View User</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section dashboard">
			<div class="row" style="min-height: 500px;">

				<!-- Left side columns -->
				<div class="col-lg-12">
					<div class="row">
						<!-- Reports -->
						<div class="col-12">
							<div class="card">
								<div class="card-body">
																			
<div class="container">
	 MemberName: ${member.memberName } <br><br>
									   Age: ${member.age} <br><br>
									   Profile photo: ${member.profilePhoto } <br><br>
									    
        <div class="actions">
            <a href="editmember?memberId=${m.memberId }" class="edit">Edit</a>
            <a href="deletemember?memberId=${member.memberId}" class="delete">Delete</a>
        </div>
        <a href="listmembers" class="back">Back</a>
    </div>
								
								
								
								</div>
							</div>
						</div>
						<!-- End Reports -->

					</div>
				</div>
				<!-- End Left side columns -->

				<!-- Right side columns -->
				<!-- End Right side columns -->

			</div>
		</section>

	</main><!-- End #main -->
    
    <!-- main content end  -->

    <!-- footer -->
    <jsp:include page="ADMIN_Footer.jsp"></jsp:include>
    </div>  
    <!-- JS -->
    <jsp:include page="ADMIN_Js.jsp"></jsp:include>
</body>
</html>
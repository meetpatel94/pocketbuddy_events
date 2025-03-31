<%@ page language="java" contentType="text/html; charset=UTF-8"
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
    <style>

        .container {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 390px;
            text-align: center;
        }
        .profile-pic {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #007bff;
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
            background-color: #355cdc;
        }
        .edit:hover {
            background-color: blue;
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
    </style>

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
					<li class="breadcrumb-item"><a href="listrateduser">List users</a></li>
					<li class="breadcrumb-item active">View Rated User</li>
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
									<h5 class="card-title">
										Users<span>/all</span>
									</h5>
								<!-- Here Start  -->
								 <div class="container">
	<img src="${user.profilePicPath }" style="width: 80px; height: 80px; border-radius: 50%; object-fit: cover; border: 2px solid black;"/><br>
        <div class="info">
            <p><strong>First Name: &nbsp;</strong>${user.firstName } &emsp; <strong>Last Name: &nbsp;</strong>${user.lastName} </p>
            <p><strong>Email: &nbsp;</strong>${user.email }</p>
            <p><strong>Experience: &nbsp;</strong>${rateduser.exp }</p>
            <p><strong>Rate: &nbsp;</strong>${rateduser.rating }</p>
            <p><strong>Description: &nbsp;</strong>${rateduser.description }</p>
            <p><strong>Role: &nbsp;</strong>${user.role }</p>
        </div>
        <div class="actions">
           <a href="listrateduser" class="edit">Back</a>
            <a href="deleterateduser?ratingUserId=${r[0]}" class="delete">Delete</a>
        </div>
        
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
</html>
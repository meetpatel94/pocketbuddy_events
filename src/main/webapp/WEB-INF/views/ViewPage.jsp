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
									<h5 class="card-title">
										Users<span>/all</span>
									</h5>


						<%-- 			<table class="table datatable datatable-table table-hover" id="myTable">
										<thead>
											<tr>
                                                <th>FirstName</th>
                                                <th>LastName</th>
                                                <th>Email</th>
                                                <th>Gender</th>
                                                <th>ContactNum</th>
                                                <th>Role</th>
                                                <th>Action</th>
											</tr>
										</thead>

										<tbody>
											
												<tr>
                                                    <td>${user.firstName }</td>
				                                    <td>${user.lastName}</td>
				                                    <td>${user.email }</td>
				                                    <td>${user.gender }</td>
				                                    <td>${user.contactNum }</td>
				                                    <td>${user.role }</td>
													<td><a href="#"><i class="bi bi-eye-fill"></i></a> |<a href="deletemember?memberId=${m.memberId}"><i class="bi bi-trash3-fill"></i></a>				
													 </td>
												</tr>				
										</tbody>
									</table> --%>
								<%-- 	&emsp; &emsp;
									Profile Photo <br>
									&emsp; &emsp;
									<img src="${user.profilePicPath }" style="width: 80px; height: 80px; border-radius: 50%; object-fit: cover; border: 2px solid black;"/><br>
									First Name: ${user.firstName } <br>
									Last Name: ${user.lastName} <br>
									Email&emsp;&emsp;&nbsp;&nbsp;: ${user.email } <br>
									Gender &emsp;   : ${user.gender } <br>
									D.O.B. &emsp;&nbsp;&nbsp;   : ${user.bornYear } <br>
									ContactNo.: ${user.contactNum } <br>
									Role: ${user.role } <br><br>
									<div style="color:red;">
									<a href="edituser?userId=${user.userId }" style="color:red;">Edit</a> | 
									<a href="deletemember?memberId=${user.userId}" style="color:red;">Delete</a> <br><br>
									</div>
									<p style="color:blue; text-decoration: underline"><a href="listuser"> Back </a> </p> --%>
								<!-- Here Start  -->
								 <div class="container">
	<img src="${user.profilePicPath }" style="width: 80px; height: 80px; border-radius: 50%; object-fit: cover; border: 2px solid black;"/><br>
        <div class="info">
            <p><strong>First Name: &nbsp;</strong>${user.firstName } &emsp; <strong>Last Name: &nbsp;</strong>${user.lastName} </p>
            <p><strong>Email: &nbsp;</strong>${user.email }</p>
            <p><strong>Gender: &nbsp;</strong>${user.gender }</p>
            <p><strong>D.O.B: &nbsp;</strong>${user.bornYear }</p>
            <p><strong>Contact No.: &nbsp;</strong>${user.contactNum }</p>
            <p><strong>Role: &nbsp;</strong>${user.role }</p>
        </div>
        <div class="actions">
            <a href="edituser?userId=${user.userId }" class="edit">Edit</a>
            <a href="deletemember?memberId=${user.userId}" class="delete">Delete</a>
        </div>
        <a href="listuser" class="back">Back</a>
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
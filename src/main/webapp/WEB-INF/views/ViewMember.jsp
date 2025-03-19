<%-- <h2>View Member</h2>
<table border="1">
     <tr>
       <th>MemberName<th>
       <th>Age<th>
       <th>ProfilePhoto<th>
       <th>HouseId<th>
     </tr>
     <tr>
       <td>${member.memberName }<td>
       <td>${member.age }<td>
       <td>${member.profilePhoto }<td>
       <td>${member.houseId }<td>
     </tr>
  </table><br>
  <a href="listmembers">List Members</a><br><br>
  <a href="newmember">New Members</a> --%>
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
</html>












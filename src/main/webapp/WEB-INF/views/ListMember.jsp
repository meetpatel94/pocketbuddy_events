<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Member</title>
</head>
<body>

	<h2>List Member</h2>

	<table border="1">
	<tr>
	    <th>Member</th>
	    <th>Age</th>
	    <th>Profile</th>
	    <th>Action</th>
	</tr>
		<c:forEach items="${memberList}" var="m">
			<tr>
				<td>${m.memberName }</td>
				<td>${m.age}</td>
				<td>${m.profilePhoto }</td>
				<td> <a href="viewmember?memberId=${m.memberId}"> View </a>|
				     <a href="deletemember?memberId=${m.memberId}"> Delete </a> |
				         Edit </td> 
			</tr>
		</c:forEach>
	</table>
	<br>
	<a href="newmember">New Member</a>
</body>
</html> --%>
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


									<table class="table datatable datatable-table table-hover" id="myTable">
										<thead>
											<tr>
                                                <th>Member</th>
                                                <th>Age</th>
                                                <th>Profile</th>
                                                <th>Action</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach items="${memberList }" var="m">
												<tr>
                                                    <td>${m.memberName }</td>
				                                    <td>${m.age}</td>
				                                    <td>${m.profilePhoto }</td>
													<td><a href="#"><i class="bi bi-pencil-square"></i></a> |<a href="deletemember?memberId=${m.memberId}"><i class="bi bi-trash3-fill"></i></a>|
													 <a href="viewmember?memberId=${m.memberId}"><i class="bi bi-eye-fill"></i></a>
													 </td>
												</tr>
											</c:forEach>
										</tbody>

									</table>



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
</html> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Admin | List Members</title>

<jsp:include page="AdminCss.jsp"></jsp:include>

<link href="https://cdn.datatables.net/2.2.2/css/dataTables.bootstrap5.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>

<style>
    /* Custom Table Styles */
    .datatable-table {
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
    }
    
    .datatable-table thead th {
        background-color: #33186B !important;
        color: white !important;
        font-weight: 500;
        padding: 15px 10px;
        text-transform: uppercase;
        font-size: 0.85rem;
        letter-spacing: 0.5px;
    }
    
    .datatable-table tbody tr {
        transition: all 0.3s ease;
    }
    
    .datatable-table tbody tr:hover {
        background-color: rgba(51, 24, 107, 0.05) !important;
        transform: translateX(5px);
    }
    
    .datatable-table tbody td {
        padding: 12px 10px;
        vertical-align: middle;
        border-bottom: 1px solid rgba(0,0,0,0.05);
    }
    
    /* Profile Photo Styling */
    .profile-photo {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        object-fit: cover;
        border: 2px solid #33186B;
    }
    
    /* Action Buttons */
    .action-buttons a {
        margin: 0 5px;
        transition: all 0.3s ease;
        display: inline-block;
    }
    
    .action-buttons a:hover {
        transform: scale(1.2);
    }
    
    .action-buttons a.edit-btn {
        color: #28a745 !important;
    }
    
    .action-buttons a.view-btn {
        color: #17a2b8 !important;
    }
    
    .action-buttons a.delete-btn {
        color: #dc3545 !important;
    }
    
    /* Card Styling */
    .card {
        border-radius: 12px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
        transition: all 0.3s ease;
        border: none;
    }
    
    .card:hover {
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    }
    
    .card-title span {
        color: #6c757d;
        font-size: 0.9rem;
    }
    
    /* Animations */
    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
    
    .animate-table {
        animation: fadeInUp 0.6s ease-out forwards;
    }
    
    /* Responsive adjustments */
    @media (max-width: 768px) {
        .datatable-table thead th {
            font-size: 0.75rem;
            padding: 10px 5px;
        }
        
        .datatable-table tbody td {
            padding: 8px 5px;
            font-size: 0.85rem;
        }
        
        .action-buttons a {
            margin: 0 3px;
        }
    }
</style>

</head>
<body>
    <jsp:include page="AdminHeader.jsp"></jsp:include>
    <jsp:include page="AdminSidebar.jsp"></jsp:include>

    <main id="main" class="main">
        <div class="pagetitle animate__animated animate__fadeIn">
            <h1>List Members</h1>
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
                <!-- Left side columns -->
                <div class="col-lg-12">
                    <div class="row">
                        <!-- Reports -->
                        <div class="col-12">
                            <div class="card animate__animated animate__fadeInUp">
                                <div class="card-body">
                                    <h5 class="card-title">
                                        Members<span>/all</span>
                                    </h5>

                                    <div class="table-responsive animate-table">
                                        <table class="table datatable datatable-table table-hover" id="myTable">
                                            <thead>
                                                <tr>
                                                    <th>Member</th>
                                                    <th>Age</th>
                                                    <th>Profile</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${memberList}" var="m">
                                                    <tr class="animate__animated animate__fadeIn">
                                                        <td>${m.memberName}</td>
                                                        <td>${m.age}</td>
                                                        <td>
                                                            ${m.profilePhoto }
                                                        </td>
                                                        <td class="action-buttons">
                                                            <a href="#" class="edit-btn" title="Edit">
                                                                <i class="fas fa-edit"></i>
                                                            </a>
                                                            <a href="viewmember?memberId=${m.memberId}" class="view-btn" title="View">
                                                                <i class="fas fa-eye"></i>
                                                            </a>
                                                            <a href="deletemember?memberId=${m.memberId}" class="delete-btn" title="Delete" onclick="return confirm('Are you sure you want to delete this member?')">
                                                                <i class="fas fa-trash-alt"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Reports -->
                    </div>
                </div>
                <!-- End Left side columns -->
            </div>
        </section>
    </main>
    <!-- main content end  -->

    <jsp:include page="AdminFooter.jsp"></jsp:include>
    <jsp:include page="AdminJs.jsp"></jsp:include>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/2.2.2/js/dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/2.2.2/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.4/gsap.min.js"></script>

    <script type="text/javascript">
    $(document).ready(function() {
        // Initialize DataTable with enhanced options
        let table = new DataTable('#myTable', {
            responsive: true,
            language: {
                search: "_INPUT_",
                searchPlaceholder: "Search members...",
                lengthMenu: "Show _MENU_ members per page",
                info: "Showing _START_ to _END_ of _TOTAL_ members",
                infoEmpty: "No members found",
                infoFiltered: "(filtered from _MAX_ total members)"
            },
            initComplete: function() {
                // Add animation to table rows after load
                gsap.from("#myTable tbody tr", {
                    duration: 0.6,
                    opacity: 0,
                    y: 20,
                    stagger: 0.05,
                    ease: "power2.out"
                });
            }
        });
        
        // Add hover effect to table rows
        $('#myTable tbody').on('mouseenter', 'tr', function() {
            gsap.to(this, {
                duration: 0.3,
                backgroundColor: 'rgba(51, 24, 107, 0.05)',
                x: 5,
                ease: "power2.out"
            });
        }).on('mouseleave', 'tr', function() {
            gsap.to(this, {
                duration: 0.3,
                backgroundColor: 'transparent',
                x: 0,
                ease: "power2.out"
            });
        });
        
        // Add confirmation for delete action
        $('.delete-btn').on('click', function(e) {
            if(!confirm('Are you sure you want to delete this member?')) {
                e.preventDefault();
            }
        });
    });
    </script>
</body>
</html>












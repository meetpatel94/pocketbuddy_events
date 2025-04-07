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
    /* Custom Table Styles */
    .datatable-table {
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        width: 100% !important;
        border-collapse: separate !important;
        border-spacing: 0 !important;
    }
    
    .datatable-table thead th {
        background-color: #33186B !important;
        color: white !important;
        font-weight: 500;
        padding: 15px 10px;
        text-transform: uppercase;
        font-size: 0.85rem;
        letter-spacing: 0.5px;
        position: relative;
        white-space: nowrap;
    }
    
    .datatable-table thead th.sorting:after,
    .datatable-table thead th.sorting_asc:after,
    .datatable-table thead th.sorting_desc:after {
        position: absolute;
        right: 10px;
        font-family: "Font Awesome 6 Free";
        font-weight: 900;
    }
    
    .datatable-table thead th.sorting:after {
        content: "\f0dc";
        color: rgba(255,255,255,0.5);
    }
    
    .datatable-table thead th.sorting_asc:after {
        content: "\f0de";
        color: white;
    }
    
    .datatable-table thead th.sorting_desc:after {
        content: "\f0dd";
        color: white;
    }
       
    .datatable-table tbody tr:hover {
        background-color: rgba(51, 24, 107, 0.05) !important;
        transform: translateX(5px);
    }
 
    
    .datatable-table tbody td {
        padding: 12px 10px;
        vertical-align: middle;
        border-bottom: 1px solid rgba(0,0,0,0.05);
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
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
    
    .action-buttons a.edit-btn:hover {
        color: #28a745 !important;
    }
    
    .action-buttons a.view-btn:hover {
        color: #17a2b8 !important;
    }
    
    .action-buttons a.delete-btn:hover {
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
    
    td.action-buttons {
        padding: 0px !important;
    }
    
    /* Fix for DataTables overflow */
    .table-responsive {
        overflow-x: auto;
        -webkit-overflow-scrolling: touch;
    }
    
    .dataTables_wrapper {
        width: 100%;
        margin: 0 auto;
    }
    .datatable-table > thead > tr > th {
	padding-left:5px;
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
    <main id="main" class="main">
        <div class="pagetitle animate__animated animate__fadeIn">
            <h1>Tickets Buyers</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="admindashboard">Home</a></li>
                    <li class="breadcrumb-item active">Tickets Buyers </li>
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
                                        Tickets Buyers<span>/all</span>
                                    </h5>

                                    <div class="table-responsive animate-table">
                                        <table class="table datatable datatable-table table-hover" id="myTable">
                                            <thead>
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Email</th>
                                                    <th>Date</th>
                                                    <th>Seats</th>
                                                    <th>Access</th>
                                                   <!--  <th>Action</th> -->
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${buyer }" var="b">
                                                    <tr class="animate__animated animate__fadeIn">
                                                        <td>${b.firstName }</td>
                                                        <td>${b.email }</td>
                                                        <td>${b.date }</td>
                                                        <td>${b.seats }</td>
                                                        <td>${b.access }</td>
                                                       <%--  <td class="action-buttons">
                                                            <a href="#" class="edit-btn" title="Edit">
                                                                <i class="fas fa-edit" style="color:green;"></i>
                                                            </a>
                                                            <a href="viewmember?memberId=${m.memberId}" class="view-btn" title="View">
                                                                <i class="fas fa-eye"></i>
                                                            </a>
                                                            <a href="deletemember?memberId=${m.memberId}" class="delete-btn" title="Delete" onclick="return confirm('Are you sure you want to delete this member?')">
                                                                <i class="fas fa-trash-alt" style="color:red;"></i>
                                                            </a>
                                                        </td> --%>
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

    <!-- footer -->
    <jsp:include page="ADMIN_Footer.jsp"></jsp:include>
    </div>
   
    <!-- JS -->
    <jsp:include page="ADMIN_Js.jsp"></jsp:include>
</body>
</html>
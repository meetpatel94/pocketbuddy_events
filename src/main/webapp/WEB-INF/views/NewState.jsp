<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin | List User</title>

<!-- Favicon -->
<link rel="icon" href="img/logo.png" type="image/x-icon">

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
<link rel="stylesheet" href="aset/assets/css/demo.css" />

<!-- DataTables CSS -->
<link href="https://cdn.datatables.net/2.2.2/css/dataTables.bootstrap5.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.dataTables.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>

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
    
    /* DataTables Buttons */
    .dt-buttons .btn {
        background-color: #33186B !important;
        color: white !important;
        border: none !important;
        border-radius: 4px !important;
        margin-right: 5px !important;
        padding: 6px 12px !important;
        font-size: 13px !important;
    }
    
    .dt-buttons .btn:hover {
        background-color: #4a2a8a !important;
        color: white !important;
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
        
        .dt-buttons {
            margin-bottom: 10px;
        }
        .dt-buttons .btn {
            margin-bottom: 5px;
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
    
    main {
        margin-left:20px;
    }
    div.dt-container div.dt-search input {
        display:none;
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
        <div class="pagetitle animate__animated animate__fadeIn">
            <h1>Add & List States</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="admindashboard">Home</a></li>
                    <li class="breadcrumb-item"><a href="businessevents">All Events</a></li>
                    <li class="breadcrumb-item active">Add states</li>
                </ol>
            </nav>
        </div>
        <!-- End Page Title -->
        <section class="section dashboard" style="color:black;">
			<form action="savesta" method="post">
             State Name: <input type="text" name="staName" required>
        <input type="submit" value="Add State" >
  </form>
  <br>
  <br>
  </section>

        <section class="section dashboard">
            <div class="row" style="min-height: 500px;">
                <!-- Left side columns -->
                <div class="col-lg-12">
                    <div class="row">
                        <!-- Reports -->
                        <div class="col-12">
                            <div class="card animate__animated animate__fadeInUp">
                                <div class="card-body">
                                   

                                    <div class="table-responsive animate-table">
                                        <table class="table datatable datatable-table table-hover" id="myTable">
                                            <thead>
                                                <tr>
                                                  <!--   <th>State Id</th> -->
                                                    <th>State Name</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${allsta }" var="u">
                                                    <tr class="animate__animated animate__fadeIn">
<%--                                                          <td>${u.staId}</td> --%>
                                                        <td>${u.staName}</td>
                                                        <td class="action-buttons">
                                                            <a href="deletesta?staId=${u.staId }" class="delete-btn" style="color:red" title="Delete" onclick="return confirm('Are you sure you want to delete this user?')">
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

    <!-- footer -->
    <jsp:include page="ADMIN_Footer.jsp"></jsp:include>
    </div>
    </div>
     
    <!-- JS -->
    <jsp:include page="ADMIN_Js.jsp"></jsp:include>
    <jsp:include page="AdminJs.jsp"></jsp:include>
    
    <!-- DataTables and Buttons JS -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/2.2.2/js/dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/2.2.2/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/dataTables.buttons.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.print.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.4/gsap.min.js"></script>

    <script type="text/javascript">
    $(document).ready(function() {
        // Initialize DataTable with enhanced options
        let table = new DataTable('#myTable', {
            responsive: true,
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'copy',
                    text: '<i class="fas fa-copy"></i> Copy',
                    titleAttr: 'Copy to clipboard',
                    className: 'btn btn-sm'
                },
                {
                    extend: 'csv',
                    text: '<i class="fas fa-file-csv"></i> CSV',
                    titleAttr: 'Export to CSV',
                    className: 'btn btn-sm'
                },
                {
                    extend: 'excel',
                    text: '<i class="fas fa-file-excel"></i> Excel',
                    titleAttr: 'Export to Excel',
                    className: 'btn btn-sm'
                },
                {
                    extend: 'pdf',
                    text: '<i class="fas fa-file-pdf"></i> PDF',
                    titleAttr: 'Export to PDF',
                    className: 'btn btn-sm'
                },
                {
                    extend: 'print',
                    text: '<i class="fas fa-print"></i> Print',
                    titleAttr: 'Print table',
                    className: 'btn btn-sm'
                }
            ],
            language: {
                search: "_INPUT_",
                searchPlaceholder: "Search users...",
                lengthMenu: "Show _MENU_ users per page",
                info: "Showing _START_ to _END_ of _TOTAL_ users",
                infoEmpty: "No users found",
                infoFiltered: "(filtered from _MAX_ total users)"
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
            if(!confirm('Are you sure you want to delete this user?')) {
                e.preventDefault();
            }
        });
    });
    </script>
</body>
</html> 

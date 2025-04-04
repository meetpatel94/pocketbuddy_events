 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>List Rating</title>

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
    
    /* Rating Stars */
    .rating-stars {
        color: #FFD700;
        font-size: 1.1rem;
    }
    
    /* Action Buttons */
    .action-btn {
        padding: 5px 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 0.85rem;
        transition: all 0.3s ease;
        margin-right: 5px;
    }
    
    .action-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    
    .view-btn {
        background-color: #007bff;
        color: white;
    }
    
    .view-btn:hover {
        background-color: #0069d9;
    }
    
    .delete-btn {
        background-color: #dc3545;
        color: white;
    }
    
    .delete-btn:hover {
        background-color: #c82333;
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
        
        .action-btn {
            padding: 4px 8px;
            font-size: 0.75rem;
            margin-right: 3px;
        }
    }
</style>

</head>
<body>
    <jsp:include page="AdminHeader.jsp"></jsp:include>
    <jsp:include page="AdminSidebar.jsp"></jsp:include>

    <main id="main" class="main">
        <div class="pagetitle animate__animated animate__fadeIn">
            <h1>Participate Users</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="admindashboard">Home</a></li>
                    <li class="breadcrumb-item active">Participate Users List</li>
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
                                        Participate Users<span>/all</span>
                                    </h5>

                                    <div class="table-responsive animate-table">
                                        <table class="table datatable datatable-table table-hover" id="myTable">
                                            <thead>
                                                <tr>
                                                    <th>User Name</th>
                                                    <th>Email</th>
                                                    <th>Date</th>
                                                    <th>Access</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${allratedusers}" var="r">
                                                    <tr class="animate__animated animate__fadeIn">
                                                        <td>${r[5]}</td>
                                                        <td>${r[6]}</td>
                                                        <td>${r[2]}</td>
                                                        <td>
                                                            <div class="rating-stars">
                                                                <c:forEach begin="1" end="${r[3]}">
                                                                    <i class="fas fa-star"></i>
                                                                </c:forEach>
                                                                <c:forEach begin="${r[3] + 1}" end="5">
                                                                    <i class="far fa-star"></i>
                                                                </c:forEach>
                                                                (${r[3]})
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <a href="viewrateduser?ratingUserId=${r[0]}" class="action-btn view-btn" title="View">
                                                                <i class="fas fa-eye"></i>
                                                            </a>
                                                            <a href="deleterateduser?ratingUserId=${r[0]}" class="action-btn delete-btn" title="Delete" onclick="return confirm('Are you sure you want to delete this rating?')">
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
                searchPlaceholder: "Search rated users...",
                lengthMenu: "Show _MENU_ users per page",
                info: "Showing _START_ to _END_ of _TOTAL_ rated users",
                infoEmpty: "No rated users found",
                infoFiltered: "(filtered from _MAX_ total ratings)"
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
            if(!confirm('Are you sure you want to delete this rating?')) {
                e.preventDefault();
            }
        });
    });
    </script>
</body>
</html>
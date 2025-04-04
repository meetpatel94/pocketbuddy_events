<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>PocketBuddy - Admin Dashboard</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Boxicons -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    
    <style>
        :root {
            --primary-color: #33186B;
            --secondary-color: #7360DF;
            --accent-color: #FF7ED4;
            --dark-color: #1A1A2E;
            --light-color: #F5F5F5;
            --success-color: #4CAF50;
            --danger-color: #F44336;
            --warning-color: #FFC107;
            --info-color: #2196F3;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            color: #333;
        }
        
        /* Sidebar and Header styles would be in AdminCss.jsp */
        
        .main {
            padding: 20px;
            margin-left: 250px;
            transition: all 0.3s;
        }
        
        .pagetitle h1 {
            font-weight: 600;
            color: var(--primary-color);
            margin-bottom: 0;
        }
        
        .breadcrumb {
            background-color: transparent;
            padding: 0;
        }
        
        /* Cards */
        .card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            overflow: hidden;
            margin-bottom: 20px;
            background-color: white;
        }
        
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }
        
        .card-icon {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            color: white;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
        }
        
        .sales-card .card-icon {
            background: linear-gradient(135deg, #4e54c8, #8f94fb);
        }
        
        .revenue-card .card-icon {
            background: linear-gradient(135deg, #11998e, #38ef7d);
        }
        
        .customers-card .card-icon {
            background: linear-gradient(135deg, #f46b45, #eea849);
        }
        
        .neww4 .card-icon {
            background: linear-gradient(135deg, #8E2DE2, #4A00E0);
        }
        
        .card-title {
            font-weight: 500;
            color: var(--dark-color);
            margin-bottom: 15px;
        }
        
        .card-title span {
            font-size: 14px;
            color: #6c757d;
        }
        .card-body{
            padding-bottom: 40px !important;
        }
        
        /* Filter Dropdown */
        .filter .icon {
            color: var(--primary-color);
            transition: all 0.3s;
        }
        
        .filter .icon:hover {
            transform: rotate(90deg);
        }
        
        /* Chart Container */
        .chart-container {
            width: 100%;
            height: 400px;
            background: linear-gradient(135deg, var(--dark-color), #16213E);
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            margin-top: 20px;
        }
        
        .chart-container h2 {
            color: white;
            font-weight: 500;
            margin-bottom: 20px;
            text-align: center;
        }
        
        /* Responsive Adjustments */
        @media (max-width: 992px) {
            .main {
                margin-left: 0;
            }
        }
        
        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .fade-in {
            animation: fadeIn 0.6s ease forwards;
        }
        
        /* Custom Scrollbar */
        ::-webkit-scrollbar {
            width: 8px;
        }
        
        ::-webkit-scrollbar-track {
            background: #f1f1f1;
        }
        
        ::-webkit-scrollbar-thumb {
            background: var(--primary-color);
            border-radius: 10px;
        }
    </style>
    <jsp:include page="AdminCss.jsp"></jsp:include>
    
</head>
<body>
    <jsp:include page="AdminHeader.jsp"></jsp:include>
    <jsp:include page="AdminSidebar.jsp"></jsp:include>

    <main id="main" class="main">
        <div class="pagetitle fade-in">
            <h1>Admin Dashboard</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#"><i class="bi bi-house-door"></i> Home</a></li>
                    <li class="breadcrumb-item active">Dashboard</li>
                </ol>
            </nav>
        </div>
        <section class="section dashboard">
            <div class="row">
                <!-- Sales Card -->
                <div class="col-xxl-4 col-md-6 fade-in" style="animation-delay: 0.1s;">
                    <div class="card info-card sales-card">
                        <div class="filter">
                            <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                            <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                <li class="dropdown-header text-start">
                                    <h6>Filter</h6>
                                </li>
                                <li><a class="dropdown-item" href="#">Today</a></li>
                                <li><a class="dropdown-item" href="#">This Month</a></li>
                                <li><a class="dropdown-item" href="#">This Year</a></li>
                            </ul>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Users <span>| OverAll</span></h5>
                            <div class="d-flex align-items-center">
                                <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                    <i class="bi bi-people"></i>
                                </div>
                                <div class="ps-3">   
                                    <h6>${totaluser }</h6>
                                    <h6>${totaluser }</h6>
                                    <span class="text-success small pt-1 fw-bold">12%</span>
                                    <span class="text-muted small pt-2 ps-1">increase</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Views Card -->
                <div class="col-xxl-4 col-md-6 fade-in" style="animation-delay: 0.2s;">
                    <div class="card info-card sales-card neww4">
                        <div class="filter">
                            <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                            <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                <li class="dropdown-header text-start">
                                    <h6>Filter</h6>
                                </li>
                                <li><a class="dropdown-item" href="#">Today</a></li>
                                <li><a class="dropdown-item" href="#">This Month</a></li>
                                <li><a class="dropdown-item" href="#">This Year</a></li>
                            </ul>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Peoples Views <span>| Today</span></h5>
                            <div class="d-flex align-items-center">
                                <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                    <i class="bi bi-eye-fill"></i>
                                </div>
                                <div class="ps-3">
                                    <h6>4050</h6>
                                    <span class="text-success small pt-1 fw-bold">58%</span>
                                    <span class="text-muted small pt-2 ps-1">increase</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Revenue Card -->
                <div class="col-xxl-4 col-md-6 fade-in" style="animation-delay: 0.3s;">
                    <div class="card info-card revenue-card">
                        <div class="filter">
                            <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                            <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                <li class="dropdown-header text-start">
                                    <h6>Filter</h6>
                                </li>
                                <li><a class="dropdown-item" href="#">Today</a></li>
                                <li><a class="dropdown-item" href="#">This Month</a></li>
                                <li><a class="dropdown-item" href="#">This Year</a></li>
                            </ul>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Revenue <span>| This Month</span></h5>
                            <div class="d-flex align-items-center">
                                <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                    <i class="bi bi-currency-dollar"></i>
                                </div>
                                <div class="ps-3">
                                    <h6>$3,264</h6>
                                    <span class="text-success small pt-1 fw-bold">8%</span>
                                    <span class="text-muted small pt-2 ps-1">increase</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Customers Card -->
                <div class="col-xxl-4 col-md-6 fade-in" style="animation-delay: 0.4s;">
                    <div class="card info-card customers-card neww2">
                        <div class="filter">
                            <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                            <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                <li class="dropdown-header text-start">
                                    <h6>Filter</h6>
                                </li>
                                <li><a class="dropdown-item" href="#">Today</a></li>
                                <li><a class="dropdown-item" href="#">This Month</a></li>
                                <li><a class="dropdown-item" href="#">This Year</a></li>
                            </ul>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Subscribe Members <span>| This Year</span></h5>
                            <div class="d-flex align-items-center">
                                <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                    <i class="bi bi-award-fill"></i>
                                </div>
                                <div class="ps-3">
                                <h6>${totalMembers }</h6>
                                    <!-- <h6>1244</h6> -->
                                    <span class="text-danger small pt-1 fw-bold">9%</span>
                                    <span class="text-muted small pt-2 ps-1">decrease</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Reports Section -->
                <div class="col-12 fade-in" style="animation-delay: 0.5s;">
                    <div class="card neww3">
                        <div class="filter">
                            <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                            <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                <li class="dropdown-header text-start">
                                    <h6>Filter</h6>
                                </li>
                                <li><a class="dropdown-item" href="#">Today</a></li>
                                <li><a class="dropdown-item" href="#">This Month</a></li>
                                <li><a class="dropdown-item" href="#">This Year</a></li>
                            </ul>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Reports <span>/Today</span></h5>
                            <div class="chart-container">
                                <h2>Visitor Insights</h2>
                                <canvas id="visitorChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <jsp:include page="AdminFooter.jsp"></jsp:include>

    <!-- JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <script>
    </script>
    <script>
        // Initialize Chart
        document.addEventListener("DOMContentLoaded", function () {
            const ctx = document.getElementById('visitorChart').getContext('2d');
            
            // Gradient for chart area
            const gradient = ctx.createLinearGradient(0, 0, 0, 400);
            gradient.addColorStop(0, 'rgba(115, 96, 223, 0.3)');
            gradient.addColorStop(1, 'rgba(115, 96, 223, 0)');
            
            new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                    datasets: [
                        {
                            label: 'Loyal Customers',
                            data: [300, 280, 250, 200, 220, 270, 320, 310, 300, 290, 250, 230],
                            borderColor: '#7360DF',
                            backgroundColor: gradient,
                            borderWidth: 3,
                            tension: 0.4,
                            fill: true
                        },
                        {
                            label: 'New Customers',
                            data: [250, 220, 180, 200, 260, 350, 330, 310, 290, 270, 260, 230],
                            borderColor: '#FF7ED4',
                            borderWidth: 3,
                            tension: 0.4
                        },
                        {
                            label: 'Unique Customers',
                            data: [320, 300, 280, 230, 240, 290, 310, 320, 300, 310, 280, 250],
                            borderColor: '#38ef7d',
                            borderWidth: 3,
                            tension: 0.4
                        }
                    ]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            position: 'bottom',
                            labels: {
                                color: 'white',
                                font: {
                                    family: 'Poppins'
                                }
                            }
                        },
                        tooltip: {
                            backgroundColor: 'rgba(0,0,0,0.8)',
                            titleFont: {
                                family: 'Poppins',
                                size: 14
                            },
                            bodyFont: {
                                family: 'Poppins'
                            }
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true,
                            max: 400,
                            grid: {
                                color: 'rgba(255,255,255,0.1)'
                            },
                            ticks: {
                                color: 'white'
                            }
                        },
                        x: {
                            grid: {
                                color: 'rgba(255,255,255,0.1)'
                            },
                            ticks: {
                                color: 'white'
                            }
                        }
                    }
                }
            });
            
            // Add animation to cards on scroll
            const animateOnScroll = function() {
                const cards = document.querySelectorAll('.fade-in');
                cards.forEach(card => {
                    const cardPosition = card.getBoundingClientRect().top;
                    const screenPosition = window.innerHeight / 1.3;
                    
                    if (cardPosition < screenPosition) {
                        card.style.opacity = '1';
                    }
                });
            };
            
            // Set initial opacity
            document.querySelectorAll('.fade-in').forEach(el => {
                el.style.opacity = '0';
            });
            
            window.addEventListener('scroll', animateOnScroll);
            animateOnScroll(); // Run once on load
        });     
    </script>
    <script>
    const toggleBtn = document.querySelector(".toggle-sidebar-btn");
    const sidebar = document.querySelector(".sidebar");
    const main = document.getElementById("main");
    const footer = document.getElementById("footer");

    toggleBtn.addEventListener("click", function () {
        if (sidebar.style.display === "none") {
            // If sidebar is hidden, show it and reset margin
            sidebar.style.display = "block";
            main.style.marginLeft = "300px"; // Adjust according to sidebar width
            footer.style.marginLeft = "0px";
        } else {
            // If sidebar is visible, hide it and adjust margin
            sidebar.style.display = "none";
            main.style.marginLeft = "0px";
            footer.style.marginLeft = "0px";
        }
    });
    </script>
</body>
</html> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
      rel="icon"
      href="aset/assets/img/kaiadmin/favicon.ico"
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
    <jsp:include page="ADMIN_Home.jsp"></jsp:include>

    <!-- footer -->
    <jsp:include page="ADMIN_Footer.jsp"></jsp:include>
    </div>
    </div>
     
    <!-- JS -->
    <jsp:include page="ADMIN_Js.jsp"></jsp:include>



</body>
</html>
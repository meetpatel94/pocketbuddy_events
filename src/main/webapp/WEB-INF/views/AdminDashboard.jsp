<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<link href="img/logo.png" rel="icon"> 
<title>PocketBuddy-Admin Dashboard</title>
<style>
}
.chart-container {
    width: 60%;
    max-width: 800px;
    height: 400px;  /* FIXED HEIGHT */
    background-color: rgb(149, 23, 23);
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    border: 1px solid black;
}
canvas {
    width: 845px !important;
    height: 425px !important;
}

h2 {
    text-align: center;
    margin-bottom: 10px;
    color: #33186B;
}
</style>
<jsp:include page="AdminCss.jsp"></jsp:include>


</head>
<body>
	<jsp:include page="AdminHeader.jsp"></jsp:include>

	<jsp:include page="AdminSidebar.jsp"></jsp:include>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>Admin Dashboard</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active">Dashboard</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section dashboard">
			<div class="row">

				<!-- Left side columns -->
				<div class="col-lg-12">
					<div class="row">

						<!-- Sales Card -->
						<div class="col-xxl-4 col-md-4">
							<div class="card info-card sales-card neww">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots" style="color: #33186B;"></i></a>
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
									<h5 class="card-title">
										Sales <span style="color: white;">| Today</span>
									</h5>
									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-cart"></i>
										</div>
										<div class="ps-3">
											<h6>145</h6>
											<span class="text-success small pt-1 fw-bold" style="color: rgb(102, 194, 199) !important">12%</span> <span
												class="text-muted small pt-2 ps-1" style="color: rgb(102, 194, 199) !important">increase</span>
										</div>
									</div>
								</div>

							</div>
						</div>
						<!-- End Sales Card -->
						
						<!-- Start New Card -->
								<div class="col-xxl-4 col-md-4">
							<div class="card info-card sales-card neww4">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots" style="color: #33186B;"></i></a>
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
									<h5 class="card-title">
										Peoples Views <span style="color: white;">| Today</span>
									</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-eye-fill"></i>
										</div>
										<div class="ps-3">
											<h6>4050</h6>
											<span class="text-success small pt-1 fw-bold" style="color: rgb(102, 194, 199) !important">58%</span> <span
												class="text-muted small pt-2 ps-1" style="color: rgb(102, 194, 199) !important">increase</span>

										</div>
									</div>
								</div>

							</div>
						</div>
            <!-- End New Card -->

						<!-- Revenue Card -->
						<div class="col-xxl-4 col-md-4">
							<div class="card info-card revenue-card">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots" style="color: #33186B;"></i></a>
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
									<h5 class="card-title">
										Revenue <span style="color: white;">| This Month</span>
									</h5>
									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-currency-dollar"></i>
										</div>
										<div class="ps-3">
											<h6>$3,264</h6>
											<span class="text-success small pt-1 fw-bold" style="color: rgb(102, 194, 199) !important">8%</span> <span
												class="text-muted small pt-2 ps-1" style="color: rgb(102, 194, 199) !important">increase</span>
										</div>
									</div>
								</div>

							</div>
						</div>
						<!-- End Revenue Card -->

						<!-- Customers Card -->
						<div class="col-xxl-4 col-xl-12">
							<div class="card info-card customers-card neww2">
								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots" style="color: #33186B;"></i></a>
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
									<h5 class="card-title">
										Customers <span style="color: white;">| This Year</span>
									</h5>
									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-people"></i>
										</div>
										<div class="ps-3">
											<h6>1244</h6>
											<span class="text-danger small pt-1 fw-bold" style="color: rgb(102, 194, 199) !important">12%</span> <span
												class="text-muted small pt-2 ps-1" style="color: rgb(102, 194, 199) !important">decrease</span>
										</div>
									</div>

								</div>
							</div>

						</div>
						<!-- End Customers Card -->

						<!-- Reports -->
						<div class="col-12">
							<div class="card neww3">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots" style="color: #33186B;"></i></a>
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
									<h5 class="card-title">
										Reports <span style="color: white;">/Today</span>
										<div class="chart-container">
                                              <h2>Visitor Insights</h2>
                                              <canvas id="visitorChart"></canvas>
                                        </div><br>
									</h5>
					                    <br><br>
					                    <br><br>
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
	  
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/chart.js/chart.umd.js"></script>
  <script src="assets/vendor/echarts/echarts.min.js"></script>
  <script src="assets/vendor/quill/quill.js"></script>
  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  
   <script src="assets/js/main.js"></script>
   
    <script>
      document.addEventListener("DOMContentLoaded", function () {
          const ctx = document.getElementById('visitorChart').getContext('2d');
          new Chart(ctx, {
              type: 'line',
              data: {
                  labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                  datasets: [
                      {
                          label: 'Loyal Customers',
                          data: [300, 280, 250, 200, 220, 270, 320, 310, 300, 290, 250, 230],
                          borderColor: 'purple',
                          borderWidth: 3,
                          tension: 0.4
                      },
                      {
                          label: 'New Customers',
                          data: [250, 220, 180, 200, 260, 350, 330, 310, 290, 270, 260, 230],
                          borderColor: 'red',
                          borderWidth: 3,
                          tension: 0.4
                      },
                      {
                          label: 'Unique Customers',
                          data: [320, 300, 280, 230, 240, 290, 310, 320, 300, 310, 280, 250],
                          borderColor: 'green',
                          borderWidth: 3,
                          tension: 0.4
                      }
                  ]
              },
              options: {
                  responsive: true,
                  maintainAspectRatio: false,  // FIX CHART STRETCHING
                  scales: {
                      y: {
                          beginAtZero: true,
                          max: 400
                      }
                  },
                  plugins: {
                      legend: {
                          position: 'bottom'
                      }
                  }
              }
          });
      });        
  </script>
</body>
</html>
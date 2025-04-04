<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="lib/jquery/jquery.min.js"></script>
  <script src="lib/jquery/jquery-migrate.min.js"></script>
  <script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="lib/easing/easing.min.js"></script>
  <script src="lib/superfish/hoverIntent.js"></script>
  <script src="lib/superfish/superfish.min.js"></script>
  <script src="lib/wow/wow.min.js"></script>
  <script src="lib/venobox/venobox.min.js"></script>
  <script src="lib/owlcarousel/owl.carousel.min.js"></script>
  
  <script>
  document.addEventListener('DOMContentLoaded', function() {
	    // Add data labels for mobile view
	    if (window.innerWidth <= 480) {
	        const headers = ['Date', 'Event', 'Venue', 'Action'];
	        const cells = document.querySelectorAll('td');
	        
	        cells.forEach((cell, index) => {
	            const headerIndex = index % headers.length;
	            cell.setAttribute('data-label', headers[headerIndex]);
	        });
	    }
	});
  </script>

  <!-- Contact Form JavaScript File -->
  <script src="contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="js/main.js"></script>
</body>
</html>
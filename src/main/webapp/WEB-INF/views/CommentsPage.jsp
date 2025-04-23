<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Comments</title>
<link rel="icon" href="img/logo.png" type="image/x-icon" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

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
:root {
  --primary-color: #432E54;
  --primary-light: #5D3D7A;
  --secondary-color: #FF6B6B;
  --text-color: #333333;
  --light-bg: #F8F9FA;
  --border-color: #E0E0E0;
}

section, .pan {
  margin-left: 20px !important;
}

/* Sorting Controls */
.sorting-controls {
  display: flex;
  justify-content: flex-end;
  margin-bottom: 20px;
  gap: 10px;
}

.sort-dropdown {
  min-width: 200px;
  border-radius: 8px;
  border: 1px solid var(--border-color);
  padding: 8px 15px;
  background-color: white;
  color: var(--text-color);
}

.sort-btn {
  background-color: var(--primary-color);
  color: white;
  border: none;
  border-radius: 8px;
  padding: 8px 15px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.sort-btn:hover {
  background-color: var(--primary-light);
  transform: translateY(-2px);
}

/* Comment Cards */
.comment-card {
  transition: all 0.3s ease;
  height: 100%;
}

.comment-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 10px 20px rgba(0,0,0,0.1) !important;
}

.card-title {
  color: var(--primary-color);
}

.text-muted {
  color: #6c757d !important;
}

.btn-outline-danger {
  transition: all 0.3s ease;
}

.btn-outline-danger:hover {
  background-color: var(--secondary-color);
  color: white;
}

/* Empty State */
.empty-state {
  text-align: center;
  padding: 50px;
  color: #6c757d;
}

.empty-state i {
  font-size: 50px;
  margin-bottom: 20px;
  color: var(--border-color);
}

/* Responsive Adjustments */
@media (max-width: 768px) {
  .sorting-controls {
    flex-direction: column;
    align-items: flex-end;
  }
  
  .col-md-6 {
    margin-bottom: 20px;
  }
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
     <main id="main" class="main"></main>
        <div class="pagetitle animate__animated animate__fadeIn pan">
            <h1>User Comments</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="admindashboard">Home</a></li>
                    <li class="breadcrumb-item active">User Comments</li>
                </ol>
            </nav>
        </div><!-- End Page Title -->

    	<section class="section dashboard">
          <!-- Sorting Controls -->
          <div class="sorting-controls">
              <select id="sortField" class="sort-dropdown">
                  <option value="date">Sort By Date</option>
                  <option value="name">Sort By Name</option>
                  <option value="subject">Sort By Subject</option>
                  <option value="email">Sort By Email</option>
              </select>
              <select id="sortOrder" class="sort-dropdown">
                  <option value="asc">Ascending</option>
                  <option value="desc">Descending</option>
              </select>
              <button id="applySort" class="sort-btn">
                  <i class="fas fa-sort me-2"></i>Apply Sort
              </button>
          </div>
          
          <div class="row" id="commentsContainer">
            <c:choose>
              <c:when test="${not empty comments}">
                <c:forEach items="${comments}" var="c">
                  <div class="col-md-6 col-lg-4 mb-4 comment-item" 
                       data-name="${c.name}"
                       data-email="${c.email}"
                       data-subject="${c.subject}"
                       data-date="${c.date}"
                       data-time="${c.time}">
                    <div class="card shadow-sm border-0 comment-card">
                      <div class="card-body">
                        <h5 class="card-title mb-2 text-primary">
                          <i class="fas fa-user-circle me-2"></i>${c.name}
                        </h5>
                        <p class="mb-1">
                          <i class="fas fa-envelope me-2 text-muted"></i>
                          <strong>Email:</strong> ${c.email}
                        </p>
                        
                        <p class="mb-1">
                          <i class="fas fa-tag me-2 text-muted"></i>
                          <strong>Subject:</strong> ${c.subject}
                        </p>
                        <p class="mb-1">
                          <i class="fas fa-comment-dots me-2 text-muted"></i>
                          <strong>Description:</strong> ${c.message}
                        </p>
                        <p class="mb-1">
                         <i class="fa fa-calendar-alt me-2 text-muted"></i>
                          <strong>Date:</strong> ${c.date}
                        </p>
                        <p>
                          <i class="fa fa-clock me-2 text-muted"></i>
                          <strong>Time:</strong> ${c.time}
                        </p>
                      </div>
                      <div class="card-footer text-end bg-white border-0">
                        <a href="deletecomments?commentUserId=${c.commentUserId}" class="btn btn-sm btn-outline-danger">
                          <i class="fas fa-trash-alt"></i> Delete
                        </a>
                      </div>
                    </div>
                  </div>
                </c:forEach>
              </c:when>
              <c:otherwise>
                <div class="col-12">
                  <div class="empty-state">
                    <i class="fas fa-comment-slash"></i>
                    <h3>No Comments Found</h3>
                    <p>There are no user comments to display at this time.</p>
                  </div>
                </div>
              </c:otherwise>
            </c:choose>
          </div>
        </section>
      </div>
    </main>
    <!-- main content end  -->

    <!-- footer -->
    <jsp:include page="ADMIN_Footer.jsp"></jsp:include>
    </div>  
    <!-- JS -->
    <jsp:include page="ADMIN_Js.jsp"></jsp:include>
    
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const applySortBtn = document.getElementById('applySort');
        const commentsContainer = document.getElementById('commentsContainer');
        
        applySortBtn.addEventListener('click', function() {
            const sortField = document.getElementById('sortField').value;
            const sortOrder = document.getElementById('sortOrder').value;
            
            sortComments(sortField, sortOrder);
        });
        
        function sortComments(field, order) {
            const commentItems = Array.from(document.querySelectorAll('.comment-item'));
            
            commentItems.sort((a, b) => {
                let valueA, valueB;
                
                // Get the values from data attributes
                switch(field) {
                    case 'name':
                        valueA = a.dataset.name.toLowerCase();
                        valueB = b.dataset.name.toLowerCase();
                        break;
                    case 'email':
                        valueA = a.dataset.email.toLowerCase();
                        valueB = b.dataset.email.toLowerCase();
                        break;
                    case 'subject':
                        valueA = a.dataset.subject.toLowerCase();
                        valueB = b.dataset.subject.toLowerCase();
                        break;
                    case 'date':
                        // Convert dates to comparable format (YYYY-MM-DD)
                        const dateA = convertDateToComparable(a.dataset.date);
                        const dateB = convertDateToComparable(b.dataset.date);
                        valueA = dateA + a.dataset.time; // Include time for more precise sorting
                        valueB = dateB + b.dataset.time;
                        break;
                    default:
                        return 0;
                }
                
                if (valueA < valueB) {
                    return order === 'asc' ? -1 : 1;
                }
                if (valueA > valueB) {
                    return order === 'asc' ? 1 : -1;
                }
                return 0;
            });
            
            // Clear the container
            commentsContainer.innerHTML = '';
            
            // Re-append sorted items
            commentItems.forEach(item => {
                commentsContainer.appendChild(item);
            });
        }
        
        // Helper function to convert date strings to comparable format
        function convertDateToComparable(dateStr) {
            if (!dateStr) return '';
            
            // Assuming date is in format DD-MM-YYYY or similar
            // Adjust this based on your actual date format
            const parts = dateStr.split('-');
            if (parts.length === 3) {
                return `${parts[2]}-${parts[1]}-${parts[0]}`; // Convert to YYYY-MM-DD
            }
            return dateStr;
        }
        
        // Initial sort by date descending
        sortComments('date', 'desc');
    });
    </script>
</body>
</html>
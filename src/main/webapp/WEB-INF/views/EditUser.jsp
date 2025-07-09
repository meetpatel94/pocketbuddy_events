<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit User</title>
<link rel="icon" href="img/logo.png" type="image/x-icon" />

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
  --primary: #514b82;
  --secondary: #6c757d;
  --light: #f8f9fa;
  --dark: #343a40;
  --border: #dee2e6;
  --success: #28a745;
}

body {
  font-family: 'Inter', sans-serif;
  background-color: #f5f7fa;
  color: #333;
  line-height: 1.6;
}

.wrapper {
  display: flex;
  min-height: 100vh;
}

.container {
  flex: 1;
  padding: 2rem;
  margin-left: 123px;
}

.main {
  background: white;
  border-radius: 10px;
  box-shadow: 0 2px 10px rgba(0,0,0,0.05);
  padding: 2rem;
  max-width: 800px;
  margin: 0 auto;
  margin-left: 162px;
  margin-bottom: 50px !important;
  animation: fadeIn 0.3s ease-out;
}
.main-header{
  margin-left: 267px !important;
  width: calc(100% - 266px) !important;
}
.footer{
  margin-left: 267px !important;
}
.pagetitle {
  margin-bottom: 1.5rem;
}

.pagetitle h1 {
  font-size: 1.75rem;
  font-weight: 600;
  color: var(--dark);
  margin-bottom: 0.5rem;
}

.breadcrumb {
  background: transparent;
  padding: 0;
  font-size: 0.9rem;
}

.breadcrumb-item a {
  color: var(--secondary);
  text-decoration: none;
}

.breadcrumb-item.active {
  color: var(--primary);
}

.form-group {
  margin-bottom: 1.5rem;
}

.form-label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: 500;
  color: var(--dark);
}

.form-control {
  width: 100%;
  padding: 0.75rem 1rem;
  border: 1px solid var(--border);
  border-radius: 6px;
  font-size: 1rem;
  transition: all 0.2s;
  background-color: white;
}

.form-control:focus {
  border-color: var(--primary);
  box-shadow: 0 0 0 3px rgba(81, 75, 130, 0.1);
  outline: none;
}

.form-select {
  appearance: none;
  background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%23343a40' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M2 5l6 6 6-6'/%3e%3c/svg%3e");
  background-repeat: no-repeat;
  background-position: right 1rem center;
  background-size: 16px 12px;
}

.btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: 0.75rem 1.5rem;
  border-radius: 6px;
  font-weight: 500;
  font-size: 1rem;
  line-height: 1;
  text-align: center;
  text-decoration: none;
  cursor: pointer;
  transition: all 0.2s;
  border: none;
}

.btn-primary {
  background-color: green !important;
  color: white;
}

.btn-primary:hover {
  background-color: #46bd46 !important;
  transform: translateY(-2px);
}

.btn-secondary {
  background-color: var(--secondary);
  color: white;
}
.btn-clear{
  background-color: #e84d4d;
  color: white;
}
.btn-clear:hover{
  background-color: red;
  color:white;
}
.btn-secondary:hover {
  background-color: #5a6268;
  transform: translateY(-2px);
}

.btn-group {
  display: flex;
  gap: 1rem;
  margin-top: 2rem;
}

.image-section {
  display: flex;
  align-items: center;
  gap: 2rem;
  margin: 1.5rem 0;
}

.current-image-container {
  text-align: center;
}

.current-image {
  width: 120px;
  height: 120px;
  border-radius: 50%;
  object-fit: cover;
  border: 3px solid var(--border);
}

.image-upload {
  flex: 1;
}

.image-actions {
  margin-top: 1rem;
  display: flex;
  gap: 1rem;
}

.file-input {
  display: none;
}

.file-label {
  display: inline-block;
  padding: 0.5rem 1rem;
  background-color: var(--light);
  border: 1px solid var(--border);
  border-radius: 6px;
  cursor: pointer;
  transition: all 0.2s;
}

.file-label:hover {
  background-color: #e9ecef;
}

@keyframes fadeIn {
  from { opacity: 0; transform: translateY(10px); }
  to { opacity: 1; transform: translateY(0); }
}

@media (max-width: 768px) {
  .container {
    padding: 1rem;
  }
  
  .image-section {
    flex-direction: column;
    align-items: flex-start;
  }
}
.form-group{
 margin-bottom: 0px !important;
}
</style>
</head>
<body>
   
   <!-- sidebar -->
   <div class="wrapper">
   <jsp:include page="ADMIN_Sidebar.jsp"></jsp:include>
   
   <!-- header -->
   <jsp:include page="ADMIN_Header.jsp"></jsp:include>
   
   <!-- main content -->
   <div class="container">
     <main class="main">
       <div class="pagetitle">
         <h1>Edit User</h1>
         <nav>
           <ol class="breadcrumb">
             <li class="breadcrumb-item"><a href="admindashboard">Home</a></li>
             <li class="breadcrumb-item"><a href="listuser">List User</a></li>
             <li class="breadcrumb-item active">Edit User</li>
           </ol>
         </nav>
       </div>

       <form id="userForm" action="updateuser" method="post" enctype="multipart/form-data">
         <div class="form-group">
           <label for="firstName" class="form-label">First Name</label>
           <input type="text" class="form-control" id="firstName" name="firstName" value="${user.firstName}" required>
         </div>
         
         <div class="form-group">
           <label for="lastName" class="form-label">Last Name</label>
           <input type="text" class="form-control" id="lastName" name="lastName" value="${user.lastName}" required>
         </div>
         
         <div class="form-group">
           <label for="gender" class="form-label">Gender</label>
           <select class="form-control form-select" id="gender" name="gender" required>
             <option value="male" ${user.gender == 'male' ? 'selected' : ''}>Male</option>
             <option value="female" ${user.gender == 'female' ? 'selected' : ''}>Female</option>
             <option value="trans" ${user.gender == 'trans' ? 'selected' : ''}>Transgender</option>
             <option value="other" ${user.gender == 'other' ? 'selected' : ''}>Other</option>
           </select>
         </div>
          
         <div class="form-group">
           <label for="email" class="form-label">Email</label>
           <input type="email" class="form-control" id="email" name="email" value="${user.email}" required>
         </div>
          
         <div class="form-group">
           <label for="bornYear" class="form-label">Date of Birth</label>
           <input type="date" class="form-control" id="bornYear" name="bornYear" value="${user.bornYear}" required>
         </div>
          
         <div class="form-group">
           <label for="contactNum" class="form-label">Contact Number</label>
           <input type="tel" class="form-control" id="contactNum" name="contactNum" value="${user.contactNum}" required>
         </div>
          
         <div class="form-group">
           <label class="form-label">Profile Picture</label>
           <div class="image-section">
             <div class="current-image-container">
               <c:if test="${not empty user.profilePicPath}">
                 <img src="${user.profilePicPath}" alt="Current Profile" class="current-image" id="currentImage">
                 <input type="hidden" name="existingProfilePic" value="${user.profilePicPath}">
               </c:if>
               <c:if test="${empty user.profilePicPath}">
                 <img src="img/default-profile.png" alt="Default Profile" class="current-image" id="defaultImage">
               </c:if>
             </div>
             <div class="image-upload">
               <input type="file" id="profilePic" name="profilePic" class="file-input" accept="image/*">
               <label for="profilePic" class="file-label">Choose new image</label>
               <div class="image-actions">
                 <button type="button" class="btn btn-clear" id="clearImageBtn">Clear</button>
               </div>
             </div>
           </div>
         </div>
          
         <div class="form-group">
           <label for="role" class="form-label">Role</label>
           <select class="form-control form-select" id="role" name="role" required>
             <option value="USER" ${user.role == 'USER' ? 'selected' : ''}>User</option>
             <option value="ADMIN" ${user.role == 'ADMIN' ? 'selected' : ''}>Admin</option>
           </select>
         </div>
          
         <input type="hidden" name="userId" value="${user.userId}">
         
         <div class="btn-group">
           <button type="submit" class="btn btn-primary">Save Changes</button>
           <a href="listuser" class="btn btn-secondary">Cancel</a>
         </div>
       </form>
     </main>
   </div>
   
   <jsp:include page="ADMIN_Footer.jsp"></jsp:include>
   </div>
   
   <!-- JS -->
   <jsp:include page="ADMIN_Js.jsp"></jsp:include>
   
   <script>
   // Preview image when selected
   document.getElementById('profilePic').addEventListener('change', function(e) {
     const file = e.target.files[0];
     if (file) {
       const reader = new FileReader();
       reader.onload = function(event) {
         const currentImage = document.getElementById('currentImage');
         const defaultImage = document.getElementById('defaultImage');
         
         if (currentImage) {
           currentImage.src = event.target.result;
         } else if (defaultImage) {
           defaultImage.src = event.target.result;
         }
       };
       reader.readAsDataURL(file);
     }
   });
   
   // Clear image button functionality
   document.getElementById('clearImageBtn').addEventListener('click', function() {
     const fileInput = document.getElementById('profilePic');
     const currentImage = document.getElementById('currentImage');
     const defaultImage = document.getElementById('defaultImage');
     
     // Clear the file input
     fileInput.value = '';
     
     // Reset to default image
     if (currentImage) {
       currentImage.src = 'img/default-profile.png';
     }
     if (defaultImage) {
       defaultImage.src = 'img/default-profile.png';
     }
   });
   </script>
</body>
</html>
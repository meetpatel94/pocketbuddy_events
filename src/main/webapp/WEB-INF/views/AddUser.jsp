<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add User</title>
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
main{
 margin-left:20px;
}
/* Custom Loader styles */
.admin-loading-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(255, 255, 255, 0.9);
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  z-index: 9999;
  display: none;
}

.admin-loading-text {
  margin-bottom: 20px;
  font-size: 18px;
  color: #514b82;
  font-weight: bold;
}

.admin-spinner-loader {
  width: 40px;
  aspect-ratio: 1;
  position: relative;
  transform: rotate(45deg);
}

.admin-spinner-loader:before,
.admin-spinner-loader:after {
  content: "";
  position: absolute;
  inset: 0;
  border-radius: 50% 50% 0 50%;
  background: #514b82;
  -webkit-mask: radial-gradient(circle 10px at 50% 50%,#0000 94%,#000);
}

.admin-spinner-loader:after {
  animation: admin-spin-animation 1s infinite;
  transform: perspective(300px) translateZ(0px)
}

@keyframes admin-spin-animation {
  to {transform: perspective(300px) translateZ(150px);opacity:0}
}

/* Isolated Pocketbuddy Form Styles */
.pbuddy-user-form {
  background: #fff;
  padding: 35px;
  border-radius: 16px;
  box-shadow: 0 4px 25px rgba(0, 0, 0, 0.08);
  max-width: 850px;
  margin-top: 30px;
  animation: pbuddyFormFade 0.8s ease;
  margin-bottom: 40px;
}

@keyframes pbuddyFormFade {
  from { opacity: 0; transform: translateY(20px); }
  to   { opacity: 1; transform: translateY(0); }
}

.pbuddy-row {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  margin-bottom: 20px;
}

.pbuddy-row label {
  flex: 0 1 127px;
  font-weight: bold;
  font-size: 15px;
  color: #333;
  padding-right: 10px;
}

.pbuddy-row .pbuddy-input-wrapper {
  flex: 2 1 300px;
  display: flex;
  align-items: center;
  gap: 10px;
}

.pbuddy-row input,
.pbuddy-row select {
  width: 70%;
  height: 35px;
  padding: 0px 9px;
  border: 1px solid #ccc;
  border-radius: 8px;
  font-size: 16px;
  transition: 0.3s;
}

.pbuddy-row input:focus,
.pbuddy-row select:focus {
  border-color: #514b82;
  box-shadow: 0 0 5px rgba(81, 75, 130, 0.4);
  outline: none;
}

.pbuddy-icon {
  color: #514b82;
  font-size: 18px;
  margin-right: 5px;
}

.pbuddy-contact {
  display: flex;
  align-items: center;
}

.pbuddy-contact-prefix {
  background: #f5f5f5;
  padding: 10px 12px;
  border: 1px solid #ccc;
  border-radius: 8px;
  font-weight: bold;
  font-size: 14px;
}

.pbuddy-submit-btn {
  background: #514b82;
  color: white;
  padding: 6px 22px;
  border: none;
  border-radius: 8px;
  font-size: 16px;
  font-weight: 600;
  cursor: pointer;
  margin-left: auto;
  transition: 0.3s;
}

.pbuddy-submit-btn:hover {
  background: #3e3970;
  transform: scale(1.03);
}

.pbuddy-submit-btn:disabled {
  background: #cccccc;
  cursor: not-allowed;
  transform: none;
}

.pbg{
 width:19% !important;
}

.phone-row{
 width: 89% !important;
}

.password-toggle {
  cursor: pointer;
  color: #514b82;
  font-size: 18px;
  margin-left: -45px;
  z-index: 2;
}

.password-message {
  color: red;
  font-size: 14px;
  margin-top: 9px;
  margin-bottom: 10px;
  margin-left: -161px;
  display: none;
}

.hidden-phone {
  display: none;
}
</style>
</head>
<body>
   <!-- Loader -->
   <div class="admin-loading-overlay">
     <div class="admin-loading-text">Add New User...</div>
     <div class="admin-spinner-loader"></div>
   </div>
   
   <!-- sidebar -->
   <div class="wrapper">
   <jsp:include page="ADMIN_Sidebar.jsp"></jsp:include>
   
   <!-- header -->
   <jsp:include page="ADMIN_Header.jsp"></jsp:include>
   
   <!-- container  -->
   	 <div class="container">
     <main id="main" class="main">
        <div class="pagetitle animate__animated animate__fadeIn">
            <h1>Add User</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="admindashboard">Home</a></li>
                    <li class="breadcrumb-item active">Add User</li>
                </ol>
            </nav>
        </div><!-- End Page Title -->

    	<section class="section dashboard" style="color:black;">
			<form action="adminsaveuser" method="post" enctype="multipart/form-data" onsubmit="return validateForm()" class="pbuddy-user-form">

  <div class="pbuddy-row">
    <label><i class="fas fa-user pbuddy-icon"></i>First Name:</label>
    <div class="pbuddy-input-wrapper">
      <input type="text" name="firstName" required>
    </div>
  </div>

  <div class="pbuddy-row">
    <label><i class="fas fa-user pbuddy-icon"></i>Last Name:</label>
    <div class="pbuddy-input-wrapper">
      <input type="text" name="lastName" required>
    </div>
  </div>

  <div class="pbuddy-row">
    <label><i class="fas fa-venus-mars pbuddy-icon"></i>Gender:</label>
    <div class="pbuddy-input-wrapper">
      <select name="gender" required>
        <option value="male">Male</option>
        <option value="female">Female</option>
        <option value="trans">Transgender</option>
        <option value="other">Other</option>
      </select>
    </div>
  </div>

  <div class="pbuddy-row">
    <label><i class="fas fa-envelope pbuddy-icon"></i>Email:</label>
    <div class="pbuddy-input-wrapper">
      <input type="email" name="email" required>
    </div>
  </div>

  <div class="pbuddy-row">
    <label><i class="fas fa-lock pbuddy-icon"></i>Password:</label>
    <div class="pbuddy-input-wrapper">
      <input type="password" name="password" id="password" required>
      <i class="fas fa-eye password-toggle" id="togglePassword"></i>
    </div>
  </div>

  <div class="pbuddy-row">
    <label><i class="fas fa-lock pbuddy-icon"></i>Confirm Password:</label>
    <div class="pbuddy-input-wrapper">
      <input type="password" name="confirmpassword" id="confirmpassword" required>
      <i class="fas fa-eye password-toggle" id="toggleConfirmPassword"></i>
    </div>
    <br>
    <div id="password-message" class="password-message">Passwords do not match!</div>
  </div>

  <div class="pbuddy-row">
    <label><i class="fas fa-calendar-alt pbuddy-icon"></i>Date of Birth:</label>
    <div class="pbuddy-input-wrapper">
      <input type="date" name="bornYear" required>
    </div>
  </div>

  <div class="pbuddy-row phone-row">
    <label><i class="fas fa-phone pbuddy-icon"></i>Contact No.:</label>
    <div class="pbuddy-input-wrapper pbuddy-contact">
      <span class="pbuddy-contact-prefix">+91</span>
      <input type="text" name="contactNumDisplay" id="contactNumDisplay" maxlength="10" pattern="[0-9]{10}" placeholder="10-digit number" required>
      <input type="hidden" name="contactNum" id="contactNum">
    </div>
  </div>

  <div class="pbuddy-row">
    <label><i class="fas fa-image pbuddy-icon"></i>Upload Photo:</label>
    <div class="pbuddy-input-wrapper">
      <input type="file" name="profilePic" accept="image/*">
    </div>
  </div>

  <div class="bttn" style="justify-content: flex-end;" >
    <input type="submit" value="Save Member" class="pbuddy-submit-btn pbg" id="submitBtn">
  </div>
</form>	
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
    // Show loader when form is submitted
    function showAdminLoader() {
        document.querySelector('.admin-loading-overlay').style.display = 'flex';
    }
    
    // Hide loader when page is fully loaded
    window.addEventListener('load', function() {
        document.querySelector('.admin-loading-overlay').style.display = 'none';
    });
    
    // Password toggle functionality
    const togglePassword = document.querySelector('#togglePassword');
    const password = document.querySelector('#password');
    
    const toggleConfirmPassword = document.querySelector('#toggleConfirmPassword');
    const confirmPassword = document.querySelector('#confirmpassword');
    
    togglePassword.addEventListener('click', function() {
        // toggle the type attribute
        const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
        password.setAttribute('type', type);
        
        // toggle the icon
        this.classList.toggle('fa-eye');
        this.classList.toggle('fa-eye-slash');
    });
    
    toggleConfirmPassword.addEventListener('click', function() {
        // toggle the type attribute
        const type = confirmPassword.getAttribute('type') === 'password' ? 'text' : 'password';
        confirmPassword.setAttribute('type', type);
        
        // toggle the icon
        this.classList.toggle('fa-eye');
        this.classList.toggle('fa-eye-slash');
    });
    
    // Password validation
    function validatePasswords() {
        const passwordValue = password.value;
        const confirmPasswordValue = confirmPassword.value;
        const passwordMessage = document.getElementById('password-message');
        const submitBtn = document.getElementById('submitBtn');
        
        if (passwordValue !== confirmPasswordValue && confirmPasswordValue.length > 0) {
            passwordMessage.style.display = 'block';
            password.style.borderColor = 'red';
            confirmPassword.style.borderColor = 'red';
            submitBtn.disabled = true;
            return false;
        } else {
            passwordMessage.style.display = 'none';
            password.style.borderColor = '';
            confirmPassword.style.borderColor = '';
            submitBtn.disabled = false;
            return true;
        }
    }
    
    // Add event listeners for real-time validation
    password.addEventListener('input', validatePasswords);
    confirmPassword.addEventListener('input', validatePasswords);
    
    // Form validation and phone number prefix handling
    function validateForm() {
        // Get the phone number input
        const phoneDisplay = document.getElementById('contactNumDisplay');
        const phoneHidden = document.getElementById('contactNum');
        
        // Add +91 prefix to the hidden field
        phoneHidden.value = '+91' + phoneDisplay.value;
        
        // Validate passwords
        if (!validatePasswords()) {
            return false;
        }
        
        showAdminLoader();
        return true;
    }
    
    // Initialize form validation on page load
    document.addEventListener('DOMContentLoaded', function() {
        validatePasswords();
    });
    </script>
</body>
</html>
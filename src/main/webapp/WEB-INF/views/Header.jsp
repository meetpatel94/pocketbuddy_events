<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>TheEvent - Bootstrap Event Template</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="img/logo.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800" rel="stylesheet">
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="lib/animate/animate.min.css" rel="stylesheet">
  <link href="lib/venobox/venobox.css" rel="stylesheet">
  <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">

  <style>
    nav ul li a {
      text-decoration: none !important;
    }

    .logout {
      background-color: #432e543b;
    }

    /* City Dropdown Styling */
    .city-dropdown {
      position: relative;
      display: inline-block;
      margin-top: 10px;
    }

    .city-btn {
      background-color: #432E54;
      color: white;
      padding: 8px 16px;
      border-radius: 8px;
      font-weight: bold;
      cursor: pointer;
      transition: all 0.3s ease;
      border: none;
      box-shadow: 0 0 10px rgba(67, 46, 84, 0.4);
    }

    .city-btn:hover {
      background-color: #060d22;
      box-shadow: 0 0 15px rgba(67, 46, 84, 0.7);
    }

    .city-list {
      display: none;
      position: absolute;
      background-color: white;
      border-radius: 8px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
      margin-top: 5px;
      z-index: 1000;
      list-style: none;
      padding: 0;
      width: 170px;
    }

    .city-list li {
      padding: 10px 16px;
      color: #333;
      cursor: pointer;
      transition: background-color 0.2s;
    }

    .city-list li:hover {
      background-color: #060d22;
      color: white;
    }

    .city-dropdown.open .city-list {
      display: block;
    }

    .city-list li i {
      margin-right: 8px;
      color: #f82249;
    }

    .city-btn i {
      margin-right: 8px;
    }

    .welcome-text {
      color: white;
      font-size: 14px;
      font-weight: bold;
      margin-top: 10px;
    }
    
    /* Profile Dropdown Styles */
    .profile-dropdown {
      position: relative;
      display: inline-block;
    }
    
    .profile-container {
      display: flex;
      align-items: center;
      cursor: pointer;
      padding: 5px 10px;
      border-radius: 20px;
      transition: all 0.3s;
    }
    
    .profile-container:hover {
      background-color: rgba(255, 255, 255, 0.1);
    }
    
    .profile-menu {
      display: none;
      position: absolute;
      right: 0;
      background-color: white;
      min-width: 200px;
      box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
      z-index: 1000;
      border-radius: 5px;
      overflow: hidden;
    }
    
    .profile-dropdown.open .profile-menu {
      display: block;
    }
    
    .profile-menu a {
      color: #333;
      padding: 12px 16px;
      text-decoration: none;
      display: block;
      transition: background-color 0.3s;
    }
    
    .profile-menu a:hover {
      background-color: #f82249;
      color: white;
    }
    
    .profile-menu a i {
      margin-right: 10px;
      width: 20px;
      text-align: center;
    }
    
    .user-name {
      margin-left: 10px;
      color: white;
      font-weight: bold;
    }
    
    .dropdown-arrow {
      margin-left: 8px;
      transition: transform 0.3s;
      color: white;
    }
    
    .profile-dropdown.open .dropdown-arrow {
      transform: rotate(180deg);
    }
    
    /* Modal Styles - Improved */
    .modal-overlay {
      display: none;
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0,0,0,0.7);
      z-index: 9999;
      overflow-y: auto;
    }
    
    .modal-content {
      background-color: #fff;
      margin: 5% auto;
      padding: 0;
      border-radius: 8px;
      width: 90%;
      max-width: 600px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.5);
      position: relative;
      animation: modalopen 0.4s;
    }
    
    @keyframes modalopen {
      from {opacity: 0; transform: translateY(-50px);}
      to {opacity: 1; transform: translateY(0);}
    }
    
    .modal-header {
      background: linear-gradient(135deg, #432E54 0%, #2c1d36 100%);
      color: white;
      padding: 15px 20px;
      border-radius: 8px 8px 0 0;
      padding:14px !important;
    }
    
    .modal-title {
      margin: 0;
      font-size: 1.5rem;
    }
    
    .close-btn {
      position: absolute;
      top: 15px;
      right: 20px;
      color: white;
      font-size: 1.5rem;
      cursor: pointer;
      transition: color 0.3s;
    }
    
    .close-btn:hover {
      color: #f82249;
    }
    
    .modal-body {
      padding: 20px;
    }
    
    .form-group {
      margin-bottom: 1.5rem;
    }
    
    .form-group label {
      display: block;
      margin-bottom: 0.5rem;
      font-weight: 600;
      color: #432E54;
    }
    
    .form-control {
      width: 100%;
      padding: 10px 15px;
      border: 1px solid #ddd;
      border-radius: 4px;
      font-size: 1rem;
      transition: border-color 0.3s;
    }
    
    .form-control:focus {
      border-color: #432E54;
      outline: none;
      box-shadow: 0 0 0 3px rgba(67, 46, 84, 0.2);
    }
    
    .btn-primary {
      background: linear-gradient(135deg, #432E54 0%, #2c1d36 100%);
      color: white;
      border: none;
      padding: 12px 25px;
      border-radius: 4px;
      cursor: pointer;
      font-size: 1rem;
      font-weight: 600;
      transition: all 0.3s;
      display: inline-block;
    }
    
    .btn-primary:hover {
      background: linear-gradient(135deg, #2c1d36 0%, #432E54 100%);
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(67, 46, 84, 0.4);
    }
    
    .profile-pic-container {
      display: flex;
      align-items: center;
      margin-bottom: 1.5rem;
    }
    
    .profile-pic-preview {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
      border: 3px solid #432E54;
      margin-right: 20px;
    }
    
    .profile-pic-upload {
      display: flex;
      flex-direction: column;
    }
    
    .profile-pic-upload-btn {
      background-color: #f5f5f5;
      color: #432E54;
      border: 1px dashed #432E54;
      padding: 10px 15px;
      border-radius: 4px;
      cursor: pointer;
      margin-bottom: 8px;
      text-align: center;
      transition: all 0.3s;
    }
    
    .profile-pic-upload-btn:hover {
      background-color: #e9e9e9;
    }
    
    .profile-pic-remove {
      color: #f82249;
      cursor: pointer;
      font-size: 0.9rem;
      text-align: center;
      transition: color 0.3s;
    }
    
    .profile-pic-remove:hover {
      color: #d81a3f;
    }
    
    /* Responsive adjustments */
    @media (max-width: 768px) {
      .modal-content {
        width: 95%;
        margin: 10% auto;
      }
      
      .profile-pic-container {
        flex-direction: column;
        align-items: flex-start;
      }
      
      .profile-pic-preview {
        margin-right: 0;
        margin-bottom: 15px;
      }
    }
    form{
    padding: 17px 0px 17px 0px !important;
    }
    .att:hover{
    background-color: #6c1cad3b;
    }
  </style>
</head>

<body>

  <!--==========================
    Header
  ============================-->
  <header id="header">
    <div class="container">

      <div id="logo" class="pull-left">
        <!-- Logo and app title -->
        <h2 style="color: red;">
          <img src="img/logo.png" alt="" title="">
          Pocket<span>B</span>uddy
        </h2>

        <!-- City Dropdown Menu using UL with Icons -->
       

      </div>

      <nav id="nav-menu-container">
        <ul class="nav-menu">
          <li class="menu-active"><a href="#intro">Home</a></li> 
          <li class="menu-has-children"><a href="#">Events</a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="home">Business</a></li>
              <li><a class="dropdown-item" href="musicshow">Music</a></li>
              <li><a class="dropdown-item" href="concert">Concerts</a></li>
              <li><a class="dropdown-item" href="dance">Dances</a></li>
              <li><a class="dropdown-item" href="comedy">Comedy</a></li>
            </ul>
          </li>
          <li><a href="#schedule">Schedule</a></li>
          <li><a href="#contact">Contact</a></li>
          <li><a href="#about">About</a></li>
          <li><a href="#" onclick="openPopup()">Rate Us</a></li>
          <li class="profile-dropdown" id="profileDropdown">
            <div class="profile-container" onclick="toggleProfileDropdown()">
              <img src="${user.profilePicPath}" alt="User"
                style="width: 40px; height: 40px; border-radius: 50%; object-fit: cover; border: 2px solid red;">
              <span class="user-name">${user.firstName}</span>
              <i class="fas fa-chevron-down dropdown-arrow"></i>
            </div>
            <div class="profile-menu">
              <!-- <a href="profile"><i class="fas fa-user"></i> My Profile</a>
             
              <a href="#" onclick="openChangePasswordModal()"><i class="fas fa-key"></i> Change Password</a> -->
               <a href="#" onclick="openUpdateProfileModal()"><i class="fas fa-cog"></i> Update Profile</a>
              <a href="logout" class="att"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </div>
          </li>
        </ul>
      </nav><!-- #nav-menu-container -->

    </div>
  </header><!-- #header -->

  <!-- Update Profile Modal -->
  <div id="updateProfileModal" class="modal-overlay" >
    <div class="modal-content" style="background-color:white;" >
      <div class="modal-header">
        <h3 class="modal-title">Update Profile</h3>
        <span class="close-btn" onclick="closeModal('updateProfileModal')">&times;</span>
      </div>
      <div class="modal-body">
        <form id="updateProfileForm" action="update" method="post">
          <div class="profile-pic-container">
            <img id="profilePicPreview" src="${user.profilePicPath}" class="profile-pic-preview" alt="Profile Picture">
            <div class="profile-pic-upload">
              <label for="profilePicUpload" class="profile-pic-upload-btn">
                <i class="fas fa-camera"></i> Change Photo
              </label>
              <input type="file" id="profilePicUpload" accept="image/*" style="display: none;" onchange="previewProfilePic(this)">
              <span class="profile-pic-remove" onclick="removeProfilePic()">
                <i class="fas fa-times"></i> Remove
              </span>
            </div>
          </div>
          
          <div class="form-group">
            <label for="firstName">First Name</label>
            <input type="text" class="form-control" id="firstName" value="${user.firstName}" required>
          </div>
          
          <div class="form-group">
            <label for="lastName">Last Name</label>
            <input type="text" class="form-control" id="lastName" value="${user.lastName}" required>
          </div>
          
          <div class="form-group">
            <label for="gender">Gender</label>
            <select class="form-control" id="gender" required>
              <option value="">Select Gender</option>
              <option value="male" ${user.gender == 'male' ? 'selected' : ''}>Male</option>
              <option value="female" ${user.gender == 'female' ? 'selected' : ''}>Female</option>
              <option value="other" ${user.gender == 'other' ? 'selected' : ''}>Other</option>
            </select>
          </div>
          
          <div class="form-group">
            <label for="dob">Date of Birth</label>
            <input type="date" class="form-control" id="dob" value="${user.bornYear}" required>
          </div>
          
          <div class="form-group">
            <label for="contactNo">Contact Number</label>
            <input type="tel" class="form-control" id="contactNo" value="${user.contactNum}" required>
          </div>
          <input type="submit"  class="btn-primary">
        </form>
      </div>
    </div>
  </div>

  <!-- Change Password Modal -->
  <div id="changePasswordModal" class="modal-overlay">
    <div class="modal-content" style="background-color:white;">
      <div class="modal-header">
        <h3 class="modal-title">Change Password</h3>
        <span class="close-btn" onclick="closeModal('changePasswordModal')">&times;</span>
      </div>
      <div class="modal-body">
        <form action="updatepass" method="post" id="changePasswordForm">
          <div class="form-group">
            <label for="currentPassword">Current Password</label>
            <input type="password" class="form-control" id="currentPassword" required>
          </div>
          
          <div class="form-group">
            <label for="newPassword">New Password</label>
            <input type="password" class="form-control" id="newPassword" name="password" required>
          </div>
          
          <div class="form-group">
            <label for="confirmPassword">Confirm New Password</label>
            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
          </div>
          
          <input type="submit" value="Change Password" class="btn-primary">
        </form>
      </div>
    </div>
  </div>

  <!-- JavaScript -->
  <script>
    // Dropdown functions
    function toggleCityDropdown() {
      document.getElementById('cityDropdown').classList.toggle('open');
    }

    function selectCity(city) {
      const btn = document.querySelector('.city-btn');
      btn.innerHTML = '<i class="fas fa-map-marker-alt"></i> ' + city;
      document.getElementById('cityDropdown').classList.remove('open');
      console.log("Selected city:", city);
    }
    
    function toggleProfileDropdown() {
      document.getElementById('profileDropdown').classList.toggle('open');
    }

    // Modal functions
    function openUpdateProfileModal() {
      document.getElementById('updateProfileModal').style.display = 'block';
      document.body.style.overflow = 'hidden'; // Prevent scrolling when modal is open
      document.getElementById('profileDropdown').classList.remove('open');
    }
    
    function openChangePasswordModal() {
      document.getElementById('changePasswordModal').style.display = 'block';
      document.body.style.overflow = 'hidden'; // Prevent scrolling when modal is open
      document.getElementById('profileDropdown').classList.remove('open');
    }
    
    function closeModal(modalId) {
      document.getElementById(modalId).style.display = 'none';
      document.body.style.overflow = 'auto'; // Re-enable scrolling
    }
    
    // Close modals when clicking outside
    window.onclick = function(event) {
      const modals = document.querySelectorAll('.modal-overlay');
      modals.forEach(modal => {
        if (event.target == modal) {
          modal.style.display = 'none';
          document.body.style.overflow = 'auto';
        }
      });
      
      // Close dropdowns when clicking outside
      const dropdowns = document.querySelectorAll('.city-dropdown, .profile-dropdown');
      dropdowns.forEach(dropdown => {
        if (!dropdown.contains(event.target)) {
          dropdown.classList.remove('open');
        }
      });
    }
    
    // Profile picture preview
    function previewProfilePic(input) {
      if (input.files && input.files[0]) {
        const reader = new FileReader();
        reader.onload = function(e) {
          document.getElementById('profilePicPreview').src = e.target.result;
        }
        reader.readAsDataURL(input.files[0]);
      }
    }
    
    function removeProfilePic() {
      document.getElementById('profilePicPreview').src = 'img/default-profile.png';
      document.getElementById('profilePicUpload').value = '';
    }
    
    // Form submissions
    document.getElementById('updateProfileForm').addEventListener('submit', function(e) {
      e.preventDefault();
      // Add your update profile logic here
      alert('Profile updated successfully!');
      closeModal('updateProfileModal');
    });
    
    document.getElementById('changePasswordForm').addEventListener('submit', function(e) {
      e.preventDefault();
      const newPassword = document.getElementById('newPassword').value;
      const confirmPassword = document.getElementById('confirmPassword').value;
      
      if (newPassword !== confirmPassword) {
        alert('Passwords do not match!');
        return;
      }
      
      // Add your change password logic here
      alert('Password changed successfully!');
      closeModal('changePasswordModal');
    });
  </script>

</body>
</html>
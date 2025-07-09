<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.input-group-text{
    font-size: 19px;
    padding: 11px;
}
.toast-notification.error-toast {
  background-color: #f44336; 
}
.forgotpass{
  margin-left:23px;
  
}
.forgotpass:hover{
  color:red;
}
</style>
</head>
<body>
    <div class="main-panel">
        <div class="main-header">
          <div class="main-header-logo">
            <!-- Logo Header -->
            <div class="logo-header" data-background-color="dark">
              <a href="index.html" class="logo">
                <img
                  src="${user.profilePicPath }"
                  alt="navbar brand"
                  class="navbar-brand"
                  height="20"
                />
              </a>
              <div class="nav-toggle">
                <button class="btn btn-toggle toggle-sidebar">
                  <i class="gg-menu-right"></i>
                </button>
                <button class="btn btn-toggle sidenav-toggler">
                  <i class="gg-menu-left"></i>
                </button>
              </div>
              <button class="topbar-toggler more">
                <i class="gg-more-vertical-alt"></i>
              </button>
            </div>
            <!-- End Logo Header -->
          </div>
          <!-- Navbar Header -->
          <nav
            class="navbar navbar-header navbar-header-transparent navbar-expand-lg border-bottom"
          >
            <div class="container-fluid">
              <nav
                class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex"
              >
                <div class="input-group">
                  <div class="input-group-prepend">
                    <button type="submit" class="btn btn-search pe-1">
                      <i class="fa fa-search search-icon"></i>
                    </button>
                  </div>
                  <input
                    type="text"
                    placeholder="Search ..."
                    class="form-control"
                  />
                </div>
              </nav>

              <ul class="navbar-nav topbar-nav ms-md-auto align-items-center">
                <li
                  class="nav-item topbar-icon dropdown hidden-caret d-flex d-lg-none"
                >
                  <a
                    class="nav-link dropdown-toggle"
                    data-bs-toggle="dropdown"
                    href="#"
                    role="button"
                    aria-expanded="false"
                    aria-haspopup="true"
                  >
                    <i class="fa fa-search"></i>
                  </a>
                  <ul class="dropdown-menu dropdown-search animated fadeIn">
                    <form class="navbar-left navbar-form nav-search">
                      <div class="input-group">
                        <input
                          type="text"
                          placeholder="Search ..."
                          class="form-control"
                        />
                      </div>
                    </form>
                  </ul>
                </li>
                <li class="nav-item topbar-icon dropdown hidden-caret">
                  <a
                    class="nav-link dropdown-toggle"
                    href="#"
                    id="messageDropdown"
                    role="button"
                    data-bs-toggle="dropdown"
                    aria-haspopup="true"
                    aria-expanded="false"
                  >
                    <i class="fa fa-envelope"></i>
                  </a>
                  <ul
                    class="dropdown-menu messages-notif-box animated fadeIn"
                    aria-labelledby="messageDropdown"
                  >
                    <li>
                      <div
                        class="dropdown-title d-flex justify-content-between align-items-center"
                      >
                        Messages
                        <a href="#" class="small">Mark all as read</a>
                      </div>
                    </li>
                    <li>
                      <div class="message-notif-scroll scrollbar-outer">
                        <div class="notif-center">
                          <a href="#">
                            <div class="notif-img">
                              <img
                                src="assets/img/jm_denis.jpg"
                                alt="Img Profile"
                              />
                            </div>
                            <div class="notif-content">
                              <span class="subject">Jimmy Denis</span>
                              <span class="block"> How are you ? </span>
                              <span class="time">5 minutes ago</span>
                            </div>
                          </a>
                          <a href="#">
                            <div class="notif-img">
                              <img
                                src="assets/img/chadengle.jpg"
                                alt="Img Profile"
                              />
                            </div>
                            <div class="notif-content">
                              <span class="subject">Chad</span>
                              <span class="block"> Ok, Thanks ! </span>
                              <span class="time">12 minutes ago</span>
                            </div>
                          </a>
                          <a href="#">
                            <div class="notif-img">
                              <img
                                src="assets/img/mlane.jpg"
                                alt="Img Profile"
                              />
                            </div>
                            <div class="notif-content">
                              <span class="subject">Jhon Doe</span>
                              <span class="block">
                                Ready for the meeting today...
                              </span>
                              <span class="time">12 minutes ago</span>
                            </div>
                          </a>
                          <a href="#">
                            <div class="notif-img">
                              <img
                                src="assets/img/talha.jpg"
                                alt="Img Profile"
                              />
                            </div>
                            <div class="notif-content">
                              <span class="subject">Talha</span>
                              <span class="block"> Hi, Apa Kabar ? </span>
                              <span class="time">17 minutes ago</span>
                            </div>
                          </a>
                        </div>
                      </div>
                    </li>
                    <li>
                      <a class="see-all" href="javascript:void(0);"
                        >See all messages<i class="fa fa-angle-right"></i>
                      </a>
                    </li>
                  </ul>
                </li>
                
<!-- Notification start  -->
                <li class="nav-item topbar-icon dropdown hidden-caret">
                  <a
                    class="nav-link dropdown-toggle"
                    href="#"
                    id="notifDropdown"
                    role="button"
                    data-bs-toggle="dropdown"
                    aria-haspopup="true"
                    aria-expanded="false"
                  >
                    <i class="fa fa-bell"></i>
                    <span class="notification">4</span>
                  </a>
                  <ul
                    class="dropdown-menu notif-box animated fadeIn"
                    aria-labelledby="notifDropdown"
                  >
                    <li>
                      <div class="dropdown-title">
                        You have 4 new notification
                      </div>
                    </li>
                    <li>
                      <div class="notif-scroll scrollbar-outer">
                      <c:forEach var="c" items="${comments}" varStatus="loop">
  <c:if test="${loop.index < 4}">
    <div class="notif-center">
      <a href="#">
        <div class="notif-icon notif-${loop.index % 2 == 0 ? 'primary' : 'success'}">
          <i class="fa ${loop.index % 3 == 0 ? 'fa-user-plus' : (loop.index % 3 == 1 ? 'fa-comment' : 'fa-bell')}"></i>
        </div>
        <div class="notif-content">
          <span class="block">${c.name}</span>
          <span class="time">${c.subject}</span>
        </div>
      </a>
    </div>
  </c:if>
</c:forEach>
                      
                      </div>
                    </li>
                    <li>
                      <a class="see-all" href="commentspage"
                        >See all notifications<i class="fa fa-angle-right"></i>
                      </a>
                    </li>
                  </ul>
                </li>
<!-- Notification end  -->

                
                <li class="nav-item topbar-user dropdown hidden-caret">
                  <a
                    class="dropdown-toggle profile-pic"
                    data-bs-toggle="dropdown"
                    href="#"
                    aria-expanded="false"
                  >
                    <div class="avatar-sm">
                      <img
                        src="${user.profilePicPath }"
                        alt="..."
                        class="avatar-img rounded-circle"
                      />
                    </div>
                    <span class="profile-username">
                      <span class="op-7">Hi,</span>
                      <span class="fw-bold">${user.firstName }&nbsp;${user.lastName}</span>
                    </span>
                  </a>
                  <ul class="dropdown-menu dropdown-user animated fadeIn" >
                    <div class="dropdown-user-scroll scrollbar-outer">
                      <li>
                        <div class="user-box" >
                          <div class="avatar-lg">
                            <img
                              src="${user.profilePicPath }"
                              alt="image profile"
                              class="avatar-img rounded"
                            />
                          </div>
                          <div class="u-text">
                            <h4>${user.firstName }&nbsp;${user.lastName}</h4>
                            <p class="text-muted">${user.email }</p>
                            <!-- <a
                              href="#"
                              class="btn btn-xs btn-secondary btn-sm"
                              >View Profile</a
                            > -->
                          </div>
                        </div>
                      </li>
                      <li>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#editProfileModal">My Profile</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Change Password</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="logout">Logout</a>
                      </li>
                    </div>
                  </ul>
                </li>
              </ul>
            </div>
          </nav>
          <!-- End Navbar -->
        </div>

<!-- Add this modal HTML right before the closing </div> of the main-panel div -->
<div class="modal fade" id="editProfileModal" tabindex="-1" role="dialog" aria-labelledby="editProfileModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="editProfileModalLabel">Edit Profile</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" style="visibility: hidden;">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="updateProfileForm" action="update" method="post" enctype="multipart/form-data">
          <div class="profile-pic-container text-center mb-4">
            <img id="profilePicPreview" src="${user.profilePicPath}" class="profile-pic-preview rounded-circle" alt="Profile Picture" style="width: 150px; height: 150px; object-fit: cover;">
            <div class="profile-pic-upload mt-3">
              <label for="profilePicUpload" class="btn btn-sm btn-primary">
                <i class="fas fa-upload"></i> Change Photo
              </label>
              <input type="file" id="profilePicUpload" name="profilePic" onchange="previewProfilePic(this)" style="display: none;">
              <button type="button" class="btn btn-sm btn-danger" onclick="removeProfilePic()">
                <i class="fas fa-times"></i> Remove
              </button>
            </div>
          </div>
        
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label for="firstName">First Name</label>
                <input type="text" class="form-control" id="firstName" name="firstName" value="${user.firstName}" required>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label for="lastName">Last Name</label>
                <input type="text" class="form-control" id="lastName" name="lastName" value="${user.lastName}" required>
              </div>
            </div>
          </div>
          
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label for="gender">Gender</label>
                <select class="form-control" id="gender" name="gender" required>
                  <option value="">Select Gender</option>
                  <option value="male" ${user.gender == 'male' ? 'selected' : ''}>Male</option>
                  <option value="female" ${user.gender == 'female' ? 'selected' : ''}>Female</option>
                  <option value="other" ${user.gender == 'other' ? 'selected' : ''}>Other</option>
                </select>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group">
                <label for="dob">Date of Birth</label>
                <input type="date" class="form-control" id="dob" name="bornYear" value="${user.bornYear}" required>
              </div>
            </div>
          </div>
          
          <div class="form-group">
            <label for="contactNo">Contact Number</label>
            <input type="tel" class="form-control" id="contactNo" name="contactNum" value="${user.contactNum}" required>
          </div>
          
          <input type="hidden" name="userId" value="${user.userId}">
          <input type="hidden" name="password" value="${user.password}">
          <input type="hidden" name="email" value="${user.email}">
          <input type="hidden" name="city" value="${user.city}">
          <input type="hidden" name="role" value="${user.role}">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" form="updateProfileForm" class="btn btn-primary">Save Changes</button>
      </div>
    </div>
  </div>
</div>

<script>
// Make sure Bootstrap JS is loaded
document.addEventListener('DOMContentLoaded', function() {
  // Profile picture functions
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
    document.getElementById('profilePicPreview').src = '${user.profilePicPath}';
    document.getElementById('profilePicUpload').value = '';
  }

  // Initialize event listeners
  document.getElementById('profilePicUpload').addEventListener('change', function() {
    previewProfilePic(this);
  });

  // Initialize modal properly
  const editProfileModal = new bootstrap.Modal(document.getElementById('editProfileModal'));
  
  // Handle My Profile click
  document.querySelector('.dropdown-item[data-bs-target="#editProfileModal"]').addEventListener('click', function(e) {
    e.preventDefault();
    editProfileModal.show();
  });
});
</script>

<!-- Add this modal HTML right after the editProfileModal -->
<div class="modal fade" id="changePasswordModal" tabindex="-1" role="dialog" aria-labelledby="changePasswordModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="changePasswordModalLabel">Change Password</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" style="visibility: hidden;">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <form id="changePasswordForm" action="updatepass" method="post">
  <div class="form-group">
    <label for="currentPassword">Current Password</label>
    <div class="input-group">
      <input type="password" class="form-control" id="currentPassword" name="currentpassword" required>
      <div class="input-group-append">
        <span class="input-group-text" style="cursor: pointer;" onclick="togglePassword('currentPassword', 'currentPasswordToggle')">
          <i id="currentPasswordToggle" class="fas fa-eye-slash"></i>
        </span>
      </div>
    </div>
  </div>
  
  <div class="form-group mt-3">
    <label for="newPassword">New Password</label>
    <div class="input-group">
      <input type="password" class="form-control" id="newPassword" name="password" required>
      <div class="input-group-append">
        <span class="input-group-text" style="cursor: pointer;" onclick="togglePassword('newPassword', 'newPasswordToggle')">
          <i id="newPasswordToggle" class="fas fa-eye-slash"></i>
        </span>
      </div>
    </div>
    <small class="form-text text-muted">Password must be at least 8 characters long</small>
  </div>
  
  <div class="form-group mt-3">
    <label for="confirmPassword">Confirm New Password</label>
    <div class="input-group">
      <input type="password" class="form-control" id="confirmPassword" name="confirmpassword" required>
      <div class="input-group-append">
        <span class="input-group-text" style="cursor: pointer;" onclick="togglePassword('confirmPassword', 'confirmPasswordToggle')">
          <i id="confirmPasswordToggle" class="fas fa-eye-slash"></i>
        </span>
      </div>
    </div>
    <div id="passwordMatchError" class="invalid-feedback" style="display: none;">
      Passwords do not match
    </div>
  </div>
  <input type="hidden" name="email" value="${user.email}">
  <input type="hidden" name="userId" value="${user.userId}">
</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" id="submitPasswordChange" form="changePasswordForm" class="btn btn-primary" disabled>Save Changes</button>
      </div>
      <p class="forgotpass"><a href="userforgetpassword?userId=${user.userId}" >Forgot Password ?</a></p>
    </div>
  </div>
</div>



<script>
// Toggle password visibility
function togglePassword(inputId, toggleIconId) {
  const input = document.getElementById(inputId);
  const icon = document.getElementById(toggleIconId);
  
  if (input.type === "password") {
    input.type = "text";
    icon.classList.remove("fa-eye-slash");
    icon.classList.add("fa-eye");
  } else {
    input.type = "password";
    icon.classList.remove("fa-eye");
    icon.classList.add("fa-eye-slash");
  }
}

// Password validation
document.addEventListener('DOMContentLoaded', function() {
  const newPassword = document.getElementById('newPassword');
  const confirmPassword = document.getElementById('confirmPassword');
  const passwordMatchError = document.getElementById('passwordMatchError');
  
  function validatePasswords() {
    if (newPassword.value !== confirmPassword.value && confirmPassword.value.length > 0) {
      confirmPassword.classList.add('is-invalid');
      passwordMatchError.style.display = 'block';
      return false;
    } else {
      confirmPassword.classList.remove('is-invalid');
      passwordMatchError.style.display = 'none';
      return true;
    }
  }
  
  // Real-time validation
  newPassword.addEventListener('input', validatePasswords);
  confirmPassword.addEventListener('input', validatePasswords);
  
  // Form submission validation
  document.getElementById('changePasswordForm').addEventListener('submit', function(e) {
    if (!validatePasswords()) {
      e.preventDefault();
    }
  });
});
</script>
<script>
// Add this to your existing script
document.addEventListener('DOMContentLoaded', function() {
  // Initialize the change password modal
  const changePasswordModal = new bootstrap.Modal(document.getElementById('changePasswordModal'));
  
  // Handle Change Password click
  document.querySelector('.dropdown-item[href="#"]:not([data-bs-toggle])').addEventListener('click', function(e) {
    e.preventDefault();
    changePasswordModal.show();
  });

  // Password validation logic
  const newPassword = document.getElementById('newPassword');
  const confirmPassword = document.getElementById('confirmPassword');
  const passwordMatchError = document.getElementById('passwordMatchError');
  const submitBtn = document.getElementById('submitPasswordChange');

  function validatePasswords() {
    if (newPassword.value.length < 3) {
      submitBtn.disabled = true;
      return;
    }
    
    if (newPassword.value !== confirmPassword.value) {
      confirmPassword.classList.add('is-invalid');
      passwordMatchError.style.display = 'block';
      submitBtn.disabled = true;
    } else {
      confirmPassword.classList.remove('is-invalid');
      passwordMatchError.style.display = 'none';
      submitBtn.disabled = false;
    }
  }

  // Add event listeners for password validation
  newPassword.addEventListener('input', validatePasswords);
  confirmPassword.addEventListener('input', validatePasswords);

  // Form submission handler
  document.getElementById('changePasswordForm').addEventListener('submit', function(e) {
    if (newPassword.value !== confirmPassword.value) {
      e.preventDefault();
      alert('Passwords do not match!');
    }
  });
});
</script>

<div id="toast" class="toast-notification">
  <div class="toast-icon">
    <i class="fas fa-check-circle" style="display:none;" id="icon" ></i>
    <i class="fas fa-exclamation-circle" style="display:none;" id="icon2" ></i> 
  </div>
  <div class="toast-message" id="toastMessage"></div>
</div>


<script>
  // Toast notification function
  function showToast(message, type = 'success') {
    const toast = document.getElementById('toast');
    const toastMessage = document.getElementById('toastMessage');
    const icon = document.getElementById('icon');
    const icon2 = document.getElementById('icon2');
    
    // Reset classes
    toast.className = 'toast-notification';
    
    // Set message and type
    toastMessage.textContent = message;
    
    // Add type-specific class
    if (type === 'profile') {
      toast.classList.add('profile-update');
    } else if (type === 'error') {
      toast.classList.add('error-toast');
    }

    toast.classList.add('show');
    
    // Hide toast after 3 seconds
    setTimeout(() => {
      toast.classList.remove('show');
    }, 3000);
  }

  // Clean URL function
  function cleanUrl() {
    window.history.replaceState({}, document.title, window.location.pathname);
  }

  // On page load, check for URL params
  document.addEventListener('DOMContentLoaded', function() {
    const urlParams = new URLSearchParams(window.location.search);
    
    if (urlParams.has('passwordChanged')) {
      showToast('Password changed successfully!');
      icon.style.display = 'block';
      cleanUrl();
    }

    if (urlParams.has('profileUpdated')) {
      showToast('Profile updated successfully!', 'profile');
      icon.style.display = 'block';
      
      cleanUrl();
    }

    if (urlParams.get('error') === 'incorrect_password') {
      showToast('Current password was wrong.', 'error');
      icon2.style.display = 'block';
      cleanUrl();
    }
  });
</script>

</body>
</html>
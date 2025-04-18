<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Business Event</title>
<style>
.container{
  margin-left:20px !important;
}
.form-container {
    background: white;
    padding: 2rem;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
    max-width: 800px;
    margin-top: 20px;
}
.form-group {
    margin-bottom: 1.5rem;
}
.form-row {
    display: flex;
    gap: 20px;
    margin-bottom: 1rem;
}
.form-row .form-field {
    flex: 1;
}
label {
    display: block;
    margin-bottom: 0.5rem;
    font-weight: 500;
    color: #333;
}
input[type="text"],
input[type="date"],
input[type="time"],
select,
input[type="file"] {
    width: 100%;
    padding: 0.75rem;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 1rem;
}
input[type="text"]:focus,
input[type="date"]:focus,
input[type="time"]:focus,
select:focus,
input[type="file"]:focus {
    outline: none;
    border-color: #4a90e2;
    box-shadow: 0 0 0 2px rgba(74,144,226,0.2);
}
.btn-group {
    display: flex;
    gap: 10px;
    margin-top: 2rem;
}
.btn {
    padding: 0.75rem 1.5rem;
    border: none;
    border-radius: 5px;
    font-size: 1rem;
    cursor: pointer;
    transition: all 0.3s ease;
}
.btn-primary {
    background-color: #4a90e2;
    color: white;
}
.btn-primary:hover {
    background-color: #3a7bc8;
}
.btn-secondary {
    background-color: #6c757d;
    color: white;
}
.btn-secondary:hover {
    background-color: #5a6268;
}
.event-type {
    background-color: #f8f9fa;
    padding: 0.75rem;
    border-radius: 5px;
    margin-bottom: 1.5rem;
    border: 1px solid #ddd;
}
.time-fields {
    display: flex;
    gap: 20px;
}
.time-field {
    flex: 1;
}
.image-preview {
    margin-top: 10px;
    max-width: 200px;
    max-height: 200px;
    display: none;
}
</style>
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
.btn-primary{
 background-color:green !important;
 border-radius: 10px 10px 10px 10px !important;
}
.btn-primary:hover{
 background-color:#4ab74a !important;
}
.btn-secondary {
 border-radius: 10px 10px 10px 10px !important;
}
</style>
</head>
<body>
   
   <!-- sidebar -->
   <div class="wrapper">
   <jsp:include page="ADMIN_Sidebar.jsp"></jsp:include>
   
   <!-- header -->
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
                        <div class="notif-center">
                          <a href="#">
                            <div class="notif-icon notif-primary">
                              <i class="fa fa-user-plus"></i>
                            </div>
                            <div class="notif-content">
                              <span class="block"> New user registered </span>
                              <span class="time">5 minutes ago</span>
                            </div>
                          </a>
                          <a href="#">
                            <div class="notif-icon notif-success">
                              <i class="fa fa-comment"></i>
                            </div>
                            <div class="notif-content">
                              <span class="block">
                                Rahmad commented on Admin
                              </span>
                              <span class="time">12 minutes ago</span>
                            </div>
                          </a>
                          <a href="#">
                            <div class="notif-img">
                              <img
                                src="${user.profilePicPath }"
                                alt="Img Profile"
                              />
                            </div>
                            <div class="notif-content">
                              <span class="block">
                                Reza send messages to you
                              </span>
                              <span class="time">12 minutes ago</span>
                            </div>
                          </a>
                          <a href="#">
                            <div class="notif-icon notif-danger">
                              <i class="fa fa-heart"></i>
                            </div>
                            <div class="notif-content">
                              <span class="block"> Farrah liked Admin </span>
                              <span class="time">17 minutes ago</span>
                            </div>
                          </a>
                        </div>
                      </div>
                    </li>
                    <li>
                      <a class="see-all" href="javascript:void(0);"
                        >See all notifications<i class="fa fa-angle-right"></i>
                      </a>
                    </li>
                  </ul>
                </li>
                <li class="nav-item topbar-icon dropdown hidden-caret">
                  <a
                    class="nav-link"
                    data-bs-toggle="dropdown"
                    href="#"
                    aria-expanded="false"
                  >
                    <i class="fas fa-layer-group"></i>
                  </a>
                  <div class="dropdown-menu quick-actions animated fadeIn">
                    <div class="quick-actions-header">
                      <span class="title mb-1">Quick Actions</span>
                      <span class="subtitle op-7">Shortcuts</span>
                    </div>
                    <div class="quick-actions-scroll scrollbar-outer">
                      <div class="quick-actions-items">
                        <div class="row m-0">
                          <a class="col-6 col-md-4 p-0" href="#">
                            <div class="quick-actions-item">
                              <div class="avatar-item bg-danger rounded-circle">
                                <i class="far fa-calendar-alt"></i>
                              </div>
                              <span class="text">Calendar</span>
                            </div>
                          </a>
                          <a class="col-6 col-md-4 p-0" href="#">
                            <div class="quick-actions-item">
                              <div
                                class="avatar-item bg-warning rounded-circle"
                              >
                                <i class="fas fa-map"></i>
                              </div>
                              <span class="text">Maps</span>
                            </div>
                          </a>
                          <a class="col-6 col-md-4 p-0" href="#">
                            <div class="quick-actions-item">
                              <div class="avatar-item bg-info rounded-circle">
                                <i class="fas fa-file-excel"></i>
                              </div>
                              <span class="text">Reports</span>
                            </div>
                          </a>
                          <a class="col-6 col-md-4 p-0" href="#">
                            <div class="quick-actions-item">
                              <div
                                class="avatar-item bg-success rounded-circle"
                              >
                                <i class="fas fa-envelope"></i>
                              </div>
                              <span class="text">Emails</span>
                            </div>
                          </a>
                          <a class="col-6 col-md-4 p-0" href="#">
                            <div class="quick-actions-item">
                              <div
                                class="avatar-item bg-primary rounded-circle"
                              >
                                <i class="fas fa-file-invoice-dollar"></i>
                              </div>
                              <span class="text">Invoice</span>
                            </div>
                          </a>
                          <a class="col-6 col-md-4 p-0" href="#">
                            <div class="quick-actions-item">
                              <div
                                class="avatar-item bg-secondary rounded-circle"
                              >
                                <i class="fas fa-credit-card"></i>
                              </div>
                              <span class="text">Payments</span>
                            </div>
                          </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </li>

                <li class="nav-item topbar-user dropdown hidden-caret">
                  <a
                    class="dropdown-toggle profile-pic"
                    data-bs-toggle="dropdown"
                    href="#"
                    aria-expanded="false"
                  >
                    <div class="avatar-sm">
                      <img
                        src="aset/img.jpg"
                        alt="..."
                        class="avatar-img rounded-circle"
                      />
                    </div>
                    <span class="profile-username">
                      <span class="op-7">Hi,</span>
                      <span class="fw-bold">MEET&nbsp;PATEL</span>
                    </span>
                  </a>
                  <ul class="dropdown-menu dropdown-user animated fadeIn" >
                    <div class="dropdown-user-scroll scrollbar-outer">
                      <li>
                        <div class="user-box" >
                          <div class="avatar-lg">
                            <img
                              src="aset/img.jpg"
                              alt="image profile"
                              class="avatar-img rounded"
                            />
                          </div>
                          <div class="u-text">
                            <h4>Meet&nbsp;Patel</h4>
                            <p class="text-muted">meetpatel96645@gmail.com</p>
                            <a
                              href="#"
                              class="btn btn-xs btn-secondary btn-sm"
                              >View Profile</a
                            >
                          </div>
                        </div>
                      </li>
                      <li>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">My Profile</a>
                        <a class="dropdown-item" href="#">My Balance</a>
                        <a class="dropdown-item" href="#">Inbox</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Account Setting</a>
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

   
   
   <!-- container  -->
    <div class="container">
     <main id="main" class="main"></main>
        <div class="pagetitle animate__animated animate__fadeIn">
            <h1>Edit ${user.eventType } Event</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="admindashboard">Home</a></li>    
                    <li class="breadcrumb-item active"><a href="businessevents">All Event</a></li>
                    <li class="breadcrumb-item active"><a href="#">Edit Event</a></li>
                </ol>
            </nav>
        </div><!-- End Page Title -->

        <section class="section dashboard">
            <div class="form-container">
                <form action="updateevent" method="post" enctype="multipart/form-data">
                    <div class="event-type">
                        <label>Event Type:</label>
                        <select name="eventType" id="eventTypeDropdown" onchange="filterEvents()">
                  <option value="all">All Event Types</option>        
                <c:forEach items="${allevent}" var="s">
                   <option value="${s.eventType}">${s.eventType}</option>     
                </c:forEach> 
             </select>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-field">
                            <label>Title:</label>
                            <input type="text" name="title" placeholder="Enter event title" value=${user.title }>
                        </div>
                        <div class="form-field">
                            <label>Keynote:</label>
                            <input type="text" name="keynote" placeholder="Enter keynote speaker" value=${user.keynote } >
                        </div>
                    </div>
                    
                <div class="form-group">
                <label>Photo:</label>
                
                <!-- File upload input -->
                  <input type="file" name="profilePic" id="imageUploadInput" 
                   accept="image/*" onchange="showImagePreview(this)">
                   
                <!-- Current image display (if exists) -->
                   <c:if test="${not empty user.profilePicPath}">
                        <img src="${user.profilePicPath}" id="currentImage" 
                         style="max-width: 300px; max-height: 200px; border-radius: 5px; display: block; margin-bottom: 10px;">
                   </c:if>
    
                <!-- Preview container for new upload -->
                   <div id="imagePreview" style="margin-top: 10px;"></div>
                </div>

                    <div class="form-group">
                        <label>Date:</label>
                        <input type="date" name="date" value=${user.date }  >
                    </div>
                    
                    <div class="form-group">
                        <label>Event Time:</label>
                        <div class="time-fields">
                            <div class="time-field">
                                <label>Start Time:</label>
                                <input type="time" name="stime" value=${user.stime } >
                            </div>
                            <div class="time-field">
                                <label>End Time:</label>
                                <input type="time" name="etime" value=${user.etime }>
                            </div>
                        </div>
                    </div>
                    
                     <div class="form-row">
                        <div class="form-field">
                         <label>State:</label>
                             State Name:<select name="state">
                               <option>Select State</option> 
       
                           <c:forEach items="${allstate }" var="s">
                               <option value="${s.staName }">${s.staName }</option>
                           </c:forEach> 
                           </select>                       
                        </div>
                        </div>
                        
                         <div class="form-row">
                        <div class="form-field">
                           <label>City:</label>
                             City Name:<select name="city">
                               <option>Select City</option> 
       
                           <c:forEach items="${allcity }" var="s">
                               <option value="${s.cityName }">${s.cityName }</option>
                           </c:forEach> 
                           </select>
                        </div>
                        </div>
                    
                    <div class="form-group">
                        <label>Name:</label>
                        <input type="text" name="name" placeholder="Enter organizer name" value=${user.name }  >
                    </div>
                    
                    <div class="form-group">
                        <label>Address:</label>
                        <input type="text" name="address" placeholder="Enter address" value=${user.address }>
                    </div>
                    
                    
                        <input type="hidden" name="createeventId" placeholder="Enter address" value=${user.createeventId } >
                    
                    
                    <div class="btn-group">
                        <input type="submit" value="Save Event" class="btn btn-primary">
                        <a href="businessevents" class="btn btn-secondary">Back</a>
                    </div>
                </form>
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
function showImagePreview(input) {
    const previewDiv = document.getElementById('imagePreview');
    const currentImage = document.getElementById('currentImage');
    
    // Hide the old image if exists
    if (currentImage) {
        currentImage.style.display = 'none';
    }
    
    // Clear any previous preview
    previewDiv.innerHTML = '';
    
    if (input.files && input.files[0]) {
        const reader = new FileReader();
        
        reader.onload = function(e) {
            // Create and display the new preview image
            const newPreview = document.createElement('img');
            newPreview.src = e.target.result;
            newPreview.alt = "New Photo Preview";
            newPreview.style.maxWidth = '300px';
            newPreview.style.maxHeight = '200px';
            newPreview.style.borderRadius = '5px';
            
            previewDiv.appendChild(newPreview);
        }
        
        reader.readAsDataURL(input.files[0]);
    }
}
</script>

<script>
function updateImagePreview() {
    const imageUrl = document.getElementById('imageUrlInput').value;
    const previewDiv = document.getElementById('imagePreview');
    
    if (imageUrl) {
        previewDiv.innerHTML = `<img src="${imageUrl}" alt="Event Photo Preview" 
                               style="max-width: 300px; max-height: 200px; border-radius: 5px;">`;
    } else {
        previewDiv.innerHTML = '';
    }
}
</script>
  
  
</body>
</html>
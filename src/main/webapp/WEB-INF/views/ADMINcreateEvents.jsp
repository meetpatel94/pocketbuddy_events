<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Event</title>

<!-- CSS Files -->
<link rel="stylesheet" href="aset/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="aset/assets/css/plugins.min.css" />
<link rel="stylesheet" href="aset/assets/css/kaiadmin.min.css" />

<!-- CSS Just for demo purpose, don't include it in your project -->
<link rel="stylesheet" href="aset/assets/css/demo.css" />
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

/* Loader Styles */
.event-loader-container {
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

.event-loader-text {
  margin-bottom: 20px;
  font-size: 18px;
  color: #514b82;
  font-weight: bold;
}

.event-spinner-loader {
  width: 40px;
  aspect-ratio: 1;
  position: relative;
  transform: rotate(45deg);
}

.event-spinner-loader:before,
.event-spinner-loader:after {
  content: "";
  position: absolute;
  inset: 0;
  border-radius: 50% 50% 0 50%;
  background: #514b82;
  -webkit-mask: radial-gradient(circle 10px at 50% 50%,#0000 94%,#000);
}

.event-spinner-loader:after {
  animation: event-spin-animation 1s infinite;
  transform: perspective(300px) translateZ(0px)
}

@keyframes event-spin-animation {
  to {transform: perspective(300px) translateZ(150px);opacity:0}
}
</style>
</head>
<body>
   <!-- Loader -->
   <div class="event-loader-container">
     <div class="event-loader-text">Processing To Create Event...</div>
     <div class="event-spinner-loader"></div>
   </div>
   
   <!-- sidebar -->
   <div class="wrapper">
   <jsp:include page="ADMIN_Sidebar.jsp"></jsp:include>
   
   <!-- header -->
   <jsp:include page="ADMIN_Header.jsp"></jsp:include>

   <!-- container  -->
    <div class="container">
     <main id="main" class="main"></main>
        <div class="pagetitle animate__animated animate__fadeIn">
            <h1>Create Event</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="admindashboard">Home</a></li>
                    <li class="breadcrumb-item"><a href="businessevents">All Events</a></li>
                    <li class="breadcrumb-item active">Create Event</li>
                </ol>
            </nav>
        </div><!-- End Page Title -->

        <section class="section dashboard">
            <div class="form-container">
                <form action="savebusinessevent" method="post" enctype="multipart/form-data" onsubmit="showEventLoader()">
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
                            <input type="text" name="title" placeholder="Enter event title" required>
                        </div>
                        <div class="form-field">
                            <label>Keynote:</label>
                            <input type="text" name="keynote" placeholder="Enter keynote speaker" >
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label>Event Image:</label>
                        <input type="file" name="profilePic" id="imageUpload"  >
                        <img id="imagePreview" class="image-preview" src="#" alt="Preview" />
                    </div>
                    
                    <div class="form-group">
                        <label>Date:</label>
                        <input type="date" name="date" >
                    </div>
                    
                    <div class="form-group">
                        <label>Event Time:</label>
                        <div class="time-fields">
                            <div class="time-field">
                                <label>Start Time:</label>
                                <input type="time" name="stime" >
                            </div>
                            <div class="time-field">
                                <label>End Time:</label>
                                <input type="time" name="etime" >
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
                        <div class="form-field">
                            <label>Description:</label>
                            <input type="text" name="description" placeholder="Enter description" >
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label>Name:</label>
                        <input type="text" name="name" placeholder="Enter organizer name" >
                    </div>
                    
                    <div class="form-group">
                        <label>Address:</label>
                        <input type="text" name="address" placeholder="Enter address" >
                    </div>
                    
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
    // Image preview functionality
    document.getElementById('imageUpload').addEventListener('change', function(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                const preview = document.getElementById('imagePreview');
                preview.src = e.target.result;
                preview.style.display = 'block';
            }
            reader.readAsDataURL(file);
        }
    });
    
    // Show loader when form is submitted
    function showEventLoader() {
        document.querySelector('.event-loader-container').style.display = 'flex';
    }
    
    // Hide loader when page is fully loaded
    window.addEventListener('load', function() {
        document.querySelector('.event-loader-container').style.display = 'none';
    });
    </script>
</body>
</html>
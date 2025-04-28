<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pocketbuddy-AdminDashboard</title>
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
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
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

main {
  margin-left: 20px;
}

.user-box .u-text {
  padding: 0 5px;
}

/* Events Container */
.events-container {
  font-family: 'Public Sans', sans-serif;
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
}

.section-header {
  margin-bottom: 30px;
  text-align: center;
}

.section-header h2 {
  color: var(--primary-color);
  font-size: 28px;
  font-weight: 600;
  margin-bottom: 20px;
}

/* Filter Controls */
.filter-controls {
  display: flex;
  justify-content: center;
  gap: 20px;
  margin-bottom: 30px;
  flex-wrap: wrap;
}

.filter-controls select {
  padding: 10px 15px;
  border-radius: 8px;
  border: 1px solid var(--border-color);
  font-size: 16px;
  background-color: white;
  cursor: pointer;
  min-width: 200px;
  transition: all 0.3s ease;
  color: var(--text-color);
}

.filter-controls select:focus {
  outline: none;
  border-color: var(--primary-color);
  box-shadow: 0 0 0 2px rgba(67, 46, 84, 0.2);
}

.crt-btn {
  padding: 10px 20px;
  background-color: var(--primary-color);
  color: white;
  border: none;
  border-radius: 8px;
  font-size: 16px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.crt-btn:hover {
  background-color: var(--primary-light);
  transform: translateY(-2px);
}

/* Events Cards Grid */
.events-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 25px;
  margin-top: 20px;
  width: 100%;
}

.event-card {
  display: flex;
  flex-direction: column;
  height: 100%;
  background: white;
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 4px 20px rgba(0,0,0,0.08);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.event-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 8px 25px rgba(0,0,0,0.12);
}

.event-card-header {
  height: 160px;
  background-size: cover;
  background-position: center;
  position: relative;
}

.event-card-header::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  height: 60px;
  background: linear-gradient(to bottom, transparent 0%, rgba(0,0,0,0.7) 100%);
}

.event-card-type {
  position: absolute;
  top: 15px;
  right: 15px;
  background: rgba(255,255,255,0.9);
  padding: 4px 10px;
  border-radius: 20px;
  font-size: 12px;
  font-weight: 600;
  text-transform: uppercase;
}

.event-card-city {
  position: absolute;
  bottom: 15px;
  left: 15px;
  color: white;
  font-weight: 600;
  font-size: 14px;
  z-index: 1;
}

.event-card-state {
  position: absolute;
  bottom: 40px;
  left: 15px;
  color: white;
  font-weight: 600;
  font-size: 14px;
  z-index: 1;
}

.event-card-date {
  position: absolute;
  bottom: 15px;
  right: 15px;
  color: white;
  font-weight: 600;
  font-size: 14px;
  z-index: 1;
}

.event-card-body {
  flex: 1;
  padding: 20px;
}

.event-card-title {
  font-size: 18px;
  font-weight: 600;
  margin-bottom: 10px;
  color: var(--text-color);
  line-height: 1.3;
}

.event-card-venue {
  font-size: 14px;
  color: #666;
  margin-bottom: 15px;
  display: flex;
  align-items: center;
}

.event-card-venue i {
  margin-right: 8px;
  color: var(--primary-color);
}

.event-card-footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 20px 20px;
}

.btn-details {
  padding: 8px 15px;
  background-color: var(--primary-color);
  color: white;
  border: none;
  border-radius: 6px;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.3s ease;
  font-size: 14px;
}

.btn-details:hover {
  background-color: var(--primary-light);
  transform: translateY(-2px);
}

.btn-cancel {
  padding: 8px 15px;
  background-color: #f1f1f1;
  color: #666;
  border: none;
  border-radius: 6px;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.3s ease;
  font-size: 14px;
}

.btn-cancel:hover {
  background-color: #e0e0e0;
}

.btn-undo {
  padding: 8px 15px;
  background-color: #28a745;
  color: white;
  border: none;
  border-radius: 6px;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.3s ease;
  font-size: 14px;
  display: none;
}

.btn-undo:hover {
  background-color: #218838;
}

.btn-delete {
  padding: 8px 15px;
  background-color: #dc3545;
  color: white;
  border: none;
  border-radius: 6px;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.3s ease;
  font-size: 14px;
  display: none;
}

.btn-delete:hover {
  background-color: #bb2d3b;
}

.event-card.cancelled {
  opacity: 0.6;
  box-shadow: none;
  border: 1px solid #dc3545;
}

.event-card.cancelled .btn-cancel {
  display: none;
}

.event-card.cancelled .btn-undo,
.event-card.cancelled .btn-delete {
  display: inline-block;
}

/* Event type colors */
.music-card .event-card-type {
  background: #6C5CE7;
  color: white;
}

.concert-card .event-card-type {
  background: #00B894;
  color: white;
}

.dance-card .event-card-type {
  background: #FD79A8;
  color: white;
}

.business-card .event-card-type {
  background: #FDCB6E;
  color: #333;
}

/* No events message */
.no-events {
  text-align: center;
  padding: 50px;
  color: #666;
  font-style: italic;
  grid-column: 1 / -1;
}

/* Modal styles */
.modal-body img {
  max-height: 250px;
  width: 100%;
  object-fit: cover;
  border-radius: 8px;
}

.event-details p {
  margin-bottom: 10px;
}

.event-details i {
  margin-right: 8px;
  color: var(--primary-color);
}

/* Responsive adjustments */
@media (max-width: 768px) {
  .filter-controls {
    flex-direction: column;
    align-items: center;
    gap: 10px;
  }
  
  .events-grid {
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
  }
  
  .modal-body .row {
    flex-direction: column;
  }
  
  .modal-body .col-md-5 {
    margin-bottom: 20px;
  }
  
  .event-card-footer {
    flex-wrap: wrap;
    gap: 10px;
  }
  
  .event-card-footer button {
    width: 100%;
  }
}

@media (max-width: 480px) {
  .event-card-header {
    height: 140px;
  }
}
.btn-edit {
    padding: 8px 15px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 6px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.3s ease;
    font-size: 14px;
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    gap: 5px;
}

.btn-edit:hover {
    background-color: #0069d9;
    color: white;
    transform: translateY(-2px);
}

.btn-edit i {
    font-size: 14px;
}

.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0,0,0,0.5);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 1000;
  opacity: 0;
  visibility: hidden;
  transition: all 0.3s ease;
}

.modal-overlay.active {
  opacity: 1;
  visibility: visible;
}

.modal-content {
  background-color: white;
  border-radius: 10px;
  width: 80%;
  max-width: 800px;
  max-height: 75vh;
  overflow-y: auto;
  box-shadow: 0 5px 15px rgba(0,0,0,0.3);
  transform: translateY(-20px);
  transition: all 0.3s ease;
}

.modal-overlay.active .modal-content {
  transform: translateY(0);
}

.modal-header {
  padding: 20px;
  background: var(--primary-color);
  color: white;
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
}

.modal-header h3 {
  margin: 0;
  font-size: 22px;
}

.close-btn {
  background: none;
  border: none;
  color: white;
  font-size: 28px;
  cursor: pointer;
  padding: 0 10px;
  line-height: 1;
}

.modal-body {
  padding: 20px;
}

.modal-image-container {
  margin-bottom: 20px;
}

.modal-image-container img {
  width: 50%;
  max-height: 207px;
  object-fit: cover;
  border-radius: 8px;
}

.event-details p {
  margin-bottom: 10px;
  display: flex;
  align-items: center;
}

.event-details i {
  margin-right: 10px;
  color: var(--primary-color);
  width: 20px;
  text-align: center;
}

.modal-footer {
  padding: 15px 20px;
  display: flex;
  justify-content: flex-end;
  gap: 10px;
  border-top: 1px solid #eee;
}

/* Responsive adjustments for modal */
@media (max-width: 768px) {
  .modal-content {
    width: 90%;
  }
  
  .modal-body {
    padding: 15px;
  }
}

@media (max-width: 480px) {
  .modal-content {
    width: 95%;
    max-height: 95vh;
  }
  
  .modal-footer {
    flex-direction: column;
  }
  
  .modal-footer button {
    width: 100%;
  }
}
.modal-content {
    margin-top: 99px !important;
    margin-left: 222px !important;
    margine-bottom: 10px;
}

/* State Modal Styles */
.state-modal-content {
  max-width: 500px;
  width: 90%;
}

.state-form-group {
  margin-bottom: 20px;
}

.state-form-group label {
  display: block;
  margin-bottom: 8px;
  font-weight: 500;
}

.state-form-group select {
  width: 100%;
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 16px;
}

.state-modal-footer {
  display: flex;
  justify-content: flex-end;
  gap: 10px;
  margin-top: 20px;
}

.state-submit-btn {
  padding: 10px 20px;
  background-color: var(--primary-color);
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.state-submit-btn:hover {
  background-color: var(--primary-light);
}

.state-cancel-btn {
  padding: 10px 20px;
  background-color: #f1f1f1;
  color: #333;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.state-cancel-btn:hover {
  background-color: #e0e0e0;
}
.state-submit-btn{
  position: fixed;
  top: 132px;
  right: 28px;
}
.state-form-group select {
    padding: 17px !important;
}
</style>

</head>
<body>
   
   <!-- Previous HTML content remains the same until the events grid -->
     <!-- sidebar -->
   <div class="wrapper">
   <jsp:include page="ADMIN_Sidebar.jsp"></jsp:include>
   
   <!-- header -->
   <jsp:include page="ADMIN_Header.jsp"></jsp:include>
   
    <!-- container  -->
   <div class="container">
   <div class="events-container">
   <div class="container wow fadeInUp">
        <div class="section-header">
          <h2>Event Management Dashboard</h2>
          <div class="filter-controls">
              
              <select name="eventType" id="eventTypeDropdown" onchange="filterEvents()">
                  <option value="all">All Event Types</option>        
                <c:forEach items="${allevent}" var="s">
                   <option value="${s.eventType}" style="text-transform: capitalize;">${s.eventType}</option>     
                </c:forEach> 
             </select>        
                      
                      
                      
              <select name="staName" id="stateFilter" onchange="filterEvents()">
                  <option value="all">All States</option>        
                <c:forEach items="${allstate}" var="s">
                   <option value="${s.staName}">${s.staName}</option>     
                </c:forEach> 
             </select>  
                  
             <select name="cityName" id="cityFilter" onchange="filterEvents()">
                  <option value="all">All Cities</option>        
                <c:forEach items="${allcity}" var="c">
                  <option value="${c.cityName}">${c.cityName}</option>             
                </c:forEach> 
             </select>                       
             
              <button class="crt-btn" onclick="showStateModal()">Create+</button>
          </div>
        </div>
        
    <!-- Events Cards Grid -->
    <div class="events-grid" id="eventsGrid">
        <c:forEach items="${newevent}" var="n">
            <div class="event-card ${n.eventType}-card" 
                 data-type="${n.eventType.toLowerCase()}"
                 data-state="${n.state}"
                 data-city="${n.city}">
                <div class="event-card-header" style="background-image: url('${n.profilePicPath}')">
                    <span class="event-card-type">${n.eventType}</span>
                    <span class="event-card-state">${n.state}</span>
                    <span class="event-card-city">${n.city}</span>
                    <span class="event-card-date">${n.date}</span>
                </div>
                <div class="event-card-body">
                    <h3 class="event-card-title">${n.title}</h3>
                    <div class="event-card-venue">
                        <i class="bi bi-geo-alt"></i>${n.address}
                    </div>
                </div>
                <div class="event-card-footer">
                    <a href="editevent?createeventId=${n.createeventId}"  id="btnFirst" class="btn-edit">
                        <i class="bi bi-pencil-square"></i> Edit
                    </a>
                    <button class="btn-details"  id="btnTwo"
                            onclick="showEventDetails({
                                title: '${n.title}',
                                date: '${n.date}',
                                venue: '${n.address}',
                                city: '${n.city}',
                                state: '${n.state}',
                                type: '${n.eventType}',
                                image: '${n.profilePicPath}'
                            })">
                        View Details
                    </button>
                    <button class="btn-cancel" onclick="cancelEvent(this)">Cancel Event</button>
                    <a href="deleteevent?createeventId=${n.createeventId}" class="btn-delete"><i class="bi bi-trash"></i> Delete</a>
                    <button class="btn-undo" onclick="undoCancel(this)"><i class="bi bi-arrow-counterclockwise"></i> Undo</button>
                    
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</div>

<!-- Event Details Modal -->
<div class="modal-overlay" id="eventModal">
  <div class="modal-content">
    <div class="modal-header">
      <h3 id="modalTitle">Event Details</h3>
      <button class="close-btn" onclick="closeModal()">&times;</button>
    </div>
    <div class="modal-body">
      <div class="modal-image-container">
        <img id="modalImage" src="" alt="Event Image" class="img-fluid">
      </div>
      <div class="event-details">
        <p><i class="bi bi-calendar-event"></i> <strong>Date:&nbsp; </strong> <span id="modalDate"></span></p>
        <p><i class="bi bi-geo-alt"></i> <strong>Venue: </strong> <span id="modalVenue"></span></p>
        <p><i class="bi bi-building"></i> <strong>City: </strong> <span id="modalCity"></span></p>
        <p><i class="bi bi-tag"></i> <strong>Type: </strong> <span id="modalType"></span></p>
        <p><i class="bi bi-people"></i> <strong>Attendees: </strong> <span id="modalAttendees"></span></p>
        <p><i class="bi bi-cash"></i> <strong>Price: </strong> <span id="modalPrice"></span></p>
        <p><i class="bi bi-person"></i> <strong>Organizer: </strong> <span id="modalOrganizer"></span></p>
        <p><i class="bi bi-telephone"></i> <strong>Contact: </strong> <span id="modalContact"></span></p>
      </div>
    </div>
    <div class="modal-footer">
      <button type="button" class="btn btn-secondary" onclick="closeModal()">Close</button>
    </div>
  </div>
</div>

<!-- State Selection Modal -->
<div class="modal-overlay" id="stateModal">
  <div class="modal-content state-modal-content">
    <div class="modal-header">
      <h3>Add Your State & City</h3>
      <button class="close-btn" onclick="closeStateModal()">&times;</button>
    </div>
    <div class="modal-body">
      <form id="stateForm" action="savecity" method="post">
      
      <div class="state-form-group">
          <label for="stateSelect">Select State</label>
         <select name="stateId" id="stateSelect" class="form-control">
                  <option value="">Select State</option>        
                <c:forEach items="${allstate}" var="s">
                   <option value="${s.staId}">${s.staName}</option>
                </c:forEach> 
             </select>
        </div>
        
         <div class="state-form-group">
          <label for="citySelect">Enter City Name:</label>
          <input type="text" name="cityName" id="citySelect" class="form-control">
          <span><a href="viewcities" class="state-submit-btn" style="background-color:blue; color:white;">View Cities</a></span>
        </div>
        <div class="state-modal-footer">
          <button type="button" class="state-cancel-btn" onclick="closeStateModal()">Cancel</button>
          <button type="submit" class="state-submit-btn">Continue</button>
          <a href="newsta" class="state-submit-btn" style="background-color:red; color:white;">Manage State</a>
        </div>
      </form>
    </div>
  </div>
</div>

    <!-- footer -->
   <jsp:include page="ADMIN_Footer.jsp"></jsp:include>
   </div>
    
   </div>
          
    <!-- JS -->
   <jsp:include page="ADMIN_Js.jsp"></jsp:include>
   <script>
   document.addEventListener('DOMContentLoaded', function() {
       filterEvents();
       
       // Close modal when clicking outside content
       document.getElementById('eventModal').addEventListener('click', function(e) {
           if (e.target === this) {
               closeModal();
           }
       });
       
       document.getElementById('stateModal').addEventListener('click', function(e) {
           if (e.target === this) {
               closeStateModal();
           }
       });
       
       // Close modal with Escape key
       document.addEventListener('keydown', function(e) {
           if (e.key === 'Escape') {
               closeModal();
               closeStateModal();
           }
       });
   });

   function filterEvents() {
       const eventType = document.getElementById('eventTypeDropdown').value;
       const stateId = document.getElementById('stateFilter').value;
       const cityId = document.getElementById('cityFilter').value;
       
       const cards = document.querySelectorAll('.event-card');
       let hasVisibleCards = false;

       cards.forEach(card => {
           const cardType = card.getAttribute('data-type');
           const cardState = card.getAttribute('data-state');
           const cardCity = card.getAttribute('data-city');
           
           // Get the actual state and city names for comparison
           const stateSelect = document.getElementById('stateFilter');
           const citySelect = document.getElementById('cityFilter');
           const selectedState = stateId === 'all' ? 'all' : stateSelect.options[stateSelect.selectedIndex].text;
           const selectedCity = cityId === 'all' ? 'all' : citySelect.options[citySelect.selectedIndex].text;

           const isEventTypeMatch = eventType === 'all' || eventType === cardType;
           const isStateMatch = stateId === 'all' || selectedState === cardState;
           const isCityMatch = cityId === 'all' || selectedCity === cardCity;

           if (isEventTypeMatch && isStateMatch && isCityMatch) {
               card.style.display = 'block';
               hasVisibleCards = true;
           } else {
               card.style.display = 'none';
           }
       });

       const noEventsMsg = document.getElementById('no-events-msg');
       if (!hasVisibleCards) {
           if (!noEventsMsg) {
               const msg = document.createElement('div');
               msg.id = 'no-events-msg';
               msg.className = 'no-events';
               msg.textContent = 'No events found matching your criteria';
               document.getElementById('eventsGrid').appendChild(msg);
           }
       } else if (noEventsMsg) {
           noEventsMsg.remove();
       }
   }

   function showEventDetails(eventData) {
       // Generate random details for demo purposes
       const attendees = Math.floor(Math.random() * 500) + 50;
       const price = "₹" + (Math.floor(Math.random() * 20) + 5) + "00";
       const contact = "+91 " + Math.floor(1000000000 + Math.random() * 9000000000);
       
       let organizer = "";
       let description = "";
       
       switch(eventData.type.toLowerCase()) {
           case 'music':
               organizer = "Gujarat Music Society";
               description = "Experience an enchanting evening of classical and contemporary music performances.";
               break;
           case 'concerts':
               organizer = "Live Nation India";
               description = "A high-energy concert featuring popular bands and solo artists.";
               break;
           case 'dance':
               organizer = "Nritya Shakti Foundation";
               description = "A spectacular showcase of dance forms from traditional to contemporary.";
               break;
           case 'business':
               organizer = "Gujarat Chamber of Commerce";
               description = "A premier networking and knowledge-sharing event for business professionals.";
               break;
           default:
               organizer = "Local Event Organizers";
               description = "An exciting event featuring various activities and performances.";
       }

       // Set modal content
       document.getElementById('modalTitle').textContent = eventData.title;
       document.getElementById('modalImage').src = eventData.image;
       document.getElementById('modalDate').textContent = eventData.date;
       document.getElementById('modalVenue').textContent = eventData.venue.replace('<i class="bi bi-geo-alt"></i> ', '');
       document.getElementById('modalCity').textContent = eventData.city;
       document.getElementById('modalType').textContent = eventData.type.charAt(0).toUpperCase() + eventData.type.slice(1);
       document.getElementById('modalAttendees').textContent = attendees;
       document.getElementById('modalPrice').textContent = price;
       document.getElementById('modalOrganizer').textContent = organizer;
       document.getElementById('modalContact').textContent = contact;
       
       // Show modal with animation
       document.getElementById('eventModal').classList.add('active');
       document.body.style.overflow = 'hidden';
   }

   function closeModal() {
       document.getElementById('eventModal').classList.remove('active');
       document.body.style.overflow = 'auto';
   }
   
   function showStateModal() {
       document.getElementById('stateModal').classList.add('active');
       document.body.style.overflow = 'hidden';
   }
   
   function closeStateModal() {
       document.getElementById('stateModal').classList.remove('active');
       document.body.style.overflow = 'auto';
   }
    
   //const btnFirst = document.getElementById('btnFirst');
   //const btnTwo = document.getElementById('btnTwo');
   
   function cancelEvent(button) {
       const card = button.closest('.event-card');
       card.classList.add('cancelled');
       btnFirst.style.display = 'none';
       btnTwo.style.display = 'none';
   }

   function undoCancel(button) {
       const card = button.closest('.event-card');
       card.classList.remove('cancelled');
       btnFirst.style.display = 'block';
       btnTwo.style.display = 'block'; 
   }
   </script>

</body>
</html>
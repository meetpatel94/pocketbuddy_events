<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

.btn-remove {
  padding: 8px 15px;
  background-color: #dc3545;
  color: white;
  border: none;
  border-radius: 6px;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.3s ease;
  font-size: 14px;
}

.btn-remove:hover {
  background-color: #bb2d3b;
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
}

@media (max-width: 480px) {
  .event-card-header {
    height: 140px;
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
   <div class="events-container">
   <div class="container wow fadeInUp">
        <div class="section-header">
          <h2>Event Management Dashboard</h2>
          <div class="filter-controls">
              <select id="eventTypeDropdown" onchange="filterEvents()">
                  <option value="all">All Event Types</option>
                  <option value="music">Music</option>
                  <option value="concerts">Concerts</option>
                  <option value="dance">Dance</option>
                  <option value="business">Business</option>
              </select>
              <select id="cityDropdown" onchange="filterEvents()">
                  <option value="all">All Cities</option>
                  <option value="ahmedabad">Ahmedabad</option>
                  <option value="surat">Surat</option>
                  <option value="gandhinagar">Gandhinagar</option>
                  <option value="vadodara">Vadodara</option>
                  <option value="navsari">Navsari</option>
                  <option value="others">Other Cities</option>
              </select>
              <a href="createevents"><button class="crt-btn">Create+</button></a>
          </div>
        </div>
    
    <!-- Events Cards Grid -->
    <div class="events-grid" id="eventsGrid">
        <c:forEach items="${newevent}" var="n">
            <div class="event-card ${n.eventType}-card" data-city="${n.city}" data-type="${n.eventType.toLowerCase()}">
                <div class="event-card-header" style="background-image: url('https://source.unsplash.com/random/600x400/?concert')">
                    <span class="event-card-type">${n.eventType}</span>
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
                    <button class="btn-details">View Details</button>
                    <button class="btn-cancel" onclick="cancelEvent(this)">Cancel</button>
                </div>
            </div>
        </c:forEach>
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
       document.querySelectorAll('.btn-details').forEach(btn => {
           btn.addEventListener('click', function() {
               const card = this.closest('.event-card');
               showEventDetails(card);
           });
       });
   });

   function cancelEvent(button) {
       const card = button.closest('.event-card');
       if (button.textContent === 'Cancel') {
           button.textContent = 'Undo';
           button.classList.remove('btn-cancel');
           button.classList.add('btn-details');
           card.style.opacity = '0.6';
           card.style.boxShadow = 'none';
       } else {
           button.textContent = 'Cancel';
           button.classList.remove('btn-details');
           button.classList.add('btn-cancel');
           card.style.opacity = '1';
           card.style.boxShadow = '0 4px 20px rgba(0,0,0,0.08)';
       }
   }

   function filterEvents() {
       const eventType = document.getElementById('eventTypeDropdown').value;
       const city = document.getElementById('cityDropdown').value;
       const cards = document.querySelectorAll('.event-card');
       let hasVisibleCards = false;

       cards.forEach(card => {
           const cardCity = card.getAttribute('data-city').toLowerCase();
           const cardType = card.getAttribute('data-type').toLowerCase();

           const isEventTypeMatch = eventType === 'all' || eventType === cardType;
           const isCityMatch = city === 'all' || 
                               (city === 'others' && !['ahmedabad','surat','gandhinagar','vadodara','navsari'].includes(cardCity)) || 
                               city === cardCity;

           if (isEventTypeMatch && isCityMatch) {
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

   function showEventDetails(card) {
       const title = card.querySelector('.event-card-title').textContent;
       const date = card.querySelector('.event-card-date').textContent;
       const venue = card.querySelector('.event-card-venue').textContent;
       const city = card.getAttribute('data-city');
       const type = card.getAttribute('data-type');
       const image = card.querySelector('.event-card-header').style.backgroundImage.replace('url("','').replace('")','');

       let description = "";
       let organizer = "";
       let attendees = Math.floor(Math.random() * 500) + 50;
       let price = "";
       let contact = "+91 " + Math.floor(1000000000 + Math.random() * 9000000000);

       switch(type) {
           case 'music':
               description = "Experience an enchanting evening of classical and contemporary music performances.";
               organizer = "Gujarat Music Society";
               price = "₹" + (Math.floor(Math.random() * 15) + 5) + "00";
               break;
           case 'concerts':
               description = "A high-energy concert featuring popular bands and solo artists.";
               organizer = "Live Nation India";
               price = "₹" + (Math.floor(Math.random() * 20) + 10) + "00";
               break;
           case 'dance':
               description = "A spectacular showcase of dance forms from traditional to contemporary.";
               organizer = "Nritya Shakti Foundation";
               price = "₹" + (Math.floor(Math.random() * 10) + 3) + "00";
               break;
           case 'business':
               description = "A premier networking and knowledge-sharing event for business professionals.";
               organizer = "Gujarat Chamber of Commerce";
               price = "₹" + (Math.floor(Math.random() * 30) + 15) + "00";
               break;
           default:
               description = "An exciting event featuring various activities and performances.";
               organizer = "Local Event Organizers";
               price = "₹" + (Math.floor(Math.random() * 10) + 5) + "00";
       }

       const modalHTML = `
       <div class="modal fade" id="eventDetailsModal" tabindex="-1" aria-hidden="true">
           <div class="modal-dialog modal-dialog-centered modal-lg">
               <div class="modal-content">
                   <div class="modal-header" style="background: var(--primary-color); color: white;">
                       <h5 class="modal-title">Event Details</h5>
                       <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                   </div>
                   <div class="modal-body">
                       <div class="row">
                           <div class="col-md-5">
                               <img src="${image}" class="img-fluid rounded mb-3" alt="Event Image">
                               <div class="d-flex justify-content-between mt-2">
                                   <span><i class="bi bi-people"></i> ${attendees} Attendees</span>
                                   <span><i class="bi bi-cash"></i> ${price}</span>
                               </div>
                           </div>
                           <div class="col-md-7">
                               <h3>${title}</h3>
                               <p class="text-muted">${description}</p>
                               <hr>
                               <div class="event-details">
                                   <p><i class="bi bi-calendar-event"></i> <strong>Date:</strong> ${date}</p>
                                   <p><i class="bi bi-geo-alt"></i> <strong>Venue:</strong> ${venue.replace('<i class="bi bi-geo-alt"></i> ', '')}</p>
                                   <p><i class="bi bi-building"></i> <strong>City:</strong> ${city.charAt(0).toUpperCase() + city.slice(1)}</p>
                                   <p><i class="bi bi-tag"></i> <strong>Type:</strong> ${type.charAt(0).toUpperCase() + type.slice(1)}</p>
                                   <p><i class="bi bi-person"></i> <strong>Organizer:</strong> ${organizer}</p>
                                   <p><i class="bi bi-telephone"></i> <strong>Contact:</strong> ${contact}</p>
                               </div>
                           </div>
                       </div>
                   </div>
                   <div class="modal-footer">
                       <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                       <button type="button" class="btn btn-primary">Edit Event</button>
                       <button type="button" class="btn btn-danger btn-remove" onclick="removeEvent('${title}')">Remove Event</button>
                   </div>
               </div>
           </div>
       </div>`;
       
       document.body.insertAdjacentHTML('beforeend', modalHTML);
       const modal = new bootstrap.Modal(document.getElementById('eventDetailsModal'));
       modal.show();
       document.getElementById('eventDetailsModal').addEventListener('hidden.bs.modal', function() {
           this.remove();
       });
   }

   function removeEvent(eventTitle) {
       if (confirm(`Are you sure you want to remove "${eventTitle}"? This action cannot be undone.`)) {
           alert(`"${eventTitle}" has been removed successfully.`);
           bootstrap.Modal.getInstance(document.getElementById('eventDetailsModal')).hide();
       }
   }
   </script>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

/* Hide the notification popup */
[data-notify="container"] {
  display: none !important;
  visibility: hidden !important;
  opacity: 0 !important;
  pointer-events: none !important;
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

/* Events Table */
.events-table {
  overflow-x: auto;
  box-shadow: 0 4px 20px rgba(0,0,0,0.08);
  border-radius: 12px;
  margin-top: 20px;
  background: white;
}

table {
  width: 100%;
  border-collapse: collapse;
}

th {
  background-color: var(--primary-color);
  color: white;
  padding: 15px;
  text-align: left;
  font-weight: 600;
  position: sticky;
  top: 0;
}

td {
  padding: 12px 15px;
  border-bottom: 1px solid var(--border-color);
  color: var(--text-color);
}

tr:hover {
  background-color: rgba(67, 46, 84, 0.03);
}

/* Action Buttons */
.action-btns {
  display: flex;
  gap: 10px;
}

.book-btn {
  padding: 8px 15px;
  background-color: var(--primary-color);
  color: white;
  border: none;
  border-radius: 6px;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.3s ease;
  white-space: nowrap;
}

.book-btn:hover {
  background-color: var(--primary-light);
  transform: translateY(-2px);
  box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}

/* Style for canceled events */
.canceled {
  text-decoration: line-through;
  color: #999 !important;
  background-color: rgba(255, 0, 0, 0.03);
}

.canceled-btn {
  background-color: #666 !important;
}

/* No events message */
.no-events {
  text-align: center;
  padding: 30px;
  color: #666;
  font-style: italic;
}

/* Special button for TBA venue */
td:nth-child(3):contains("to be announced") + td .book-btn {
  background-color: #666;
}

/* Responsive adjustments */
@media (max-width: 768px) {
  .filter-controls {
    flex-direction: column;
    align-items: center;
    gap: 10px;
  }
  
  th, td {
    padding: 10px 8px;
    font-size: 14px;
  }
  
  .book-btn {
    padding: 6px 10px;
    font-size: 13px;
  }
}

@media (max-width: 480px) {
  table {
    display: block;
  }
  
  th, td {
    display: block;
    width: 100%;
    box-sizing: border-box;
  }
  
  th {
    display: none;
  }
  
  tr {
    margin-bottom: 15px;
    display: block;
    border: 1px solid var(--border-color);
    border-radius: 8px;
  }
  
  td {
    border-bottom: none;
    padding: 10px;
  }
  
  td::before {
    content: attr(data-label);
    font-weight: bold;
    display: inline-block;
    width: 100px;
    color: var(--primary-color);
  }
  
  .action-btns {
    justify-content: center;
    margin-top: 10px;
  }
}

/* Initially hide all city tables except the default one */
.city-events {
  display: none;
}

.city-events.active {
  display: block;
}

/* Event type specific colors */
.music-event {
  border-left: 4px solid #6C5CE7;
}

.concert-event {
  border-left: 4px solid #00B894;
}

.dance-event {
  border-left: 4px solid #FD79A8;
}

.business-event {
  border-left: 4px solid #FDCB6E;
}

/* Others category styling */
.others-section {
  margin-top: 40px;
  border-top: 1px dashed #ccc;
  padding-top: 20px;
}

.others-section h3 {
  color: var(--primary-color);
  margin-bottom: 15px;
  text-align: center;
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
              <select id="cityDropdown" onchange="changeCity()">
                  <option value="all">All Cities</option>
                  <option value="ahmedabad">Ahmedabad</option>
                  <option value="mumbai">Mumbai</option>
                  <option value="delhi">Delhi</option>
                  <option value="bangalore">Bangalore</option>
                  <option value="hyderabad">Hyderabad</option>
                  <option value="others">Other Cities</option>
              </select>
          </div>
        </div>
    
    <!-- All Events (default view) -->
    <div id="all-events" class="city-events active">
        <div class="events-table">
            <table id="eventsTable">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Event</th>
                        <th>Venue</th>
                        <th>City</th>
                        <th>Type</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Ahmedabad Events -->
                    <tr class="music-event" data-city="ahmedabad">
                        <td>12 Apr 2025</td>
                        <td>Vibes of Virasat with Rishikesh Gadhvi</td>
                        <td>Dinesh Hall, Ahmedabad</td>
                        <td>Ahmedabad</td>
                        <td>Music</td>
                        <td class="action-btns"><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
                    </tr>
                    <tr class="music-event" data-city="ahmedabad">
                        <td>06 Apr 2025</td>
                        <td>Chalo Malaysia HipHop Jam</td>
                        <td>Good Place Cafe, Ahmedabad</td>
                        <td>Ahmedabad</td>
                        <td>Music</td>
                        <td class="action-btns"><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
                    </tr>
                    <tr class="concert-event" data-city="ahmedabad">
                        <td>05 Apr 2025</td>
                        <td>Open Sky Sound Bath Experience</td>
                        <td>Aarambh Cafe, Ahmedabad</td>
                        <td>Ahmedabad</td>
                        <td>Concert</td>
                        <td class="action-btns"><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
                    </tr>
                    
                    <!-- Mumbai Events -->
                    <tr class="music-event" data-city="mumbai">
                        <td>15 Apr 2025</td>
                        <td>Bollywood Night with Arijit Singh</td>
                        <td>Jio World Garden, Mumbai</td>
                        <td>Mumbai</td>
                        <td>Music</td>
                        <td class="action-btns"><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
                    </tr>
                    <tr class="dance-event" data-city="mumbai">
                        <td>18 Apr 2025</td>
                        <td>Mumbai Electronic Dance Festival</td>
                        <td>Nesco Center, Mumbai</td>
                        <td>Mumbai</td>
                        <td>Dance</td>
                        <td class="action-btns"><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
                    </tr>
                    
                    <!-- Delhi Events -->
                    <tr class="concert-event" data-city="delhi">
                        <td>20 Apr 2025</td>
                        <td>Classical Night with Zakir Hussain</td>
                        <td>India Habitat Centre, Delhi</td>
                        <td>Delhi</td>
                        <td>Concert</td>
                        <td class="action-btns"><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
                    </tr>
                    <tr class="business-event" data-city="delhi">
                        <td>22 Apr 2025</td>
                        <td>Delhi Tech Summit</td>
                        <td>Pragati Maidan, Delhi</td>
                        <td>Delhi</td>
                        <td>Business</td>
                        <td class="action-btns"><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
                    </tr>
                    
                    <!-- Bangalore Events -->
                    <tr class="dance-event" data-city="bangalore">
                        <td>25 Apr 2025</td>
                        <td>Bangalore EDM Carnival</td>
                        <td>Palace Grounds, Bangalore</td>
                        <td>Bangalore</td>
                        <td>Dance</td>
                        <td class="action-btns"><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
                    </tr>
                    <tr class="business-event" data-city="bangalore">
                        <td>28 Apr 2025</td>
                        <td>Startup Investor Meet</td>
                        <td>UB City, Bangalore</td>
                        <td>Bangalore</td>
                        <td>Business</td>
                        <td class="action-btns"><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
                    </tr>
                    
                    <!-- Hyderabad Events -->
                    <tr class="concert-event" data-city="hyderabad">
                        <td>30 Apr 2025</td>
                        <td>Hyderabad Rock Festival</td>
                        <td>Hitex Exhibition Center, Hyderabad</td>
                        <td>Hyderabad</td>
                        <td>Concert</td>
                        <td class="action-btns"><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
                    </tr>
                    <tr class="music-event" data-city="hyderabad">
                        <td>02 May 2025</td>
                        <td>Ghazal Night with Pankaj Udhas</td>
                        <td>Shilpakala Vedika, Hyderabad</td>
                        <td>Hyderabad</td>
                        <td>Music</td>
                        <td class="action-btns"><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
                    </tr>
                    
                    <!-- Other Cities Events -->
                    <tr class="business-event" data-city="chennai">
                        <td>10 May 2025</td>
                        <td>Chennai Business Conference</td>
                        <td>Taj Coromandel, Chennai</td>
                        <td>Chennai</td>
                        <td>Business</td>
                        <td class="action-btns"><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
                    </tr>
                    <tr class="music-event" data-city="kolkata">
                        <td>15 May 2025</td>
                        <td>Kolkata Classical Music Festival</td>
                        <td>Science City Auditorium, Kolkata</td>
                        <td>Kolkata</td>
                        <td>Music</td>
                        <td class="action-btns"><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Others Section -->
    <div class="others-section" id="others-events" style="display: none;">
        <h3>Events in Other Cities</h3>
        <div class="events-table">
            <table>
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Event</th>
                        <th>Venue</th>
                        <th>City</th>
                        <th>Type</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="business-event">
                        <td>10 May 2025</td>
                        <td>Chennai Business Conference</td>
                        <td>Taj Coromandel, Chennai</td>
                        <td>Chennai</td>
                        <td>Business</td>
                        <td class="action-btns"><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
                    </tr>
                    <tr class="music-event">
                        <td>15 May 2025</td>
                        <td>Kolkata Classical Music Festival</td>
                        <td>Science City Auditorium, Kolkata</td>
                        <td>Kolkata</td>
                        <td>Music</td>
                        <td class="action-btns"><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
                    </tr>
                    <tr class="dance-event">
                        <td>20 May 2025</td>
                        <td>Pune Salsa Festival</td>
                        <td>JW Marriott, Pune</td>
                        <td>Pune</td>
                        <td>Dance</td>
                        <td class="action-btns"><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
                    </tr>
                </tbody>
            </table>
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
       // Add data labels for mobile view
       if (window.innerWidth <= 480) {
           const headers = ['Date', 'Event', 'Venue', 'City', 'Type', 'Action'];
           const cells = document.querySelectorAll('td');
           
           cells.forEach((cell, index) => {
               const headerIndex = index % headers.length;
               cell.setAttribute('data-label', headers[headerIndex]);
           });
       }
       
       // Initialize the view
       filterEvents();
   });
   
   function cancelEvent(button) {
       // Get the parent row of the clicked button
       const row = button.closest('tr');
       
       // Toggle the canceled class on the row
       row.classList.toggle('canceled');
       
       // Change button text and style
       if (row.classList.contains('canceled')) {
           button.textContent = 'Undo Cancel';
           button.classList.add('canceled-btn');
       } else {
           button.textContent = 'Cancel';
           button.classList.remove('canceled-btn');
       }
   }
   
   function changeCity() {
       const selectedCity = document.getElementById('cityDropdown').value;
       
       if (selectedCity === 'others') {
           document.getElementById('all-events').classList.remove('active');
           document.getElementById('others-events').style.display = 'block';
       } else {
           document.getElementById('others-events').style.display = 'none';
           document.getElementById('all-events').classList.add('active');
       }
       
       // Apply filters
       filterEvents();
   }
   
   function filterEvents() {
       const eventType = document.getElementById('eventTypeDropdown').value;
       const city = document.getElementById('cityDropdown').value;
       const tableBody = document.querySelector('#all-events tbody');
       const othersTableBody = document.querySelector('#others-events tbody');
       
       // Filter main table
       const rows = tableBody.querySelectorAll('tr');
       let hasVisibleRows = false;
       
       rows.forEach(row => {
           const rowCity = row.getAttribute('data-city');
           const isEventTypeMatch = eventType === 'all' || row.classList.contains(eventType + '-event');
           const isCityMatch = city === 'all' || city === 'others' || rowCity === city;
           
           if (isEventTypeMatch && isCityMatch) {
               row.style.display = '';
               hasVisibleRows = true;
           } else {
               row.style.display = 'none';
           }
       });
       
       // Filter others table
       if (city === 'others') {
           const othersRows = othersTableBody.querySelectorAll('tr');
           let hasVisibleOthers = false;
           
           othersRows.forEach(row => {
               const isEventTypeMatch = eventType === 'all' || row.classList.contains(eventType + '-event');
               
               if (isEventTypeMatch) {
                   row.style.display = '';
                   hasVisibleOthers = true;
               } else {
                   row.style.display = 'none';
               }
           });
           
           // Show/hide others section based on matches
           document.getElementById('others-events').style.display = hasVisibleOthers ? 'block' : 'none';
       }
       
       // Show no events message if no matches
       const noEventsMsg = document.getElementById('no-events-msg');
       if (!hasVisibleRows && city !== 'others') {
           if (!noEventsMsg) {
               const msg = document.createElement('div');
               msg.id = 'no-events-msg';
               msg.className = 'no-events';
               msg.textContent = 'No events found matching your criteria';
               document.querySelector('.events-container').appendChild(msg);
           }
       } else if (noEventsMsg) {
           noEventsMsg.remove();
       }
   }
   </script>

</body>
</html>
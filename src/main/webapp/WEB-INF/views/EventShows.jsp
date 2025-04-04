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
 main{
    margin-left:20px;
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

/* Prevent animation */
.animated, .fadeInDown {
    animation: none !important;
}
.events-container {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}

h1 {
    color: #333;
    text-align: center;
    margin-bottom: 30px;
    font-size: 28px;
}

.city-selector {
    margin: 20px 0;
    text-align: center;
}

.city-selector select {
    padding: 10px 15px;
    border-radius: 5px;
    border: 1px solid #ddd;
    font-size: 16px;
    background-color: white;
    cursor: pointer;
}

.events-table {
    overflow-x: auto;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    border-radius: 10px;
    margin-top: 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
    background: white;
}

th {
    background-color: #ff4757;
    color: white;
    padding: 15px;
    text-align: left;
    font-weight: 600;
}

td {
    padding: 12px 15px;
    border-bottom: 1px solid #f0f0f0;
    color: #555;
}

tr:hover {
    background-color: #fff9f9;
}

.book-btn {
    padding: 8px 15px;
    background-color: #ff4757;
    color: white;
    border: none;
    border-radius: 5px;
    font-weight: bold;
    cursor: pointer;
    transition: all 0.3s ease;
    white-space: nowrap;
}

.book-btn:hover {
    background-color: #ff6b81;
    transform: translateY(-2px);
}

/* Style for canceled events */
.canceled {
    text-decoration: line-through;
    color: #999 !important;
}

.canceled-btn {
    background-color: #666 !important;
}

/* Special button for TBA venue */
td:nth-child(3):contains("to be announced") + td .book-btn {
    background-color: #666;
}

/* Responsive adjustments */
@media (max-width: 768px) {
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
        border: 1px solid #f0f0f0;
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
        color: #333;
    }
    
    .book-btn {
        display: block;
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
          <h2>Upcoming Music Events</h2>
          <div class="city-selector">
              <select id="cityDropdown" onchange="changeCity()">
                  <option value="ahmedabad">Ahmedabad</option>
                  <option value="mumbai">Mumbai</option>
                  <option value="delhi">Delhi</option>
                  <option value="bangalore">Bangalore</option>
                  <option value="hyderabad">Hyderabad</option>
              </select>
          </div>
        </div>
    
    <!-- Ahmedabad Events -->
    <div id="ahmedabad-events" class="city-events active">
        <div class="events-table">
            <table id="eventsTable">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Event</th>
                        <th>Venue</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>12 Apr 2025</td>
                        <td>Vibes of Virasat with Rishikesh Gadhvi</td>
                        <td>Dinesh Hall, Ahmedabad</td>
                        <td><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
                    </tr>
                    <tr>
                        <td>06 Apr 2025</td>
                        <td>Chalo Malaysia HipHop Jam</td>
                        <td>Good Place Cafe, Ahmedabad</td>
                        <td><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
                    </tr>
                    <tr>
                        <td>05 Apr 2025</td>
                        <td>Open Sky Sound Bath Experience</td>
                        <td>Aarambh Cafe, Ahmedabad</td>
                        <td><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
                    </tr>
                    <!-- 1. Rock Concert -->
<tr>
    <td>15 Apr 2025</td>
    <td>Indian Rock Revolution ft. Parikrama</td>
    <td>Hard Rock Cafe, Ahmedabad</td>
    <td><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
</tr>

<!-- 2. Sufi Night -->
<tr>
    <td>18 Apr 2025</td>
    <td>Sufi Soul with Kailash Kher</td>
    <td>Rajpath Club, Ahmedabad</td>
    <td><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
</tr>

<!-- 3. DJ Night -->
<tr>
    <td>20 Apr 2025</td>
    <td>Sunburn Arena with DJ Nucleya</td>
    <td>Karnavati Club, Ahmedabad</td>
    <td><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
</tr>

<!-- 4. Ghazal Evening -->
<tr>
    <td>22 Apr 2025</td>
    <td>Ghazal Night with Talat Aziz</td>
    <td>Gulmohar Park, Ahmedabad</td>
    <td><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
</tr>

<!-- 5. Indie Music Festival -->
<tr>
    <td>25 Apr 2025</td>
    <td>IndieFest: Emerging Artists Showcase</td>
    <td>Amdavad ni Gufa, Ahmedabad</td>
    <td><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
</tr>

<!-- 6. Bollywood Retro Night -->
<tr>
    <td>28 Apr 2025</td>
    <td>Bollywood Rewind: 90s Hits Night</td>
    <td>Town Hall, Ahmedabad</td>
    <td><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
</tr>
                </tbody>
            </table>
        </div>
    </div>
    
    <!-- Mumbai Events -->
    <div id="mumbai-events" class="city-events">
        <div class="events-table">
            <table>
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Event</th>
                        <th>Venue</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>15 Apr 2025</td>
                        <td>Bollywood Night with Arijit Singh</td>
                        <td>Jio World Garden, Mumbai</td>
                        <td><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
                    </tr>
                    <tr>
                        <td>18 Apr 2025</td>
                        <td>Mumbai Electronic Dance Festival</td>
                        <td>Nesco Center, Mumbai</td>
                        <td><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    
    <!-- Delhi Events -->
    <div id="delhi-events" class="city-events">
        <div class="events-table">
            <table>
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Event</th>
                        <th>Venue</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>20 Apr 2025</td>
                        <td>Classical Night with Zakir Hussain</td>
                        <td>India Habitat Centre, Delhi</td>
                        <td><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
                    </tr>
                    <tr>
                        <td>22 Apr 2025</td>
                        <td>Delhi Jazz Festival</td>
                        <td>Garden of Five Senses, Delhi</td>
                        <td><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
                    </tr>
                    <!-- 1. Jazz Night -->
<tr>
    <td>30 Apr 2025</td>
    <td>Ahmedabad Jazz Festival ft. Louiz Banks</td>
    <td>Natrani Theatre, Ahmedabad</td>
    <td><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
</tr>

<!-- 2. Folk Fusion Concert -->
<tr>
    <td>02 May 2025</td>
    <td>Gujarati Folk Fusion with Kirtidan Gadhvi</td>
    <td>Sabarmati Riverfront, Ahmedabad</td>
    <td><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
</tr>

<!-- 3. Metal Show -->
<tr>
    <td>05 May 2025</td>
    <td>Extreme Metal Night: Bhayanak Maut</td>
    <td>Hole in the Wall Cafe, Ahmedabad</td>
    <td><button class="book-btn" style="background-color:#333" onclick="cancelEvent(this)">Cancel</button></td>
</tr>

<!-- 4. Classical Fusion -->
<tr>
    <td>08 May 2025</td>
    <td>Shankar-Ehsaan-Loy Live in Concert</td>
    <td>GMDC Ground, Ahmedabad</td>
    <td><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
</tr>
                </tbody>
            </table>
        </div>
    </div>
    
    <!-- Bangalore Events -->
    <div id="bangalore-events" class="city-events">
        <div class="events-table">
            <table>
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Event</th>
                        <th>Venue</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>25 Apr 2025</td>
                        <td>Bangalore EDM Carnival</td>
                        <td>Palace Grounds, Bangalore</td>
                        <td><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
                    </tr>
                    <tr>
                        <td>28 Apr 2025</td>
                        <td>Indie Music Festival</td>
                        <td>UB City, Bangalore</td>
                        <td><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    
    <!-- Hyderabad Events -->
    <div id="hyderabad-events" class="city-events">
        <div class="events-table">
            <table>
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Event</th>
                        <th>Venue</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>30 Apr 2025</td>
                        <td>Hyderabad Rock Festival</td>
                        <td>Hitex Exhibition Center, Hyderabad</td>
                        <td><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
                    </tr>
                    <tr>
                        <td>02 May 2025</td>
                        <td>Ghazal Night with Pankaj Udhas</td>
                        <td>Shilpakala Vedika, Hyderabad</td>
                        <td><button class="book-btn" onclick="cancelEvent(this)">Cancel</button></td>
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
           const headers = ['Date', 'Event', 'Venue', 'Action'];
           const cells = document.querySelectorAll('td');
           
           cells.forEach((cell, index) => {
               const headerIndex = index % headers.length;
               cell.setAttribute('data-label', headers[headerIndex]);
           });
       }
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
       
       // Hide all city event tables
       document.querySelectorAll('.city-events').forEach(table => {
           table.classList.remove('active');
       });
       
       // Show the selected city's events
       document.getElementById(selectedCity + '-events').classList.add('active');
   }
   </script>

</body>
</html>
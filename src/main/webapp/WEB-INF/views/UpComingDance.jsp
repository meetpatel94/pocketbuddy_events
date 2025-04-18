<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dance Show Events</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    :root {
      --primary-color: #432E54;
      --secondary-color: #e91e63;
    }
    
    body {
      background-color: #f8f9fa;
    }
    
    .events-container {
      padding: 50px 0;
    }
    
    .section-header {
      text-align: center;
      margin-bottom: 40px;
    }
    
    .section-header h2 {
      color: var(--primary-color);
      font-weight: 700;
      margin-bottom: 10px;
    }
    
    .section-header p {
      color: var(--secondary-color);
      font-size: 18px;
    }
    
    .table-container {
      background: white;
      border-radius: 10px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.1);
      padding: 20px;
      max-height: 700px;
      overflow-y: auto;
    }
    
    .dance-table {
      width: 100%;
      border-collapse: separate;
      border-spacing: 0 12px;
    }
    
    .dance-table thead th {
      position: sticky;
      top: 0;
      background-color: var(--primary-color);
      color: white;
      padding: 15px;
      text-align: left;
      z-index: 10;
    }
    
    .dance-table tbody tr {
      background-color: white;
      box-shadow: 0 2px 10px rgba(0,0,0,0.05);
      transition: all 0.3s ease;
    }
    
    .dance-table tbody tr:hover {
      transform: translateY(-3px);
      box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    }
    
    .dance-table td {
      padding: 15px;
      vertical-align: middle;
      border-top: 1px solid #f0f0f0;
      border-bottom: 1px solid #f0f0f0;
    }
    
    .dance-table td:first-child {
      border-left: 1px solid #f0f0f0;
      border-radius: 8px 0 0 8px;
    }
    
    .dance-table td:last-child {
      border-right: 1px solid #f0f0f0;
      border-radius: 0 8px 8px 0;
    }
    
    .dance-image {
      width: 80px;
      height: 60px;
      border-radius: 5px;
      object-fit: cover;
      transition: transform 0.3s;
    }
    
    .dance-image:hover {
      transform: scale(1.1);
    }
    
    .dance-name {
      color: var(--primary-color);
      font-weight: 600;
      margin-bottom: 5px;
    }
    
    .dance-company {
      color: var(--secondary-color);
      font-size: 14px;
    }
    
    .dance-venue {
      color: #555;
      font-size: 14px;
    }
    
    .dance-date {
      font-weight: 500;
    }
    
    .dance-time {
      color: #777;
      font-size: 13px;
    }
    
    .dance-price {
      font-weight: bold;
      color: var(--primary-color);
    }
    
    .dance-stats {
      font-size: 13px;
      color: #777;
    }
    
    .book-btn {
      background: var(--primary-color);
      color: white;
      border: none;
      padding: 3px 7px;
      border-radius: 5px;
      transition: all 0.3s;
      white-space: nowrap;
    }
    
    .book-btn:hover {
      background: var(--secondary-color);
      transform: translateY(-2px);
      box-shadow: 0 3px 10px rgba(0,0,0,0.2);
    }
    
    .status-badge {
      padding: 5px 10px;
      border-radius: 20px;
      font-size: 12px;
      font-weight: 500;
      display: inline-block;
    }
    
    .status-available {
      background-color: #e6f7ee;
      color: #28a745;
    }
    
    .status-selling-fast {
      background-color: #fff3cd;
      color: #856404;
    }
    
    .status-sold-out {
      background-color: #f8d7da;
      color: #721c24;
    }
    
    .rating {
      color: #FFD700;
      font-size: 14px;
    }
    
    /* Custom scrollbar */
    .table-container::-webkit-scrollbar {
      width: 8px;
    }
    
    .table-container::-webkit-scrollbar-track {
      background: #f1f1f1;
      border-radius: 10px;
    }
    
    .table-container::-webkit-scrollbar-thumb {
      background: var(--primary-color);
      border-radius: 10px;
    }
    
    .table-container::-webkit-scrollbar-thumb:hover {
      background: var(--secondary-color);
    }
    
    /* Filter controls */
    .filter-controls {
      background: white;
      padding: 15px;
      border-radius: 8px;
      margin-bottom: 20px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.05);
    }
    
    .no-results {
      text-align: center;
      padding: 30px;
      color: #777;
      display: none;
    }
    
    /* Responsive adjustments */
    @media (max-width: 768px) {
      .table-container {
        padding: 10px;
      }
      
      .dance-table thead {
        display: none;
      }
      
      .dance-table tbody tr {
        display: block;
        margin-bottom: 15px;
        border-radius: 8px;
      }
      
      .dance-table td {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px;
        border: none;
        border-bottom: 1px solid #f0f0f0;
      }
      
      .dance-table td:before {
        content: attr(data-label);
        font-weight: bold;
        color: var(--primary-color);
        margin-right: 10px;
      }
      
      .dance-table td:first-child,
      .dance-table td:last-child {
        border-radius: 0;
      }
      
      .dance-table td:first-child {
        border-top: 1px solid #f0f0f0;
      }
    }
    td[data-label="Action"] {
      display: none; /* Hide action button in mobile view if using data-label */
    }
  </style>
</head>
<body>
  <div class="events-container">
    <div class="container">
      <div class="section-header">
        <h2>Upcoming Dance Shows</h2>
        <p>Experience the magic of dance performances</p>
      </div>
      
      <div class="filter-controls row g-3">
        <div class="col-md-4">
          <label for="date-filter" class="form-label">Filter by Date</label>
          <select id="date-filter" class="form-select">
            <option value="all">All Dates</option>
            <option value="today">Today</option>
            <option value="this-week">This Week</option>
            <option value="next-week">Next Week</option>
            <option value="this-month">This Month</option>
          </select>
        </div>
        <div class="col-md-4">
          <label for="city-filter" class="form-label">Filter by City</label>
          <select id="city-filter" class="form-select">
            <option value="all">All Cities</option>
            <option value="surat">Surat</option>
            <option value="ahmedabad">Ahmedabad</option>
            <option value="vadodara">Vadodara</option>
            <option value="navsari">Navsari</option>
            <option value="other">Other Cities</option>
          </select>
        </div>
        <div class="col-md-4">
          <label for="price-filter" class="form-label">Filter by Price</label>
          <select id="price-filter" class="form-select">
            <option value="all">All Prices</option>
            <option value="under-30">Under $30</option>
            <option value="30-50">$30 - $50</option>
            <option value="50-100">$50 - $100</option>
            <option value="over-100">Over $100</option>
          </select>
        </div>
        <div class="col-12 d-flex justify-content-end">
          <button id="reset-filters" class="btn btn-outline-secondary">Reset Filters</button>
        </div>
      </div>
      
      <div class="table-container">
        <table class="dance-table">
          <thead>
            <tr>
              <th>Event</th>
              <th>Dance Company</th>
              <th>Venue</th>
              <th>Date & Time</th>
              <th>Price</th>
              <th>Rating</th>
              <th>Status</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody id="dance-table-body">
            <tr data-date="2023-06-10" data-city="ahmedabad" data-price="45">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1547153760-18fc86324498?ixlib=rb-1.2.1&auto=format&fit=crop&w=200&q=80"
                       class="dance-image me-3">
                  <div>
                    <div class="dance-name">Contemporary Fusion</div>
                    <div class="dance-stats"><i class="fas fa-user me-1"></i>215 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Dance Company">
                <div class="dance-company">Nritya Dance Troupe</div>
              </td>
              <td data-label="Venue">
                <div class="dance-venue">Ahmedabad Cultural Center</div>
              </td>
              <td data-label="Date & Time">
                <div class="dance-date">10 JUN 2023</div>
                <div class="dance-time">7:00 PM</div>
              </td>
              <td data-label="Price">
                <div class="dance-price">$45</div>
              </td>
              <td data-label="Rating">
                <div class="rating">
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star-half-alt"></i>
                  <span class="ms-1">4.5</span>
                </div>
              </td>
              <td data-label="Status">
                <span class="status-badge status-available">Available</span>
              </td>
              <td data-label="Action">
                <button class="book-btn">Book Now</button>
              </td>
            </tr>
            
            <tr data-date="2023-06-15" data-city="surat" data-price="35">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?ixlib=rb-1.2.1&auto=format&fit=crop&w=200&q=80"
                       class="dance-image me-3">
                  <div>
                    <div class="dance-name">Bollywood Dance Extravaganza</div>
                    <div class="dance-stats"><i class="fas fa-user me-1"></i>532 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Dance Company">
                <div class="dance-company">Surat Dance Academy</div>
              </td>
              <td data-label="Venue">
                <div class="dance-venue">Surat International Hall</div>
              </td>
              <td data-label="Date & Time">
                <div class="dance-date">15 JUN 2023</div>
                <div class="dance-time">8:30 PM</div>
              </td>
              <td data-label="Price">
                <div class="dance-price">$35</div>
              </td>
              <td data-label="Rating">
                <div class="rating">
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="far fa-star"></i>
                  <span class="ms-1">4.0</span>
                </div>
              </td>
              <td data-label="Status">
                <span class="status-badge status-selling-fast">Selling Fast</span>
              </td>
              <td data-label="Action">
                <button class="book-btn">Book Now</button>
              </td>
            </tr>
            
            <tr data-date="2023-06-18" data-city="vadodara" data-price="55">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1508700115892-45ecd05ae2ad?ixlib=rb-1.2.1&auto=format&fit=crop&w=200&q=80"
                       class="dance-image me-3">
                  <div>
                    <div class="dance-name">Classical Bharatanatyam</div>
                    <div class="dance-stats"><i class="fas fa-user me-1"></i>180 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Dance Company">
                <div class="dance-company">Nataraj Dance Company</div>
              </td>
              <td data-label="Venue">
                <div class="dance-venue">Vadodara Art Gallery</div>
              </td>
              <td data-label="Date & Time">
                <div class="dance-date">18 JUN 2023</div>
                <div class="dance-time">6:30 PM</div>
              </td>
              <td data-label="Price">
                <div class="dance-price">$55</div>
              </td>
              <td data-label="Rating">
                <div class="rating">
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <span class="ms-1">5.0</span>
                </div>
              </td>
              <td data-label="Status">
                <span class="status-badge status-available">Available</span>
              </td>
              <td data-label="Action">
                <button class="book-btn">Book Now</button>
              </td>
            </tr>
            
            <tr data-date="2023-06-22" data-city="ahmedabad" data-price="40">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1514525253161-7a46d19cd819?ixlib=rb-1.2.1&auto=format&fit=crop&w=200&q=80"
                       class="dance-image me-3">
                  <div>
                    <div class="dance-name">Hip Hop Battle</div>
                    <div class="dance-stats"><i class="fas fa-user me-1"></i>320 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Dance Company">
                <div class="dance-company">Street Kings Crew</div>
              </td>
              <td data-label="Venue">
                <div class="dance-venue">Ahmedabad Youth Center</div>
              </td>
              <td data-label="Date & Time">
                <div class="dance-date">22 JUN 2023</div>
                <div class="dance-time">7:30 PM</div>
              </td>
              <td data-label="Price">
                <div class="dance-price">$40</div>
              </td>
              <td data-label="Rating">
                <div class="rating">
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star-half-alt"></i>
                  <span class="ms-1">4.5</span>
                </div>
              </td>
              <td data-label="Status">
                <span class="status-badge status-selling-fast">Selling Fast</span>
              </td>
              <td data-label="Action">
                <button class="book-btn">Book Now</button>
              </td>
            </tr>
            
            <tr data-date="2023-06-25" data-city="navsari" data-price="30">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1470225620780-dba8ba36b745?ixlib=rb-1.2.1&auto=format&fit=crop&w=200&q=80"
                       class="dance-image me-3">
                  <div>
                    <div class="dance-name">Folk Dance Festival</div>
                    <div class="dance-stats"><i class="fas fa-user me-1"></i>190 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Dance Company">
                <div class="dance-company">Gujarat Cultural Group</div>
              </td>
              <td data-label="Venue">
                <div class="dance-venue">Navsari Community Hall</div>
              </td>
              <td data-label="Date & Time">
                <div class="dance-date">25 JUN 2023</div>
                <div class="dance-time">6:00 PM</div>
              </td>
              <td data-label="Price">
                <div class="dance-price">$30</div>
              </td>
              <td data-label="Rating">
                <div class="rating">
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="far fa-star"></i>
                  <span class="ms-1">4.0</span>
                </div>
              </td>
              <td data-label="Status">
                <span class="status-badge status-available">Available</span>
              </td>
              <td data-label="Action">
                <button class="book-btn">Book Now</button>
              </td>
            </tr>
          </tbody>
        </table>
        <div id="no-results" class="no-results">
          <i class="fas fa-search fa-3x mb-3"></i>
          <h4>No dance shows match your filters</h4>
          <p>Try adjusting your search criteria</p>
        </div>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
  
  <script>
    document.addEventListener('DOMContentLoaded', function() {
      // Get all filter elements
      const dateFilter = document.getElementById('date-filter');
      const cityFilter = document.getElementById('city-filter');
      const priceFilter = document.getElementById('price-filter');
      const resetButton = document.getElementById('reset-filters');
      const danceRows = document.querySelectorAll('#dance-table-body tr');
      const noResults = document.getElementById('no-results');
      
      // Add event listeners to filters
      dateFilter.addEventListener('change', filterDanceShows);
      cityFilter.addEventListener('change', filterDanceShows);
      priceFilter.addEventListener('change', filterDanceShows);
      resetButton.addEventListener('click', resetFilters);
      
      // Add event listeners to book buttons
      const bookButtons = document.querySelectorAll('.book-btn');
      bookButtons.forEach(button => {
        button.addEventListener('click', function() {
          const eventName = this.closest('tr').querySelector('.dance-name').textContent;
          alert(`Booking initiated for: ${eventName}`);
        });
      });
      
      // Filter dance shows based on selected filters
      function filterDanceShows() {
        const selectedDate = dateFilter.value;
        const selectedCity = cityFilter.value;
        const selectedPrice = priceFilter.value;
        
        let visibleCount = 0;
        
        danceRows.forEach(row => {
          const rowDate = row.getAttribute('data-date');
          const rowCity = row.getAttribute('data-city');
          const rowPrice = parseFloat(row.getAttribute('data-price'));
          
          // Check if row matches all selected filters
          const dateMatch = selectedDate === 'all' || checkDateMatch(selectedDate, rowDate);
          const cityMatch = selectedCity === 'all' || rowCity === selectedCity;
          const priceMatch = selectedPrice === 'all' || checkPriceMatch(selectedPrice, rowPrice);
          
          if (dateMatch && cityMatch && priceMatch) {
            row.style.display = '';
            visibleCount++;
          } else {
            row.style.display = 'none';
          }
        });
        
        // Show no results message if no dance shows match filters
        if (visibleCount === 0) {
          noResults.style.display = 'block';
        } else {
          noResults.style.display = 'none';
        }
      }
      
      // Check if row date matches selected date filter
      function checkDateMatch(selectedDate, rowDate) {
        // Since all dates in the table are from 2023 (in the past), 
        // we'll modify the logic to work with these static dates for demonstration
        
        // Convert row date string to Date object
        const showDate = new Date(rowDate);
        
        // For demonstration purposes, we'll pretend today is June 1, 2023
        const today = new Date('2023-06-01');
        today.setHours(0, 0, 0, 0);
        
        // Calculate dates for filters
        const dayOfWeek = today.getDay(); // 0 = Sunday, 6 = Saturday
        const startOfWeek = new Date(today);
        startOfWeek.setDate(today.getDate() - dayOfWeek); // Start of current week (Sunday)
        const endOfWeek = new Date(startOfWeek);
        endOfWeek.setDate(startOfWeek.getDate() + 6); // End of current week (Saturday)
        
        const startOfNextWeek = new Date(endOfWeek);
        startOfNextWeek.setDate(endOfWeek.getDate() + 1); // Start of next week (Sunday)
        const endOfNextWeek = new Date(startOfNextWeek);
        endOfNextWeek.setDate(startOfNextWeek.getDate() + 6); // End of next week (Saturday)
        
        const startOfMonth = new Date(today.getFullYear(), today.getMonth(), 1);
        const endOfMonth = new Date(today.getFullYear(), today.getMonth() + 1, 0);
        
        switch(selectedDate) {
          case 'today':
            return showDate.toDateString() === today.toDateString();
          case 'this-week':
            return showDate >= startOfWeek && showDate <= endOfWeek;
          case 'next-week':
            return showDate >= startOfNextWeek && showDate <= endOfNextWeek;
          case 'this-month':
            return showDate >= startOfMonth && showDate <= endOfMonth;
          default:
            return true; // 'all' dates
        }
      }
      
      // Check if row price matches selected price filter
      function checkPriceMatch(selectedPrice, rowPrice) {
        switch(selectedPrice) {
          case 'under-30':
            return rowPrice < 30;
          case '30-50':
            return rowPrice >= 30 && rowPrice <= 50;
          case '50-100':
            return rowPrice > 50 && rowPrice <= 100;
          case 'over-100':
            return rowPrice > 100;
          default:
            return true; // 'all' prices
        }
      }
      
      // Reset all filters
      function resetFilters() {
        dateFilter.value = 'all';
        cityFilter.value = 'all';
        priceFilter.value = 'all';
        filterDanceShows();
      }
      
      // Initial filter on page load
      filterDanceShows();
    });
  </script>
</body>
</html>
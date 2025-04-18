<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Music Events Table</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    :root {
      --primary-color: #432E54;
      --secondary-color: #f82249;
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
    
    .music-table {
      width: 100%;
      border-collapse: separate;
      border-spacing: 0 12px;
    }
    
    .music-table thead th {
      position: sticky;
      top: 0;
      background-color: var(--primary-color);
      color: white;
      padding: 15px;
      text-align: left;
      z-index: 10;
    }
    
    .music-table tbody tr {
      background-color: white;
      box-shadow: 0 2px 10px rgba(0,0,0,0.05);
      transition: all 0.3s ease;
    }
    
    .music-table tbody tr:hover {
      transform: translateY(-3px);
      box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    }
    
    .music-table td {
      padding: 15px;
      vertical-align: middle;
      border-top: 1px solid #f0f0f0;
      border-bottom: 1px solid #f0f0f0;
    }
    
    .music-table td:first-child {
      border-left: 1px solid #f0f0f0;
      border-radius: 8px 0 0 8px;
    }
    
    .music-table td:last-child {
      border-right: 1px solid #f0f0f0;
      border-radius: 0 8px 8px 0;
    }
    
    .event-image {
      width: 80px;
      height: 60px;
      border-radius: 5px;
      object-fit: cover;
      transition: transform 0.3s;
    }
    
    .event-image:hover {
      transform: scale(1.1);
    }
    
    .event-name {
      color: var(--primary-color);
      font-weight: 600;
      margin-bottom: 5px;
    }
    
    .event-artist {
      color: var(--secondary-color);
      font-size: 14px;
    }
    
    .event-venue {
      color: #555;
      font-size: 14px;
    }
    
    .event-date {
      font-weight: 500;
    }
    
    .event-time {
      color: #777;
      font-size: 13px;
    }
    
    .event-price {
      font-weight: bold;
      color: var(--primary-color);
    }
    
    .event-stats {
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
      
      .music-table thead {
        display: none;
      }
      
      .music-table tbody tr {
        display: block;
        margin-bottom: 15px;
        border-radius: 8px;
      }
      
      .music-table td {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px;
        border: none;
        border-bottom: 1px solid #f0f0f0;
      }
      
      .music-table td:before {
        content: attr(data-label);
        font-weight: bold;
        color: var(--primary-color);
        margin-right: 10px;
      }
      
      .music-table td:first-child,
      .music-table td:last-child {
        border-radius: 0;
      }
      
      .music-table td:first-child {
        border-top: 1px solid #f0f0f0;
      }
    }
    td[data-label="Action"] {
      display: none;
    }
  </style>
</head>
<body>
  <div class="events-container">
    <div class="container">
      <div class="section-header">
        <h2>Upcoming Music Events</h2>
        <p>Discover the best live music experiences</p>
      </div>
      
      <!-- Filter Controls -->
      <div class="filter-controls row g-3">
        <div class="col-md-3">
          <label for="genre-filter" class="form-label">Filter by Genre</label>
          <select id="genre-filter" class="form-select">
            <option value="all">All Genres</option>
            <option value="rock">Rock</option>
            <option value="pop">Pop</option>
            <option value="jazz">Jazz</option>
            <option value="electronic">Electronic</option>
            <option value="hiphop">Hip Hop</option>
            <option value="classical">Classical</option>
            <option value="indie">Indie</option>
            <option value="rnb">R&B</option>
          </select>
        </div>
        <div class="col-md-3">
          <label for="price-filter" class="form-label">Filter by Price</label>
          <select id="price-filter" class="form-select">
            <option value="all">All Prices</option>
            <option value="under-30">Under $30</option>
            <option value="30-50">$30 - $50</option>
            <option value="50-100">$50 - $100</option>
            <option value="over-100">Over $100</option>
          </select>
        </div>
        <div class="col-md-3 d-flex align-items-end">
          <button id="reset-filters" class="btn btn-outline-secondary w-100" style="margin-top:30px;">Reset Filters</button>
        </div>
      </div>
      
      <!-- Music Events Table Section -->
      <div class="table-container">
        <table class="music-table">
          <thead>
            <tr>
              <th>Event</th>
              <th>Artist</th>
              <th>Venue</th>
              <th>Date & Time</th>
              <th>Price</th>
              <th>Rating</th>
              <th>Status</th>
              
            </tr>
          </thead>
          <tbody id="music-table-body">
            <!-- Event 1 -->
            <tr data-genre="rock" data-date="2023-06-10" data-price="45">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="event-image me-3">
                  <div>
                    <div class="event-name">Rock Revolution</div>
                    <div class="event-stats"><i class="fas fa-user me-1"></i>315 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Artist">
                <div class="event-artist">The Electric Storm</div>
              </td>
              <td data-label="Venue">
                <div class="event-venue">Downtown Arena</div>
              </td>
              <td data-label="Date & Time">
                <div class="event-date">10 JUN 2023</div>
                <div class="event-time">8:00 PM</div>
              </td>
              <td data-label="Price">
                <div class="event-price">$45</div>
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
            
            <!-- Event 2 -->
            <tr data-genre="pop" data-date="2023-06-15" data-price="65">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="event-image me-3">
                  <div>
                    <div class="event-name">Pop Sensation Live</div>
                    <div class="event-stats"><i class="fas fa-user me-1"></i>890 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Artist">
                <div class="event-artist">Ariana Grande</div>
              </td>
              <td data-label="Venue">
                <div class="event-venue">City Stadium</div>
              </td>
              <td data-label="Date & Time">
                <div class="event-date">15 JUN 2023</div>
                <div class="event-time">7:30 PM</div>
              </td>
              <td data-label="Price">
                <div class="event-price">$65</div>
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
            
            <!-- Event 3 -->
            <tr data-genre="jazz" data-date="2023-06-18" data-price="55">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1514525253161-7a46d19cd819?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="event-image me-3">
                  <div>
                    <div class="event-name">Jazz Under the Stars</div>
                    <div class="event-stats"><i class="fas fa-user me-1"></i>210 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Artist">
                <div class="event-artist">The Cool Cats</div>
              </td>
              <td data-label="Venue">
                <div class="event-venue">Riverside Park</div>
              </td>
              <td data-label="Date & Time">
                <div class="event-date">18 JUN 2023</div>
                <div class="event-time">7:00 PM</div>
              </td>
              <td data-label="Price">
                <div class="event-price">$55</div>
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
            
            <!-- Event 4 -->
            <tr data-genre="electronic" data-date="2023-06-22" data-price="75">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="event-image me-3">
                  <div>
                    <div class="event-name">Electronic Dreams</div>
                    <div class="event-stats"><i class="fas fa-user me-1"></i>540 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Artist">
                <div class="event-artist">DJ Pulse & The Beats</div>
              </td>
              <td data-label="Venue">
                <div class="event-venue">Warehouse 22</div>
              </td>
              <td data-label="Date & Time">
                <div class="event-date">22 JUN 2023</div>
                <div class="event-time">10:00 PM</div>
              </td>
              <td data-label="Price">
                <div class="event-price">$75</div>
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
                <span class="status-badge status-selling-fast">Selling Fast</span>
              </td>
              <td data-label="Action">
                <button class="book-btn">Book Now</button>
              </td>
            </tr>
            
            <!-- Event 5 -->
            <tr data-genre="hiphop" data-date="2023-06-25" data-price="60">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1614680376573-df3480f0c6ff?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="event-image me-3">
                  <div>
                    <div class="event-name">Hip Hop Nation</div>
                    <div class="event-stats"><i class="fas fa-user me-1"></i>680 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Artist">
                <div class="event-artist">Kendrick Lamar</div>
              </td>
              <td data-label="Venue">
                <div class="event-venue">Urban Center</div>
              </td>
              <td data-label="Date & Time">
                <div class="event-date">25 JUN 2023</div>
                <div class="event-time">9:00 PM</div>
              </td>
              <td data-label="Price">
                <div class="event-price">$60</div>
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
            
            <!-- Event 6 -->
            <tr data-genre="classical" data-date="2023-06-28" data-price="85">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1429962714451-bb934ecdc4ec?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="event-image me-3">
                  <div>
                    <div class="event-name">Symphony Night</div>
                    <div class="event-stats"><i class="fas fa-user me-1"></i>320 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Artist">
                <div class="event-artist">City Philharmonic</div>
              </td>
              <td data-label="Venue">
                <div class="event-venue">Grand Concert Hall</div>
              </td>
              <td data-label="Date & Time">
                <div class="event-date">28 JUN 2023</div>
                <div class="event-time">7:30 PM</div>
              </td>
              <td data-label="Price">
                <div class="event-price">$85</div>
              </td>
              <td data-label="Rating">
                <div class="rating">
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star-half-alt"></i>
                  <span class="ms-1">4.7</span>
                </div>
              </td>
              <td data-label="Status">
                <span class="status-badge status-available">Available</span>
              </td>
              <td data-label="Action">
                <button class="book-btn">Book Now</button>
              </td>
            </tr>
            
            <!-- Event 7 -->
            <tr data-genre="indie" data-date="2023-07-02" data-price="40">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1540039155733-5bb30b53aa14?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="event-image me-3">
                  <div>
                    <div class="event-name">Indie Showcase</div>
                    <div class="event-stats"><i class="fas fa-user me-1"></i>180 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Artist">
                <div class="event-artist">The Local Collective</div>
              </td>
              <td data-label="Venue">
                <div class="event-venue">Underground Club</div>
              </td>
              <td data-label="Date & Time">
                <div class="event-date">02 JUL 2023</div>
                <div class="event-time">8:00 PM</div>
              </td>
              <td data-label="Price">
                <div class="event-price">$40</div>
              </td>
              <td data-label="Rating">
                <div class="rating">
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star-half-alt"></i>
                  <i class="far fa-star"></i>
                  <span class="ms-1">3.8</span>
                </div>
              </td>
              <td data-label="Status">
                <span class="status-badge status-available">Available</span>
              </td>
              <td data-label="Action">
                <button class="book-btn">Book Now</button>
              </td>
            </tr>
            
            <!-- Event 8 -->
            <tr data-genre="rnb" data-date="2023-07-05" data-price="70">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1619229669316-95c4800c9b0b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="event-image me-3">
                  <div>
                    <div class="event-name">R&B Soul Night</div>
                    <div class="event-stats"><i class="fas fa-user me-1"></i>420 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Artist">
                <div class="event-artist">The Weeknd</div>
              </td>
              <td data-label="Venue">
                <div class="event-venue">Moonlight Theater</div>
              </td>
              <td data-label="Date & Time">
                <div class="event-date">05 JUL 2023</div>
                <div class="event-time">8:30 PM</div>
              </td>
              <td data-label="Price">
                <div class="event-price">$70</div>
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
                <span class="status-badge status-selling-fast">Selling Fast</span>
              </td>
              <td data-label="Action">
                <button class="book-btn">Book Now</button>
              </td>
            </tr>
            
            <!-- Event 9 -->
            <tr data-genre="rock" data-date="2023-07-10" data-price="50">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1470225620780-dba8ba36b745?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="event-image me-3">
                  <div>
                    <div class="event-name">Classic Rock Revival</div>
                    <div class="event-stats"><i class="fas fa-user me-1"></i>380 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Artist">
                <div class="event-artist">The Vintage Rockers</div>
              </td>
              <td data-label="Venue">
                <div class="event-venue">Retro Arena</div>
              </td>
              <td data-label="Date & Time">
                <div class="event-date">10 JUL 2023</div>
                <div class="event-time">7:00 PM</div>
              </td>
              <td data-label="Price">
                <div class="event-price">$50</div>
              </td>
              <td data-label="Rating">
                <div class="rating">
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="far fa-star"></i>
                  <span class="ms-1">4.2</span>
                </div>
              </td>
              <td data-label="Status">
                <span class="status-badge status-available">Available</span>
              </td>
              <td data-label="Action">
                <button class="book-btn">Book Now</button>
              </td>
            </tr>
            
            <!-- Event 10 -->
            <tr data-genre="pop" data-date="2023-07-15" data-price="90">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1508700115892-45ecd05ae2ad?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="event-image me-3">
                  <div>
                    <div class="event-name">Pop Extravaganza</div>
                    <div class="event-stats"><i class="fas fa-user me-1"></i>750 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Artist">
                <div class="event-artist">Taylor Swift</div>
              </td>
              <td data-label="Venue">
                <div class="event-venue">Mega Dome</div>
              </td>
              <td data-label="Date & Time">
                <div class="event-date">15 JUL 2023</div>
                <div class="event-time">8:00 PM</div>
              </td>
              <td data-label="Price">
                <div class="event-price">$90</div>
              </td>
              <td data-label="Rating">
                <div class="rating">
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star-half-alt"></i>
                  <span class="ms-1">4.7</span>
                </div>
              </td>
              <td data-label="Status">
                <span class="status-badge status-selling-fast">Selling Fast</span>
              </td>
              <td data-label="Action">
                <button class="book-btn">Book Now</button>
              </td>
            </tr>
          </tbody>
        </table>
        <div id="no-results" class="no-results">
          <i class="fas fa-search fa-3x mb-3"></i>
          <h4>No events match your filters</h4>
          <p>Try adjusting your search criteria</p>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap JS Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Font Awesome JS -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
  
  <script>
    document.addEventListener('DOMContentLoaded', function() {
      // Get all filter elements
      const genreFilter = document.getElementById('genre-filter');
      const priceFilter = document.getElementById('price-filter');
      const resetButton = document.getElementById('reset-filters');
      const eventRows = document.querySelectorAll('#music-table-body tr');
      const noResults = document.getElementById('no-results');
      
      // Add event listeners to filters
      genreFilter.addEventListener('change', filterEvents);
      priceFilter.addEventListener('change', filterEvents);
      resetButton.addEventListener('click', resetFilters);
      
      // Add event listeners to book buttons
      const bookButtons = document.querySelectorAll('.book-btn');
      bookButtons.forEach(button => {
        button.addEventListener('click', function() {
          const eventName = this.closest('tr').querySelector('.event-name').textContent;
          alert(`Booking initiated for: ${eventName}`);
        });
      });
      
      // Filter events based on selected filters
      function filterEvents() {
        const selectedGenre = genreFilter.value;
        const selectedPrice = priceFilter.value;
        
        let visibleCount = 0;
        
        eventRows.forEach(row => {
          const rowGenre = row.getAttribute('data-genre');
          const rowPrice = parseFloat(row.getAttribute('data-price'));
          
          // Check if row matches all selected filters
          const genreMatch = selectedGenre === 'all' || rowGenre === selectedGenre;
          const priceMatch = selectedPrice === 'all' || checkPriceMatch(selectedPrice, rowPrice);
          
          if (genreMatch && priceMatch) {
            row.style.display = '';
            visibleCount++;
          } else {
            row.style.display = 'none';
          }
        });
        
        // Show no results message if no events match filters
        if (visibleCount === 0) {
          noResults.style.display = 'block';
        } else {
          noResults.style.display = 'none';
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
            return true;
        }
      }
      
      // Reset all filters to default values
      function resetFilters() {
        genreFilter.value = 'all';
        priceFilter.value = 'all';
        filterEvents();
      }
      
      // Initialize by filtering events (in case page loads with default filters)
      filterEvents();
    });
  </script>
</body>
</html>
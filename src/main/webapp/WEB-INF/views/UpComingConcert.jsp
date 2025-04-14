<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Concert Events Table</title>
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
    
    .concert-table {
      width: 100%;
      border-collapse: separate;
      border-spacing: 0 12px;
    }
    
    .concert-table thead th {
      position: sticky;
      top: 0;
      background-color: var(--primary-color);
      color: white;
      padding: 15px;
      text-align: left;
      z-index: 10;
    }
    
    .concert-table tbody tr {
      background-color: white;
      box-shadow: 0 2px 10px rgba(0,0,0,0.05);
      transition: all 0.3s ease;
    }
    
    .concert-table tbody tr:hover {
      transform: translateY(-3px);
      box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    }
    
    .concert-table td {
      padding: 15px;
      vertical-align: middle;
      border-top: 1px solid #f0f0f0;
      border-bottom: 1px solid #f0f0f0;
    }
    
    .concert-table td:first-child {
      border-left: 1px solid #f0f0f0;
      border-radius: 8px 0 0 8px;
    }
    
    .concert-table td:last-child {
      border-right: 1px solid #f0f0f0;
      border-radius: 0 8px 8px 0;
    }
    
    .concert-image {
      width: 80px;
      height: 60px;
      border-radius: 5px;
      object-fit: cover;
      transition: transform 0.3s;
    }
    
    .concert-image:hover {
      transform: scale(1.1);
    }
    
    .concert-name {
      color: var(--primary-color);
      font-weight: 600;
      margin-bottom: 5px;
    }
    
    .concert-artist {
      color: var(--secondary-color);
      font-size: 14px;
    }
    
    .concert-venue {
      color: #555;
      font-size: 14px;
    }
    
    .concert-date {
      font-weight: 500;
    }
    
    .concert-time {
      color: #777;
      font-size: 13px;
    }
    
    .concert-price {
      font-weight: bold;
      color: var(--primary-color);
    }
    
    .concert-stats {
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
      
      .concert-table thead {
        display: none;
      }
      
      .concert-table tbody tr {
        display: block;
        margin-bottom: 15px;
        border-radius: 8px;
      }
      
      .concert-table td {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px;
        border: none;
        border-bottom: 1px solid #f0f0f0;
      }
      
      .concert-table td:before {
        content: attr(data-label);
        font-weight: bold;
        color: var(--primary-color);
        margin-right: 10px;
      }
      
      .concert-table td:first-child,
      .concert-table td:last-child {
        border-radius: 0;
      }
      
      .concert-table td:first-child {
        border-top: 1px solid #f0f0f0;
      }
    }
    td[data-label="Action"] {
  display: none;
    }
  #reset-filters{
     margin-top: 29px !important;
  }
  </style>
</head>
<body>
  <div class="events-container">
    <div class="container">
      <div class="section-header">
        <h2>Up Coming Concert Events</h2>
        <p>Upcoming Live Concerts</p>
      </div>
      
      <!-- Filter Controls -->
      <div class="filter-controls row g-3">
        
        <div class="col-md-3">
          <label for="genre-filter" class="form-label">Filter by Genre</label>
          <select id="genre-filter" class="form-select">
            <option value="all">All Genres</option>
            <option value="rock">Rock</option>
            <option value="bollywood">Bollywood</option>
            <option value="edm">EDM</option>
            <option value="classical">Classical</option>
            <option value="indie">Indie</option>
            <option value="jazz">Jazz</option>
            <option value="pop">Pop</option>
            <option value="country">Country</option>
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
          <button id="reset-filters" class="btn btn-outline-secondary w-100">Reset Filters</button>
        </div>
      </div>
      
      <!-- Concert Table Section -->
      <div class="table-container">
        <table class="concert-table">
          <thead>
            <tr>
              <th>Event</th>
              <th>Artist</th>
              <th>Venue</th>
              <th>Date & Time</th>
              <th>Price</th>
              <th>Rating</th>
              <th>Status</th>
              <!-- <th>Action</th> -->
            </tr>
          </thead>
          <tbody id="concert-table-body">
            <!-- Concert 1 -->
            <tr data-genre="rock" data-date="2023-04-18" data-price="49">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="concert-image me-3">
                  <div>
                    <div class="concert-name">Rock Nation Tour</div>
                    <div class="concert-stats"><i class="fas fa-user me-1"></i>215 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Artist">
                <div class="concert-artist">The Midnight Riders</div>
              </td>
              <td data-label="Venue">
                <div class="concert-venue">Narendra Modi Stadium</div>
              </td>
              <td data-label="Date & Time">
                <div class="concert-date">18 APR 2023</div>
                <div class="concert-time">7:00 PM</div>
              </td>
              <td data-label="Price">
                <div class="concert-price">$49</div>
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
                <a href="#buy-tickets" class="book-btn"><button type="button" style="color:white;" class="btn" data-toggle="modal" data-target="#buy-ticket-modal" data-ticket-type="premium-access">Book Now</button></a>
              </td>
            </tr>
            
            <!-- Concert 2 -->
            <tr data-genre="bollywood" data-date="2023-04-22" data-price="75">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1501612780327-45045538702b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="concert-image me-3">
                  <div>
                    <div class="concert-name">Bollywood Night Live</div>
                    <div class="concert-stats"><i class="fas fa-user me-1"></i>532 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Artist">
                <div class="concert-artist">Arijit Singh & Neha Kakkar</div>
              </td>
              <td data-label="Venue">
                <div class="concert-venue">GMDC Ground</div>
              </td>
              <td data-label="Date & Time">
                <div class="concert-date">22 APR 2023</div>
                <div class="concert-time">8:30 PM</div>
              </td>
              <td data-label="Price">
                <div class="concert-price">$75</div>
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
                 <a href="#buy-tickets" class="book-btn"><button type="button" style="color:white;" class="btn" data-toggle="modal" data-target="#buy-ticket-modal" data-ticket-type="premium-access">Book Now</button></a>
              </td>
            </tr>
            
            <!-- Concert 3 -->
            <tr data-genre="edm" data-date="2023-04-25" data-price="35">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="concert-image me-3">
                  <div>
                    <div class="concert-name">EDM Festival</div>
                    <div class="concert-stats"><i class="fas fa-user me-1"></i>890 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Artist">
                <div class="concert-artist">DJ Snake, Marshmello</div>
              </td>
              <td data-label="Venue">
                <div class="concert-venue">Ahmedabad Riverfront</div>
              </td>
              <td data-label="Date & Time">
                <div class="concert-date">25 APR 2023</div>
                <div class="concert-time">9:00 PM</div>
              </td>
              <td data-label="Price">
                <div class="concert-price">$35</div>
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
                 <a href="#buy-tickets" class="book-btn"><button type="button" style="color:white;" class="btn" data-toggle="modal" data-target="#buy-ticket-modal" data-ticket-type="premium-access">Book Now</button></a>
              </td>
            </tr>
            
            <!-- Concert 4 -->
            <tr data-genre="classical" data-date="2023-04-28" data-price="60">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1429962714451-bb934ecdc4ec?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="concert-image me-3">
                  <div>
                    <div class="concert-name">Classical Fusion Night</div>
                    <div class="concert-stats"><i class="fas fa-user me-1"></i>320 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Artist">
                <div class="concert-artist">Zakir Hussain & Shankar Mahadevan</div>
              </td>
              <td data-label="Venue">
                <div class="concert-venue">Sardar Patel Hall</div>
              </td>
              <td data-label="Date & Time">
                <div class="concert-date">28 APR 2023</div>
                <div class="concert-time">7:30 PM</div>
              </td>
              <td data-label="Price">
                <div class="concert-price">$60</div>
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
                 <a href="#buy-tickets" class="book-btn"><button type="button" style="color:white;" class="btn" data-toggle="modal" data-target="#buy-ticket-modal" data-ticket-type="premium-access">Book Now</button></a>
              </td>
            </tr>
            
            <!-- Concert 5 -->
            <tr data-genre="indie" data-date="2023-04-30" data-price="45">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1540039155733-5bb30b53aa14?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="concert-image me-3">
                  <div>
                    <div class="concert-name">Indie Band Showcase</div>
                    <div class="concert-stats"><i class="fas fa-user me-1"></i>180 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Artist">
                <div class="concert-artist">5 Local Bands</div>
              </td>
              <td data-label="Venue">
                <div class="concert-venue">Club O7</div>
              </td>
              <td data-label="Date & Time">
                <div class="concert-date">30 APR 2023</div>
                <div class="concert-time">8:00 PM</div>
              </td>
              <td data-label="Price">
                <div class="concert-price">$45</div>
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
                <a href="#buy-tickets" class="book-btn"><button type="button" style="color:white;" class="btn" data-toggle="modal" data-target="#buy-ticket-modal" data-ticket-type="premium-access">Book Now</button></a>
              </td>
            </tr>
            
            <!-- Concert 6 -->
            <tr data-genre="jazz" data-date="2023-05-02" data-price="55">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1514525253161-7a46d19cd819?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="concert-image me-3">
                  <div>
                    <div class="concert-name">Jazz Under the Stars</div>
                    <div class="concert-stats"><i class="fas fa-user me-1"></i>145 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Artist">
                <div class="concert-artist">The Jazz Collective</div>
              </td>
              <td data-label="Venue">
                <div class="concert-venue">Heritage Garden</div>
              </td>
              <td data-label="Date & Time">
                <div class="concert-date">02 MAY 2023</div>
                <div class="concert-time">7:00 PM</div>
              </td>
              <td data-label="Price">
                <div class="concert-price">$55</div>
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
                 <a href="#buy-tickets" class="book-btn"><button type="button" style="color:white;" class="btn" data-toggle="modal" data-target="#buy-ticket-modal" data-ticket-type="premium-access">Book Now</button></a>
              </td>
            </tr>
            
            <!-- Concert 7 -->
            <tr data-genre="pop" data-date="2023-05-05" data-price="120">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="concert-image me-3">
                  <div>
                    <div class="concert-name">Pop Sensation Live</div>
                    <div class="concert-stats"><i class="fas fa-user me-1"></i>720 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Artist">
                <div class="concert-artist">Dua Lipa</div>
              </td>
              <td data-label="Venue">
                <div class="concert-venue">Ahmedabad Arena</div>
              </td>
              <td data-label="Date & Time">
                <div class="concert-date">05 MAY 2023</div>
                <div class="concert-time">8:00 PM</div>
              </td>
              <td data-label="Price">
                <div class="concert-price">$120</div>
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
                 <a href="#buy-tickets" class="book-btn"><button type="button" style="color:white;" class="btn" data-toggle="modal" data-target="#buy-ticket-modal" data-ticket-type="premium-access">Book Now</button></a>
              </td>
            </tr>
            
            <!-- Concert 8 -->
            <tr data-genre="edm" data-date="2023-05-08" data-price="65">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1470225620780-dba8ba36b745?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="concert-image me-3">
                  <div>
                    <div class="concert-name">Electronic Beats</div>
                    <div class="concert-stats"><i class="fas fa-user me-1"></i>310 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Artist">
                <div class="concert-artist">Martin Garrix</div>
              </td>
              <td data-label="Venue">
                <div class="concert-venue">Party Park</div>
              </td>
              <td data-label="Date & Time">
                <div class="concert-date">08 MAY 2023</div>
                <div class="concert-time">10:00 PM</div>
              </td>
              <td data-label="Price">
                <div class="concert-price">$65</div>
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
              <a href="#buy-tickets" class="book-btn"><button type="button" style="color:white;" class="btn" data-toggle="modal" data-target="#buy-ticket-modal" data-ticket-type="premium-access">Book Now</button></a>
              </td>
            </tr>
            
            <!-- Concert 9 -->
            <tr data-genre="rock" data-date="2023-05-12" data-price="70">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="concert-image me-3">
                  <div>
                    <div class="concert-name">Classic Rock Revival</div>
                    <div class="concert-stats"><i class="fas fa-user me-1"></i>420 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Artist">
                <div class="concert-artist">The Rolling Tones</div>
              </td>
              <td data-label="Venue">
                <div class="concert-venue">Retro Arena</div>
              </td>
              <td data-label="Date & Time">
                <div class="concert-date">12 MAY 2023</div>
                <div class="concert-time">7:30 PM</div>
              </td>
              <td data-label="Price">
                <div class="concert-price">$70</div>
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
                <a href="#buy-tickets" class="book-btn"><button type="button" style="color:white;" class="btn" data-toggle="modal" data-target="#buy-ticket-modal" data-ticket-type="premium-access">Book Now</button></a>
              </td>
            </tr>
            
            <!-- Concert 10 -->
            <tr data-genre="country" data-date="2023-05-15" data-price="40">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1499415479124-43c32433a620?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="concert-image me-3">
                  <div>
                    <div class="concert-name">Country Music Night</div>
                    <div class="concert-stats"><i class="fas fa-user me-1"></i>190 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Artist">
                <div class="concert-artist">The Outlaws</div>
              </td>
              <td data-label="Venue">
                <div class="concert-venue">Western Grounds</div>
              </td>
              <td data-label="Date & Time">
                <div class="concert-date">15 MAY 2023</div>
                <div class="concert-time">6:30 PM</div>
              </td>
              <td data-label="Price">
                <div class="concert-price">$40</div>
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
                <a href="#buy-tickets" class="book-btn"><button type="button" style="color:white;" class="btn" data-toggle="modal" data-target="#buy-ticket-modal" data-ticket-type="premium-access">Book Now</button></a>
              </td>
            </tr>
          </tbody>
        </table>
        <div id="no-results" class="no-results">
          <i class="fas fa-search fa-3x mb-3"></i>
          <h4>No concerts match your filters</h4>
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
      const dateFilter = document.getElementById('date-filter');
      const genreFilter = document.getElementById('genre-filter');
      const priceFilter = document.getElementById('price-filter');
      const resetButton = document.getElementById('reset-filters');
      const concertRows = document.querySelectorAll('#concert-table-body tr');
      const noResults = document.getElementById('no-results');
      
      // Add event listeners to filters
      dateFilter.addEventListener('change', filterConcerts);
      genreFilter.addEventListener('change', filterConcerts);
      priceFilter.addEventListener('change', filterConcerts);
      resetButton.addEventListener('click', resetFilters);
      
      // Add event listeners to book buttons
      const bookButtons = document.querySelectorAll('.book-btn');
      bookButtons.forEach(button => {
        button.addEventListener('click', function() {
          const eventName = this.closest('tr').querySelector('.concert-name').textContent;
/*           alert(`Booking initiated for: ${eventName}`); */
        });
      });
      
      // Filter concerts based on selected filters
      function filterConcerts() {
        const selectedDate = dateFilter.value;
        const selectedGenre = genreFilter.value;
        const selectedPrice = priceFilter.value;
        
        let visibleCount = 0;
        
        concertRows.forEach(row => {
          const rowDate = row.getAttribute('data-date');
          const rowGenre = row.getAttribute('data-genre');
          const rowPrice = parseFloat(row.getAttribute('data-price'));
          
          // Check if row matches all selected filters
          const dateMatch = selectedDate === 'all' || checkDateMatch(selectedDate, rowDate);
          const genreMatch = selectedGenre === 'all' || rowGenre === selectedGenre;
          const priceMatch = selectedPrice === 'all' || checkPriceMatch(selectedPrice, rowPrice);
          
          if (dateMatch && genreMatch && priceMatch) {
            row.style.display = '';
            visibleCount++;
          } else {
            row.style.display = 'none';
          }
        });
        
        // Show no results message if no concerts match filters
        if (visibleCount === 0) {
          noResults.style.display = 'block';
        } else {
          noResults.style.display = 'none';
        }
      }
      
      // Check if row date matches selected date filter
      function checkDateMatch(selectedDate, rowDate) {
        const today = new Date();
        const concertDate = new Date(rowDate);
        
        switch(selectedDate) {
          case 'this-week':
            const nextWeek = new Date();
            nextWeek.setDate(today.getDate() + 7);
            return concertDate >= today && concertDate <= nextWeek;
          case 'next-week':
            const nextWeekStart = new Date();
            nextWeekStart.setDate(today.getDate() + 7);
            const nextWeekEnd = new Date();
            nextWeekEnd.setDate(today.getDate() + 14);
            return concertDate >= nextWeekStart && concertDate <= nextWeekEnd;
          case 'this-month':
            const endOfMonth = new Date(today.getFullYear(), today.getMonth() + 1, 0);
            return concertDate >= today && concertDate <= endOfMonth;
          default:
            return true;
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
      
      // Reset all filters
      function resetFilters() {
        dateFilter.value = 'all';
        genreFilter.value = 'all';
        priceFilter.value = 'all';
        filterConcerts();
      }
      
      // Initial filter on page load
      filterConcerts();
    });
  </script>
</body>
</html>
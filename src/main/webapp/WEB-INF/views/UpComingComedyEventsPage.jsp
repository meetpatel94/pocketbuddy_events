<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Comedy Events Table</title>
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
    
    .comedy-table {
      width: 100%;
      border-collapse: separate;
      border-spacing: 0 12px;
    }
    
    .comedy-table thead th {
      position: sticky;
      top: 0;
      background-color: var(--primary-color);
      color: white;
      padding: 15px;
      text-align: left;
      z-index: 10;
    }
    
    .comedy-table tbody tr {
      background-color: white;
      box-shadow: 0 2px 10px rgba(0,0,0,0.05);
      transition: all 0.3s ease;
    }
    
    .comedy-table tbody tr:hover {
      transform: translateY(-3px);
      box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    }
    
    .comedy-table td {
      padding: 15px;
      vertical-align: middle;
      border-top: 1px solid #f0f0f0;
      border-bottom: 1px solid #f0f0f0;
    }
    
    .comedy-table td:first-child {
      border-left: 1px solid #f0f0f0;
      border-radius: 8px 0 0 8px;
    }
    
    .comedy-table td:last-child {
      border-right: 1px solid #f0f0f0;
      border-radius: 0 8px 8px 0;
    }
    
    .comedy-image {
      width: 80px;
      height: 60px;
      border-radius: 5px;
      object-fit: cover;
      transition: transform 0.3s;
    }
    
    .comedy-image:hover {
      transform: scale(1.1);
    }
    
    .comedy-name {
      color: var(--primary-color);
      font-weight: 600;
      margin-bottom: 5px;
    }
    
    .comedy-comedian {
      color: var(--secondary-color);
      font-size: 14px;
    }
    
    .comedy-venue {
      color: #555;
      font-size: 14px;
    }
    
    .comedy-date {
      font-weight: 500;
    }
    
    .comedy-time {
      color: #777;
      font-size: 13px;
    }
    
    .comedy-price {
      font-weight: bold;
      color: var(--primary-color);
    }
    
    .comedy-stats {
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
      
      .comedy-table thead {
        display: none;
      }
      
      .comedy-table tbody tr {
        display: block;
        margin-bottom: 15px;
        border-radius: 8px;
      }
      
      .comedy-table td {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px;
        border: none;
        border-bottom: 1px solid #f0f0f0;
      }
      
      .comedy-table td:before {
        content: attr(data-label);
        font-weight: bold;
        color: var(--primary-color);
        margin-right: 10px;
      }
      
      .comedy-table td:first-child,
      .comedy-table td:last-child {
        border-radius: 0;
      }
      
      .comedy-table td:first-child {
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
        <h2>Upcoming Comedy Shows</h2>
        <p>Laugh Out Loud with Top Comedians</p>
      </div>
      
      <!-- Filter Controls -->
      <div class="filter-controls row g-3">
        <div class="col-md-3">
          <label for="genre-filter" class="form-label">Filter by Type</label>
          <select id="genre-filter" class="form-select">
            <option value="all">All Types</option>
            <option value="standup">Stand-Up Comedy</option>
            <option value="improv">Improv Comedy</option>
            <option value="sketch">Sketch Comedy</option>
            <option value="satire">Satire/Parody</option>
            <option value="roast">Roast Battles</option>
          </select>
        </div>
        <div class="col-md-3">
          <label for="price-filter" class="form-label">Filter by Price</label>
          <select id="price-filter" class="form-select">
            <option value="all">All Prices</option>
            <option value="under-20">Under $20</option>
            <option value="20-40">$20 - $40</option>
            <option value="40-80">$40 - $80</option>
            <option value="over-80">Over $80</option>
          </select>
        </div>
        <div class="col-md-3 d-flex align-items-end">
          <button id="reset-filters" class="btn btn-outline-secondary w-100">Reset Filters</button>
        </div>
      </div>
      
      <!-- Comedy Table Section -->
      <div class="table-container">
        <table class="comedy-table">
          <thead>
            <tr>
              <th>Event</th>
              <th>Comedian</th>
              <th>Venue</th>
              <th>Date & Time</th>
              <th>Price</th>
              <th>Rating</th>
              <th>Status</th>
              <!-- <th>Action</th> -->
            </tr>
          </thead>
          <tbody id="comedy-table-body">
            <!-- Comedy 1 -->
            <tr data-genre="standup" data-date="2023-04-18" data-price="35">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1551818255-e6e10975bc17?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="comedy-image me-3">
                  <div>
                    <div class="comedy-name">Laugh Factory Night</div>
                    <div class="comedy-stats"><i class="fas fa-user me-1"></i>185 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Comedian">
                <div class="comedy-comedian">Zakir Khan</div>
              </td>
              <td data-label="Venue">
                <div class="comedy-venue">Narendra Modi Stadium</div>
              </td>
              <td data-label="Date & Time">
                <div class="comedy-date">18 APR 2023</div>
                <div class="comedy-time">7:00 PM</div>
              </td>
              <td data-label="Price">
                <div class="comedy-price">$35</div>
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
            
            <!-- Comedy 2 -->
            <tr data-genre="improv" data-date="2023-04-22" data-price="45">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1547153760-18fc86324498?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="comedy-image me-3">
                  <div>
                    <div class="comedy-name">Improv Madness</div>
                    <div class="comedy-stats"><i class="fas fa-user me-1"></i>132 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Comedian">
                <div class="comedy-comedian">Kaneez Surka & Team</div>
              </td>
              <td data-label="Venue">
                <div class="comedy-venue">GMDC Ground</div>
              </td>
              <td data-label="Date & Time">
                <div class="comedy-date">22 APR 2023</div>
                <div class="comedy-time">8:30 PM</div>
              </td>
              <td data-label="Price">
                <div class="comedy-price">$45</div>
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
            
            <!-- Comedy 3 -->
            <tr data-genre="standup" data-date="2023-04-25" data-price="25">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1545665277-5937489579f2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="comedy-image me-3">
                  <div>
                    <div class="comedy-name">Comedy Central Presents</div>
                    <div class="comedy-stats"><i class="fas fa-user me-1"></i>290 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Comedian">
                <div class="comedy-comedian">Biswa Kalyan Rath</div>
              </td>
              <td data-label="Venue">
                <div class="comedy-venue">Ahmedabad Riverfront</div>
              </td>
              <td data-label="Date & Time">
                <div class="comedy-date">25 APR 2023</div>
                <div class="comedy-time">9:00 PM</div>
              </td>
              <td data-label="Price">
                <div class="comedy-price">$25</div>
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
            
            <!-- Comedy 4 -->
            <tr data-genre="satire" data-date="2023-04-28" data-price="40">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1517457373958-b7bdd4587205?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="comedy-image me-3">
                  <div>
                    <div class="comedy-name">Political Satire Night</div>
                    <div class="comedy-stats"><i class="fas fa-user me-1"></i>220 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Comedian">
                <div class="comedy-comedian">Kunal Kamra</div>
              </td>
              <td data-label="Venue">
                <div class="comedy-venue">Sardar Patel Hall</div>
              </td>
              <td data-label="Date & Time">
                <div class="comedy-date">28 APR 2023</div>
                <div class="comedy-time">7:30 PM</div>
              </td>
              <td data-label="Price">
                <div class="comedy-price">$40</div>
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
            
            <!-- Comedy 5 -->
            <tr data-genre="roast" data-date="2023-04-30" data-price="55">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1498206005704-36d87df55281?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="comedy-image me-3">
                  <div>
                    <div class="comedy-name">Roast Battle Championship</div>
                    <div class="comedy-stats"><i class="fas fa-user me-1"></i>380 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Comedian">
                <div class="comedy-comedian">Kenny Sebastian & Others</div>
              </td>
              <td data-label="Venue">
                <div class="comedy-venue">Club O7</div>
              </td>
              <td data-label="Date & Time">
                <div class="comedy-date">30 APR 2023</div>
                <div class="comedy-time">8:00 PM</div>
              </td>
              <td data-label="Price">
                <div class="comedy-price">$55</div>
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
            
            <!-- Comedy 6 -->
            <tr data-genre="standup" data-date="2023-05-02" data-price="30">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1505236858219-8359eb29e329?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="comedy-image me-3">
                  <div>
                    <div class="comedy-name">Stand-Up Special</div>
                    <div class="comedy-stats"><i class="fas fa-user me-1"></i>245 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Comedian">
                <div class="comedy-comedian">Vir Das</div>
              </td>
              <td data-label="Venue">
                <div class="comedy-venue">Heritage Garden</div>
              </td>
              <td data-label="Date & Time">
                <div class="comedy-date">02 MAY 2023</div>
                <div class="comedy-time">7:00 PM</div>
              </td>
              <td data-label="Price">
                <div class="comedy-price">$30</div>
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
            
            <!-- Comedy 7 -->
            <tr data-genre="sketch" data-date="2023-05-05" data-price="50">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="comedy-image me-3">
                  <div>
                    <div class="comedy-name">Sketch Comedy Extravaganza</div>
                    <div class="comedy-stats"><i class="fas fa-user me-1"></i>120 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Comedian">
                <div class="comedy-comedian">AIB Team</div>
              </td>
              <td data-label="Venue">
                <div class="comedy-venue">Ahmedabad Arena</div>
              </td>
              <td data-label="Date & Time">
                <div class="comedy-date">05 MAY 2023</div>
                <div class="comedy-time">8:00 PM</div>
              </td>
              <td data-label="Price">
                <div class="comedy-price">$50</div>
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
            
            <!-- Comedy 8 -->
            <tr data-genre="standup" data-date="2023-05-08" data-price="65">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1547153760-18fc86324498?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="comedy-image me-3">
                  <div>
                    <div class="comedy-name">Premium Comedy Night</div>
                    <div class="comedy-stats"><i class="fas fa-user me-1"></i>210 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Comedian">
                <div class="comedy-comedian">Rahul Subramanian</div>
              </td>
              <td data-label="Venue">
                <div class="comedy-venue">Party Park</div>
              </td>
              <td data-label="Date & Time">
                <div class="comedy-date">08 MAY 2023</div>
                <div class="comedy-time">10:00 PM</div>
              </td>
              <td data-label="Price">
                <div class="comedy-price">$65</div>
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
            
            <!-- Comedy 9 -->
            <tr data-genre="standup" data-date="2023-05-12" data-price="40">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1551818255-e6e10975bc17?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="comedy-image me-3">
                  <div>
                    <div class="comedy-name">Weekend Laughs</div>
                    <div class="comedy-stats"><i class="fas fa-user me-1"></i>320 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Comedian">
                <div class="comedy-comedian">Anubhav Singh Bassi</div>
              </td>
              <td data-label="Venue">
                <div class="comedy-venue">Retro Arena</div>
              </td>
              <td data-label="Date & Time">
                <div class="comedy-date">12 MAY 2023</div>
                <div class="comedy-time">7:30 PM</div>
              </td>
              <td data-label="Price">
                <div class="comedy-price">$40</div>
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
            
            <!-- Comedy 10 -->
            <tr data-genre="improv" data-date="2023-05-15" data-price="35">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1517457373958-b7bdd4587205?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="comedy-image me-3">
                  <div>
                    <div class="comedy-name">Improv Jam Session</div>
                    <div class="comedy-stats"><i class="fas fa-user me-1"></i>90 interested</div>
                  </div>
                </div>
              </td>
              <td data-label="Comedian">
                <div class="comedy-comedian">The Improv Collective</div>
              </td>
              <td data-label="Venue">
                <div class="comedy-venue">Western Grounds</div>
              </td>
              <td data-label="Date & Time">
                <div class="comedy-date">15 MAY 2023</div>
                <div class="comedy-time">6:30 PM</div>
              </td>
              <td data-label="Price">
                <div class="comedy-price">$35</div>
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
          <h4>No comedy shows match your filters</h4>
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
      const comedyRows = document.querySelectorAll('#comedy-table-body tr');
      const noResults = document.getElementById('no-results');
      
      // Add event listeners to filters
      dateFilter.addEventListener('change', filterComedyShows);
      genreFilter.addEventListener('change', filterComedyShows);
      priceFilter.addEventListener('change', filterComedyShows);
      resetButton.addEventListener('click', resetFilters);
      
      // Add event listeners to book buttons
      const bookButtons = document.querySelectorAll('.book-btn');
      bookButtons.forEach(button => {
        button.addEventListener('click', function() {
          const eventName = this.closest('tr').querySelector('.comedy-name').textContent;
/*           alert(`Booking initiated for: ${eventName}`); */
        });
      });
      
      // Filter comedy shows based on selected filters
      function filterComedyShows() {
        const selectedDate = dateFilter ? dateFilter.value : 'all';
        const selectedGenre = genreFilter.value;
        const selectedPrice = priceFilter.value;
        
        let visibleCount = 0;
        
        comedyRows.forEach(row => {
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
        
        // Show no results message if no comedy shows match filters
        if (visibleCount === 0) {
          noResults.style.display = 'block';
        } else {
          noResults.style.display = 'none';
        }
      }
      
      // Check if row date matches selected date filter
      function checkDateMatch(selectedDate, rowDate) {
        const today = new Date();
        const showDate = new Date(rowDate);
        
        switch(selectedDate) {
          case 'this-week':
            const nextWeek = new Date();
            nextWeek.setDate(today.getDate() + 7);
            return showDate >= today && showDate <= nextWeek;
          case 'next-week':
            const nextWeekStart = new Date();
            nextWeekStart.setDate(today.getDate() + 7);
            const nextWeekEnd = new Date();
            nextWeekEnd.setDate(today.getDate() + 14);
            return showDate >= nextWeekStart && showDate <= nextWeekEnd;
          case 'this-month':
            const endOfMonth = new Date(today.getFullYear(), today.getMonth() + 1, 0);
            return showDate >= today && showDate <= endOfMonth;
          default:
            return true;
        }
      }
      
      // Check if row price matches selected price filter
      function checkPriceMatch(selectedPrice, rowPrice) {
        switch(selectedPrice) {
          case 'under-20':
            return rowPrice < 20;
          case '20-40':
            return rowPrice >= 20 && rowPrice <= 40;
          case '40-80':
            return rowPrice > 40 && rowPrice <= 80;
          case 'over-80':
            return rowPrice > 80;
          default:
            return true;
        }
      }
      
      // Reset all filters
      function resetFilters() {
        if (dateFilter) dateFilter.value = 'all';
        genreFilter.value = 'all';
        priceFilter.value = 'all';
        filterComedyShows();
      }
      
      // Initial filter on page load
      filterComedyShows();
    });
  </script>
</body>
</html>
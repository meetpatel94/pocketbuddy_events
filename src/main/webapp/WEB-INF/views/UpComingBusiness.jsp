<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Business Events Table</title>
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
    
    .business-table {
      width: 100%;
      border-collapse: separate;
      border-spacing: 0 12px;
    }
    
    .business-table thead th {
      position: sticky;
      top: 0;
      background-color: var(--primary-color);
      color: white;
      padding: 15px;
      text-align: left;
      z-index: 10;
    }
    
    .business-table tbody tr {
      background-color: white;
      box-shadow: 0 2px 10px rgba(0,0,0,0.05);
      transition: all 0.3s ease;
    }
    
    .business-table tbody tr:hover {
      transform: translateY(-3px);
      box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    }
    
    .business-table td {
      padding: 15px;
      vertical-align: middle;
      border-top: 1px solid #f0f0f0;
      border-bottom: 1px solid #f0f0f0;
    }
    
    .business-table td:first-child {
      border-left: 1px solid #f0f0f0;
      border-radius: 8px 0 0 8px;
    }
    
    .business-table td:last-child {
      border-right: 1px solid #f0f0f0;
      border-radius: 0 8px 8px 0;
    }
    
    .business-image {
      width: 80px;
      height: 60px;
      border-radius: 5px;
      object-fit: cover;
      transition: transform 0.3s;
    }
    
    .business-image:hover {
      transform: scale(1.1);
    }
    
    .business-name {
      color: var(--primary-color);
      font-weight: 600;
      margin-bottom: 5px;
    }
    
    .business-organizer {
      color: var(--secondary-color);
      font-size: 14px;
    }
    
    .business-venue {
      color: #555;
      font-size: 14px;
    }
    
    .business-date {
      font-weight: 500;
    }
    
    .business-time {
      color: #777;
      font-size: 13px;
    }
    
    .business-price {
      font-weight: bold;
      color: var(--primary-color);
    }
    
    .business-stats {
      font-size: 13px;
      color: #777;
    }
    
    .register-btn {
      background: var(--primary-color);
      color: white;
      border: none;
      padding: 3px 7px;
      border-radius: 5px;
      transition: all 0.3s;
      white-space: nowrap;
    }
    
    .register-btn:hover {
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
      
      .business-table thead {
        display: none;
      }
      
      .business-table tbody tr {
        display: block;
        margin-bottom: 15px;
        border-radius: 8px;
      }
      
      .business-table td {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px;
        border: none;
        border-bottom: 1px solid #f0f0f0;
      }
      
      .business-table td:before {
        content: attr(data-label);
        font-weight: bold;
        color: var(--primary-color);
        margin-right: 10px;
      }
      
      .business-table td:first-child,
      .business-table td:last-child {
        border-radius: 0;
      }
      
      .business-table td:first-child {
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
        <h2>Upcoming Business Events</h2>
        <p>Networking, Conferences & Workshops</p>
      </div>
      
      <!-- Filter Controls -->
      <div class="filter-controls row g-3">
        
        <div class="col-md-3">
          <label for="category-filter" class="form-label">Filter by Category</label>
          <select id="category-filter" class="form-select">
            <option value="all">All Categories</option>
            <option value="conference">Conference</option>
            <option value="workshop">Workshop</option>
            <option value="seminar">Seminar</option>
            <option value="networking">Networking</option>
            <option value="exhibition">Exhibition</option>
            <option value="trade-show">Trade Show</option>
            <option value="summit">Summit</option>
          </select>
        </div>
        <div class="col-md-3">
          <label for="price-filter" class="form-label">Filter by Price</label>
          <select id="price-filter" class="form-select">
            <option value="all">All Prices</option>
            <option value="free">Free</option>
            <option value="under-100">Under $100</option>
            <option value="100-500">$100 - $500</option>
            <option value="500-2000">$500 - $200</option>
            <option value="over-2000">Over $200</option>
          </select>
        </div>
        <div class="col-md-3 d-flex align-items-end" style="margin-top:48px;">
          <button id="reset-filters" class="btn btn-outline-secondary w-100">Reset Filters</button>
        </div>
      </div>
      
      <!-- Business Events Table Section -->
      <div class="table-container">
        <table class="business-table">
          <thead>
            <tr>
              <th>Event</th>
              <th>Organizer</th>
              <th>Venue</th>
              <th>Date & Time</th>
              <th>Price</th>
              <th>Rating</th>
              <th>Status</th>
              <!-- <th>Action</th> -->
            </tr>
          </thead>
          <tbody id="business-table-body">
            <!-- Business Event 1 -->
            <tr data-category="conference" data-date="2023-04-18" data-price="5000">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1431540015161-0bf868a2d407?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="business-image me-3">
                  <div>
                    <div class="business-name">India Tech Summit 2023</div>
                    <div class="business-stats"><i class="fas fa-user me-1"></i>1,250 attending</div>
                  </div>
                </div>
              </td>
              <td data-label="Organizer">
                <div class="business-organizer">Tech Media India</div>
              </td>
              <td data-label="Venue">
                <div class="business-venue">Bombay Exhibition Center</div>
              </td>
              <td data-label="Date & Time">
                <div class="business-date">18 APR 2023</div>
                <div class="business-time">9:00 AM - 6:00 PM</div>
              </td>
              <td data-label="Price">
                <div class="business-price">$50</div>
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
                <span class="status-badge status-selling-fast">Limited Seats</span>
              </td>
              <td data-label="Action">
                <a href="#register" class="register-btn"><button type="button" style="color:white;" class="btn" data-toggle="modal" data-target="#register-modal">Register Now</button></a>
              </td>
            </tr>
            
            <!-- Business Event 2 -->
            <tr data-category="workshop" data-date="2023-04-20" data-price="2500">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1522202176988-66273c2fd55f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="business-image me-3">
                  <div>
                    <div class="business-name">Digital Marketing Masterclass</div>
                    <div class="business-stats"><i class="fas fa-user me-1"></i>85 attending</div>
                  </div>
                </div>
              </td>
              <td data-label="Organizer">
                <div class="business-organizer">Marketing Pro Academy</div>
              </td>
              <td data-label="Venue">
                <div class="business-venue">Taj Lands End, Mumbai</div>
              </td>
              <td data-label="Date & Time">
                <div class="business-date">20 APR 2023</div>
                <div class="business-time">10:00 AM - 4:00 PM</div>
              </td>
              <td data-label="Price">
                <div class="business-price">$250</div>
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
                <a href="#register" class="register-btn"><button type="button" style="color:white;" class="btn" data-toggle="modal" data-target="#register-modal">Register Now</button></a>
              </td>
            </tr>
            
            <!-- Business Event 3 -->
            <tr data-category="networking" data-date="2023-04-22" data-price="0">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1521737711867-e3b97375f902?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="business-image me-3">
                  <div>
                    <div class="business-name">Startup Founders Meetup</div>
                    <div class="business-stats"><i class="fas fa-user me-1"></i>320 attending</div>
                  </div>
                </div>
              </td>
              <td data-label="Organizer">
                <div class="business-organizer">Startup India Network</div>
              </td>
              <td data-label="Venue">
                <div class="business-venue">WeWork Nariman Point</div>
              </td>
              <td data-label="Date & Time">
                <div class="business-date">22 APR 2023</div>
                <div class="business-time">6:00 PM - 9:00 PM</div>
              </td>
              <td data-label="Price">
                <div class="business-price">Free</div>
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
                <span class="status-badge status-selling-fast">Limited Seats</span>
              </td>
              <td data-label="Action">
                <a href="#register" class="register-btn"><button type="button" style="color:white;" class="btn" data-toggle="modal" data-target="#register-modal">Register Now</button></a>
              </td>
            </tr>
            
            <!-- Business Event 4 -->
            <tr data-category="seminar" data-date="2023-04-25" data-price="1500">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1551288049-bebda4e38f71?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="business-image me-3">
                  <div>
                    <div class="business-name">AI in Business Seminar</div>
                    <div class="business-stats"><i class="fas fa-user me-1"></i>210 attending</div>
                  </div>
                </div>
              </td>
              <td data-label="Organizer">
                <div class="business-organizer">Future Tech Institute</div>
              </td>
              <td data-label="Venue">
                <div class="business-venue">ITC Grand Central, Mumbai</div>
              </td>
              <td data-label="Date & Time">
                <div class="business-date">25 APR 2023</div>
                <div class="business-time">2:00 PM - 5:00 PM</div>
              </td>
              <td data-label="Price">
                <div class="business-price">$15.0</div>
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
                <a href="#register" class="register-btn"><button type="button" style="color:white;" class="btn" data-toggle="modal" data-target="#register-modal">Register Now</button></a>
              </td>
            </tr>
            
            <!-- Business Event 5 -->
            <tr data-category="exhibition" data-date="2023-04-28" data-price="0">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1497366811353-6870744d04b2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="business-image me-3">
                  <div>
                    <div class="business-name">FinTech Expo 2023</div>
                    <div class="business-stats"><i class="fas fa-user me-1"></i>1,850 attending</div>
                  </div>
                </div>
              </td>
              <td data-label="Organizer">
                <div class="business-organizer">Financial Times Group</div>
              </td>
              <td data-label="Venue">
                <div class="business-venue">Jio World Convention Center</div>
              </td>
              <td data-label="Date & Time">
                <div class="business-date">28 APR 2023</div>
                <div class="business-time">10:00 AM - 6:00 PM</div>
              </td>
              <td data-label="Price">
                <div class="business-price">Free</div>
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
                <a href="#register" class="register-btn"><button type="button" style="color:white;" class="btn" data-toggle="modal" data-target="#register-modal">Register Now</button></a>
              </td>
            </tr>
            
            <!-- Business Event 6 -->
            <tr data-category="trade-show" data-date="2023-05-02" data-price="2000">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1434030216411-0b793f4b4173?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="business-image me-3">
                  <div>
                    <div class="business-name">Manufacturing Trade Show</div>
                    <div class="business-stats"><i class="fas fa-user me-1"></i>650 attending</div>
                  </div>
                </div>
              </td>
              <td data-label="Organizer">
                <div class="business-organizer">India Manufacturing Council</div>
              </td>
              <td data-label="Venue">
                <div class="business-venue">Pragati Maidan, Delhi</div>
              </td>
              <td data-label="Date & Time">
                <div class="business-date">02 MAY 2023</div>
                <div class="business-time">9:30 AM - 5:30 PM</div>
              </td>
              <td data-label="Price">
                <div class="business-price">$20.00</div>
              </td>
              <td data-label="Rating">
                <div class="rating">
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <span class="ms-1">4.9</span>
                </div>
              </td>
              <td data-label="Status">
                <span class="status-badge status-selling-fast">Limited Seats</span>
              </td>
              <td data-label="Action">
                <a href="#register" class="register-btn"><button type="button" style="color:white;" class="btn" data-toggle="modal" data-target="#register-modal">Register Now</button></a>
              </td>
            </tr>
            
            <!-- Business Event 7 -->
            <tr data-category="summit" data-date="2023-05-05" data-price="15000">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1522071820081-009f0129c71c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="business-image me-3">
                  <div>
                    <div class="business-name">CEO Leadership Summit</div>
                    <div class="business-stats"><i class="fas fa-user me-1"></i>120 attending</div>
                  </div>
                </div>
              </td>
              <td data-label="Organizer">
                <div class="business-organizer">Global Business Leaders</div>
              </td>
              <td data-label="Venue">
                <div class="business-venue">The Oberoi, Mumbai</div>
              </td>
              <td data-label="Date & Time">
                <div class="business-date">05 MAY 2023</div>
                <div class="business-time">8:00 AM - 7:00 PM</div>
              </td>
              <td data-label="Price">
                <div class="business-price">$150.0</div>
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
                <a href="#register" class="register-btn"><button type="button" style="color:white;" class="btn" data-toggle="modal" data-target="#register-modal">Register Now</button></a>
              </td>
            </tr>
            
            <!-- Business Event 8 -->
            <tr data-category="workshop" data-date="2023-05-08" data-price="3500">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1542744173-8e7e53415bb0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="business-image me-3">
                  <div>
                    <div class="business-name">Data Science Workshop</div>
                    <div class="business-stats"><i class="fas fa-user me-1"></i>95 attending</div>
                  </div>
                </div>
              </td>
              <td data-label="Organizer">
                <div class="business-organizer">Data Science India</div>
              </td>
              <td data-label="Venue">
                <div class="business-venue">Taj Santacruz, Mumbai</div>
              </td>
              <td data-label="Date & Time">
                <div class="business-date">08 MAY 2023</div>
                <div class="business-time">9:30 AM - 5:30 PM</div>
              </td>
              <td data-label="Price">
                <div class="business-price">$35.56</div>
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
                <a href="#register" class="register-btn"><button type="button" style="color:white;" class="btn" data-toggle="modal" data-target="#register-modal">Register Now</button></a>
              </td>
            </tr>
            
            <!-- Business Event 9 -->
            <tr data-category="conference" data-date="2023-05-12" data-price="8000">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1505373877841-8d25f7d46678?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="business-image me-3">
                  <div>
                    <div class="business-name">HR Innovation Conference</div>
                    <div class="business-stats"><i class="fas fa-user me-1"></i>280 attending</div>
                  </div>
                </div>
              </td>
              <td data-label="Organizer">
                <div class="business-organizer">HR Leaders Forum</div>
              </td>
              <td data-label="Venue">
                <div class="business-venue">The Lalit, Mumbai</div>
              </td>
              <td data-label="Date & Time">
                <div class="business-date">12 MAY 2023</div>
                <div class="business-time">8:30 AM - 6:00 PM</div>
              </td>
              <td data-label="Price">
                <div class="business-price">$80</div>
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
                <span class="status-badge status-selling-fast">Limited Seats</span>
              </td>
              <td data-label="Action">
                <a href="#register" class="register-btn"><button type="button" style="color:white;" class="btn" data-toggle="modal" data-target="#register-modal">Register Now</button></a>
              </td>
            </tr>
            
            <!-- Business Event 10 -->
            <tr data-category="networking" data-date="2023-05-15" data-price="0">
              <td data-label="Event">
                <div class="d-flex align-items-center">
                  <img src="https://images.unsplash.com/photo-1521737604893-d14cc237f11d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=200&q=80" 
                       class="business-image me-3">
                  <div>
                    <div class="business-name">Women in Business Mixer</div>
                    <div class="business-stats"><i class="fas fa-user me-1"></i>180 attending</div>
                  </div>
                </div>
              </td>
              <td data-label="Organizer">
                <div class="business-organizer">Women Entrepreneurs Network</div>
              </td>
              <td data-label="Venue">
                <div class="business-venue">St. Regis, Mumbai</div>
              </td>
              <td data-label="Date & Time">
                <div class="business-date">15 MAY 2023</div>
                <div class="business-time">6:30 PM - 9:30 PM</div>
              </td>
              <td data-label="Price">
                <div class="business-price">Free</div>
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
                <a href="#register" class="register-btn"><button type="button" style="color:white;" class="btn" data-toggle="modal" data-target="#register-modal">Register Now</button></a>
              </td>
            </tr>
          </tbody>
        </table>
        <div id="no-results" class="no-results">
          <i class="fas fa-search fa-3x mb-3"></i>
          <h4>No business events match your filters</h4>
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
      const categoryFilter = document.getElementById('category-filter');
      const priceFilter = document.getElementById('price-filter');
      const resetButton = document.getElementById('reset-filters');
      const businessRows = document.querySelectorAll('#business-table-body tr');
      const noResults = document.getElementById('no-results');
      
      // Add event listeners to filters
      dateFilter.addEventListener('change', filterBusinessEvents);
      categoryFilter.addEventListener('change', filterBusinessEvents);
      priceFilter.addEventListener('change', filterBusinessEvents);
      resetButton.addEventListener('click', resetFilters);
      
      // Add event listeners to register buttons
      const registerButtons = document.querySelectorAll('.register-btn');
      registerButtons.forEach(button => {
        button.addEventListener('click', function() {
          const eventName = this.closest('tr').querySelector('.business-name').textContent;
          /* alert(`Registration initiated for: ${eventName}`); */
        });
      });
      
      // Filter business events based on selected filters
      function filterBusinessEvents() {
        const selectedDate = dateFilter.value;
        const selectedCategory = categoryFilter.value;
        const selectedPrice = priceFilter.value;
        
        let visibleCount = 0;
        
        businessRows.forEach(row => {
          const rowDate = row.getAttribute('data-date');
          const rowCategory = row.getAttribute('data-category');
          const rowPrice = parseFloat(row.getAttribute('data-price'));
          
          // Check if row matches all selected filters
          const dateMatch = selectedDate === 'all' || checkDateMatch(selectedDate, rowDate);
          const categoryMatch = selectedCategory === 'all' || rowCategory === selectedCategory;
          const priceMatch = selectedPrice === 'all' || checkPriceMatch(selectedPrice, rowPrice);
          
          if (dateMatch && categoryMatch && priceMatch) {
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
      
      // Check if row date matches selected date filter
      function checkDateMatch(selectedDate, rowDate) {
        const today = new Date();
        const eventDate = new Date(rowDate);
        
        switch(selectedDate) {
          case 'today':
            return eventDate.toDateString() === today.toDateString();
          case 'this-week':
            const nextWeek = new Date();
            nextWeek.setDate(today.getDate() + 7);
            return eventDate >= today && eventDate <= nextWeek;
          case 'next-week':
            const nextWeekStart = new Date();
            nextWeekStart.setDate(today.getDate() + 7);
            const nextWeekEnd = new Date();
            nextWeekEnd.setDate(today.getDate() + 14);
            return eventDate >= nextWeekStart && eventDate <= nextWeekEnd;
          case 'this-month':
            const endOfMonth = new Date(today.getFullYear(), today.getMonth() + 1, 0);
            return eventDate >= today && eventDate <= endOfMonth;
          default:
            return true;
        }
      }
      
      // Check if row price matches selected price filter
      function checkPriceMatch(selectedPrice, rowPrice) {
        switch(selectedPrice) {
          case 'free':
            return rowPrice === 0;
          case 'under-100':
            return rowPrice > 0 && rowPrice < 1000;
          case '100-500':
            return rowPrice >= 1000 && rowPrice <= 5000;
          case '500-2000':
            return rowPrice > 5000 && rowPrice <= 20000;
          case 'over-2000':
            return rowPrice > 20000;
          default:
            return true;
        }
      }
      
      // Reset all filters
      function resetFilters() {
        dateFilter.value = 'all';
        categoryFilter.value = 'all';
        priceFilter.value = 'all';
        filterBusinessEvents();
      }
      
      // Initial filter on page load
      filterBusinessEvents();
    });
  </script>
</body>
</html>
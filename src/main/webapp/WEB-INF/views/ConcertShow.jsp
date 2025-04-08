<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Concert Events</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Owl Carousel CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    /* Concert Carousel Styles */
    .events-container {
      padding: 50px 0;
      background-color: #f8f9fa;
    }
    
    .section-header {
      text-align: center;
      margin-bottom: 40px;
    }
    
    .section-header h2 {
      color: #432E54;
      font-weight: 700;
      margin-bottom: 10px;
    }
    
    .section-header p {
      color: #f82249;
      font-size: 18px;
    }
    
    .concert-carousel {
      margin: 30px 0;
    }
    
    .concert-card {
      background: white;
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 5px 15px rgba(0,0,0,0.1);
      margin: 15px;
      transition: transform 0.3s ease;
    }
    
    .concert-card:hover {
      transform: translateY(-10px);
    }
    
    .concert-image {
      height: 200px;
      background-size: cover;
      background-position: center;
      position: relative;
    }
    
    .concert-info {
      padding: 15px;
    }
    
    .concert-info h3 {
      font-size: 18px;
      margin-bottom: 5px;
      color: #432E54;
    }
    
    .concert-info .artist {
      color: #f82249;
      font-weight: 500;
      margin-bottom: 5px;
    }
    
    .concert-info .venue-date {
      color: #555;
      font-size: 14px;
      margin-bottom: 10px;
    }
    
    .stats {
      display: flex;
      justify-content: space-between;
      font-size: 13px;
      color: #777;
      margin-bottom: 15px;
    }
    
    .price-tag {
      position: absolute;
      top: -2px;
      right: -251px;
      background: #f82249;
      color: white;
      padding: 5px 10px;
      border-radius: 20px;
      font-weight: bold;
    }
    
    .book-btn {
      display: block;
      text-align: center;
      background: #432E54;
      color: white;
      padding: 8px 0;
      border-radius: 5px;
      text-decoration: none;
      transition: background 0.3s;
    }
    
    .book-btn:hover {
      background: #f82249;
      color: white;
    }
    
    /* Owl Carousel Navigation */
    .owl-nav {
      text-align: center;
      margin-top: 20px;
    }
    
    .owl-nav button {
      background: #432E54 !important;
      color: white !important;
      width: 40px;
      height: 40px;
      border-radius: 50% !important;
      margin: 0 10px;
      font-size: 20px !important;
      line-height: 40px !important;
    }
    
    .owl-nav button:hover {
      background: #f82249 !important;
    }
    
    .owl-dots {
      text-align: center;
      margin-top: 20px;
    }
    
    .owl-dots button.owl-dot {
      width: 12px;
      height: 12px;
      border-radius: 50%;
      background: #ccc !important;
      margin: 0 5px;
    }
    
    .owl-dots button.owl-dot.active {
      background: #432E54 !important;
    }
    .book-btn{
  display:none;
}
  </style>
</head>
<body>
  <div class="events-container">
    <div class="container wow fadeInUp">
      <div class="section-header">
        <h2>Trending Concert Events</h2>
        <p>Live Concerts</p>
      </div>
      
      <!-- Concert Carousel Section -->
      <div class="concert-carousel owl-carousel owl-theme">
        <!-- Concert 1 -->
        <div class="concert-card">
          <div class="concert-image" style="background-image: url('https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80');">
            <span class="price-tag">$49</span>
          </div>
          <div class="concert-info">
            <h3>Rock Nation Tour</h3>
            <p class="artist">The Midnight Riders</p>
            <p class="venue-date">Narendra Modi Stadium | 18 APR</p>
            <div class="stats">
              <span class="interested"><i class="fas fa-user"></i> 215 interested</span>
              <span class="sold">50% sold</span>
            </div>
            <a href="#buy-tickets" class="book-btn"><button type="button" style="color:white;" class="btn" data-toggle="modal" data-target="#buy-ticket-modal" data-ticket-type="premium-access">Book Now</button></a>
          </div>
        </div>
        
        <!-- Concert 2 -->
        <div class="concert-card">
          <div class="concert-image" style="background-image: url('https://images.unsplash.com/photo-1501612780327-45045538702b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80');">
            <span class="price-tag">$75</span>
          </div>
          <div class="concert-info">
            <h3>Bollywood Night Live</h3>
            <p class="artist">Arijit Singh & Neha Kakkar</p>
            <p class="venue-date">GMDC Ground | 22 APR</p>
            <div class="stats">
              <span class="interested"><i class="fas fa-user"></i> 532 interested</span>
              <span class="sold">75% sold</span>
            </div>
            <a href="#buy-tickets" class="book-btn"><button type="button" style="color:white;" class="btn" data-toggle="modal" data-target="#buy-ticket-modal" data-ticket-type="premium-access">Book Now</button></a>
          </div>
        </div>
        
        <!-- Concert 3 -->
        <div class="concert-card">
          <div class="concert-image" style="background-image: url('https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80');">
            <span class="price-tag">$35</span>
          </div>
          <div class="concert-info">
            <h3>EDM Festival</h3>
            <p class="artist">DJ Snake, Marshmello</p>
            <p class="venue-date">Ahmedabad Riverfront | 25 APR</p>
            <div class="stats">
              <span class="interested"><i class="fas fa-user"></i> 890 interested</span>
              <span class="sold">90% sold</span>
            </div>
            <a href="#buy-tickets" class="book-btn"><button type="button" style="color:white;" class="btn" data-toggle="modal" data-target="#buy-ticket-modal" data-ticket-type="premium-access">Book Now</button></a>
          </div>
        </div>
        
        <!-- Concert 4 -->
        <div class="concert-card">
          <div class="concert-image" style="background-image: url('https://images.unsplash.com/photo-1429962714451-bb934ecdc4ec?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80');">
            <span class="price-tag">$60</span>
          </div>
          <div class="concert-info">
            <h3>Classical Fusion Night</h3>
            <p class="artist">Zakir Hussain & Shankar Mahadevan</p>
            <p class="venue-date">Sardar Patel Hall | 28 APR</p>
            <div class="stats">
              <span class="interested"><i class="fas fa-user"></i> 320 interested</span>
              <span class="sold">40% sold</span>
            </div>
            <a href="#buy-tickets" class="book-btn"><button type="button" style="color:white;" class="btn" data-toggle="modal" data-target="#buy-ticket-modal" data-ticket-type="premium-access">Book Now</button></a>
          </div>
        </div>
        
        <!-- Concert 5 -->
        <div class="concert-card">
          <div class="concert-image" style="background-image: url('https://images.unsplash.com/photo-1540039155733-5bb30b53aa14?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1074&q=80');">
            <span class="price-tag">$45</span>
          </div>
          <div class="concert-info">
            <h3>Indie Band Showcase</h3>
            <p class="artist">5 Local Bands</p>
            <p class="venue-date">Club O7 | 30 APR</p>
            <div class="stats">
              <span class="interested"><i class="fas fa-user"></i> 180 interested</span>
              <span class="sold">25% sold</span>
            </div>
            <a href="#buy-tickets" class="book-btn"><button type="button" style="color:white;" class="btn" data-toggle="modal" data-target="#buy-ticket-modal" data-ticket-type="premium-access">Book Now</button></a>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- jQuery -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Owl Carousel JS -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
  <!-- Initialize Owl Carousel -->
  <script>
    $(document).ready(function(){
      $(".concert-carousel").owlCarousel({
        loop: true,
        margin: 20,
        nav: true,
        dots: true,
        autoplay: true,
        autoplayTimeout: 3000,
        autoplayHoverPause: true,
        responsive: {
          0: {
            items: 1
          },
          600: {
            items: 2
          },
          1000: {
            items: 3
          }
        }
      });
    });
  </script>
</body>
</html>
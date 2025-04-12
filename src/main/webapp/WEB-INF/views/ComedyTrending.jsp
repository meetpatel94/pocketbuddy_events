<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Comedy Show Events</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Owl Carousel CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    /* Comedy Show Carousel Styles */
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
    
    .comedy-carousel {
      margin: 30px 0;
    }
    
    .comedy-card {
      background: white;
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 5px 15px rgba(0,0,0,0.1);
      margin: 15px;
      transition: transform 0.3s ease;
    }
    
    .comedy-card:hover {
      transform: translateY(-10px);
    }
    
    .comedy-image {
      height: 200px;
      background-size: cover;
      background-position: center;
      position: relative;
    }
    
    .comedy-info {
      padding: 15px;
    }
    
    .comedy-info h3 {
      font-size: 18px;
      margin-bottom: 5px;
      color: #432E54;
    }
    
    .comedy-info .comedian {
      color: #f82249;
      font-weight: 500;
      margin-bottom: 5px;
    }
    
    .comedy-info .venue-date {
      color: #555;
      font-size: 14px;
      margin-bottom: 10px;
    }
    
    .stats {
      display: flex;
      justify-content: space-between;
      font-size: 13px;
      color: #777;
      margin-bottom: 10px;
    }
    
    .price-tag {
      position: absolute;
      top: 15px;
      right: 15px;
      background: #f82249;
      color: white;
      padding: 5px 10px;
      border-radius: 20px;
      font-weight: bold;
    }
    
    /* Delete Button Styles */
    .btn-delete {
      display: block;
      text-align: center;
      background: #dc3545;
      color: white;
      padding: 8px 0;
      border-radius: 5px;
      text-decoration: none;
      transition: all 0.3s;
      border: none;
      width: 100%;
      cursor: pointer;
    }
    
    .btn-delete:hover {
      background: #c82333;
      color: white;
    }
    
    .btn-delete i {
      margin-right: 5px;
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
    
    .type-badge {
      position: absolute;
      top: 15px;
      left: 15px;
      background: rgba(0,0,0,0.7);
      color: white;
      padding: 5px 10px;
      border-radius: 20px;
      font-size: 12px;
      font-weight: 500;
    }
  </style>
</head>
<body>
  <div class="events-container">
    <div class="container wow fadeInUp">
      <div class="section-header">
        <h2>Trending Comedy Shows</h2>
        <p>Laugh Out Loud Performances</p>
      </div>
      
      <!-- Comedy Show Carousel Section -->
      <div class="comedy-carousel owl-carousel owl-theme">
        <!-- Comedy Show 1 -->
        <div class="comedy-card">
          <div class="comedy-image" style="background-image: url('https://images.unsplash.com/photo-1551818255-e6e10975bc17?ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80');">
            <span class="type-badge">Stand-up</span>
            <span class="price-tag">$45.0</span>
          </div>
          <div class="comedy-info">
            <h3>Comedy Night Extravaganza</h3>
            <p class="comedian">Zakir Khan</p>
            <p class="venue-date">Sabarmati Riverfront | 12 JUN</p>
            <div class="stats">
              <span class="interested"><i class="fas fa-user"></i> 680 interested</span>
              <span class="sold">75% sold</span>
            </div>
            
          </div>
        </div>
        
        <!-- Comedy Show 2 -->
        <div class="comedy-card">
          <div class="comedy-image" style="background-image: url('https://images.unsplash.com/photo-1540575467063-178a50c2df87');">
            <span class="type-badge">Stand-up</span>
            <span class="price-tag">$35.0</span>
          </div>
          <div class="comedy-info">
            <h3>Improv Comedy Jam</h3>
            <p class="comedian">The Improv Collective</p>
            <p class="venue-date">GMDC Ground | 16 JUN</p>
            <div class="stats">
              <span class="interested"><i class="fas fa-user"></i> 420 interested</span>
              <span class="sold">60% sold</span>
            </div>
           
          </div>
        </div>
        
        <!-- Comedy Show 3 -->
        <div class="comedy-card">
          <div class="comedy-image" style="background-image: url('https://images.unsplash.com/photo-1492684223066-81342ee5ff30');">
            <span class="type-badge">Stand-up</span>
            <span class="price-tag">$55.0</span>
          </div>
          <div class="comedy-info">
            <h3>Laugh Factory Live</h3>
            <p class="comedian">Vir Das & Friends</p>
            <p class="venue-date">Narendra Modi Stadium | 20 JUN</p>
            <div class="stats">
              <span class="interested"><i class="fas fa-user"></i> 950 interested</span>
              <span class="sold">90% sold</span>
            </div>
           
          </div>
        </div>
        
        <!-- Comedy Show 4 -->
        <div class="comedy-card">
          <div class="comedy-image" style="background-image: url('https://images.unsplash.com/photo-1514525253161-7a46d19cd819');">
            <span class="type-badge">Roast</span>
            <span class="price-tag">$65.0</span>
          </div>
          <div class="comedy-info">
            <h3>Celebrity Roast Night</h3>
            <p class="comedian">Kunal Kamra & Team</p>
            <p class="venue-date">Club O7 | 24 JUN</p>
            <div class="stats">
              <span class="interested"><i class="fas fa-user"></i> 520 interested</span>
              <span class="sold">70% sold</span>
            </div>
           
          </div>
        </div>
        
        <!-- Comedy Show 5 -->
        <div class="comedy-card">
          <div class="comedy-image" style="background-image: url('https://images.unsplash.com/photo-1540575467063-178a50c2df87?ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80');">
            <span class="type-badge">Stand-up</span>
            <span class="price-tag">$40.0</span>
          </div>
          <div class="comedy-info">
            <h3>Weekend Comedy Special</h3>
            <p class="comedian">Biswa Kalyan Rath</p>
            <p class="venue-date">Sardar Patel Hall | 28 JUN</p>
            <div class="stats">
              <span class="interested"><i class="fas fa-user"></i> 380 interested</span>
              <span class="sold">55% sold</span>
            </div>
           
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
      $(".comedy-carousel").owlCarousel({
        loop: true,
        margin: 20,
        nav: true,
        dots: false,
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
<!DOCTYPE html>
<html lang="en">
<head>	
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Music Show Events</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Owl Carousel CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    /* Music Show Carousel Styles */
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
    
    .music-carousel {
      margin: 30px 0;
    }
    
    .music-card {
      background: white;
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 5px 15px rgba(0,0,0,0.1);
      margin: 15px;
      transition: transform 0.3s ease;
    }
    
    .music-card:hover {
      transform: translateY(-10px);
    }
    
    .music-image {
      height: 200px;
      background-size: cover;
      background-position: center;
      position: relative;
    }
    
    .music-info {
      padding: 15px;
    }
    
    .music-info h3 {
      font-size: 18px;
      margin-bottom: 5px;
      color: #432E54;
    }
    
    .music-info .artist {
      color: #f82249;
      font-weight: 500;
      margin-bottom: 5px;
    }
    
    .music-info .venue-date {
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
      top: 15px;
      right: 15px;
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
    
    .genre-badge {
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
        <h2>Trending Music Shows</h2>
        <p>Live Music Performances</p>
      </div>
      
      <!-- Music Show Carousel Section -->
      <div class="music-carousel owl-carousel owl-theme">
        <!-- Music Show 1 -->
        <div class="music-card">
          <div class="music-image" style="background-image: url('https://images.unsplash.com/photo-1470225620780-dba8ba36b745?ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80');">
            <span class="genre-badge">Rock</span>
            <span class="price-tag">$80.0</span>
          </div>
          <div class="music-info">
            <h3>Rock Revolution Live</h3>
            <p class="artist">The Electric Strings</p>
            <p class="venue-date">Narendra Modi Stadium | 15 JUN</p>
            <div class="stats">
              <span class="interested"><i class="fas fa-user"></i> 450 interested</span>
              <span class="sold">65% sold</span>
            </div>
           
          </div>
        </div>
        
        <!-- Music Show 2 -->
        <div class="music-card">
          <div class="music-image" style="background-image: url('https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80');">
            <span class="genre-badge">Pop</span>
            <span class="price-tag">$15.20</span>
          </div>
          <div class="music-info">
            <h3>Pop Sensation Night</h3>
            <p class="artist">Global Pop Stars</p>
            <p class="venue-date">GMDC Ground | 18 JUN</p>
            <div class="stats">
              <span class="interested"><i class="fas fa-user"></i> 780 interested</span>
              <span class="sold">85% sold</span>
            </div>
            
          </div>
        </div>
        
        <!-- Music Show 3 -->
        <div class="music-card">
          <div class="music-image" style="background-image: url('https://images.unsplash.com/photo-1508700115892-45ecd05ae2ad?ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80');">
            <span class="genre-badge">EDM</span>
            <span class="price-tag">$15.00</span>
          </div>
          <div class="music-info">
            <h3>Electronic Dance Festival</h3>
            <p class="artist">DJ Supernova</p>
            <p class="venue-date">Ahmedabad Riverfront | 22 JUN</p>
            <div class="stats">
              <span class="interested"><i class="fas fa-user"></i> 920 interested</span>
              <span class="sold">90% sold</span>
            </div>
            
          </div>
        </div>
        
        <!-- Music Show 4 -->
        <div class="music-card">
          <div class="music-image" style="background-image: url('https://images.unsplash.com/photo-1514525253161-7a46d19cd819?ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80');">
            <span class="genre-badge">Jazz</span>
            <span class="price-tag">$62.0</span>
          </div>
          <div class="music-info">
            <h3>Smooth Jazz Evening</h3>
            <p class="artist">The Jazz Collective</p>
            <p class="venue-date">Sardar Patel Hall | 25 JUN</p>
            <div class="stats">
              <span class="interested"><i class="fas fa-user"></i> 210 interested</span>
              <span class="sold">40% sold</span>
            </div>
            
          </div>
        </div>
        
        <!-- Music Show 5 -->
        <div class="music-card">
          <div class="music-image" style="background-image: url('https://images.unsplash.com/photo-1540039155733-5bb30b53aa14?ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80');">
            <span class="genre-badge">Indie</span>
            <span class="price-tag">$50</span>
          </div>
          <div class="music-info">
            <h3>Indie Music Showcase</h3>
            <p class="artist">Emerging Artists</p>
            <p class="venue-date">Club O7 | 28 JUN</p>
            <div class="stats">
              <span class="interested"><i class="fas fa-user"></i> 180 interested</span>
              <span class="sold">30% sold</span>
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
      $(".music-carousel").owlCarousel({
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
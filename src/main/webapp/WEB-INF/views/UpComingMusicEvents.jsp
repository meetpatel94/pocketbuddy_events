<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Popular Music Shows</title>

<!-- Bootstrap & FontAwesome -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

<!-- Animate.css & WOW.js -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>

<style>
  :root {
    --primary-color: #9c27b0;
    --secondary-color: #ff5722;
    --dark-color: #222;
    --light-color: #f8f9fa;
    --text-color: #333;
    --text-light: #666;
    --border-radius: 12px;
    --box-shadow: 0 6px 16px rgba(0,0,0,0.1);
    --transition: all 0.3s ease-in-out;
  }

  body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    color: var(--text-color);
  }

  #showsSection {
    padding: 80px 0;
    background-color: var(--light-color);
  }

  .headline-box {
    text-align: center;
    margin-bottom: 50px;
  }

  .headline-box h2 {
    font-size: 36px;
    font-weight: 700;
    color: var(--dark-color);
    margin-bottom: 15px;
    position: relative;
    display: inline-block;
  }

  .headline-box h2:after {
    content: '';
    position: absolute;
    width: 60px;
    height: 3px;
    background: var(--primary-color);
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
  }

  .headline-box p {
    color: var(--text-light);
    font-size: 16px;
    max-width: 700px;
    margin: 0 auto;
    line-height: 1.6;
  }

  .filter-controls {
    display: flex;
    justify-content: center;
    margin-bottom: 30px;
    gap: 15px;
    flex-wrap: wrap;
  }

  .filter-controls select {
    padding: 10px 20px;
    border-radius: var(--border-radius);
    border: 1px solid #ddd;
    font-size: 16px;
    min-width: 200px;
    background-color: white;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
  }

  .show-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 25px;
    justify-content: center;
  }

  .show-card {
    display: flex;
    flex-direction: column;
  }

  .card-wrapper {
    background: #fff;
    border-radius: var(--border-radius);
    box-shadow: var(--box-shadow);
    overflow: hidden;
    transition: var(--transition);
    height: 100%;
    display: flex;
    flex-direction: column;
  }

  .card-wrapper:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 20px rgba(0,0,0,0.1);
  }

  .image-container {
    position: relative;
    height: 180px;
    overflow: hidden;
  }

  .card-wrapper img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: var(--transition);
  }

  .card-wrapper:hover img {
    transform: scale(1.03);
  }

  .show-badge {
    position: absolute;
    top: 10px;
    right: 10px;
    background: var(--primary-color);
    color: white;
    padding: 4px 10px;
    border-radius: 20px;
    font-size: 11px;
    font-weight: bold;
    z-index: 2;
  }

  .info-box {
    padding: 15px;
    flex-grow: 1;
    display: flex;
    flex-direction: column;
  }

  .info-box h3 {
    margin-bottom: 8px;
  }

  .info-box h3 a {
    font-size: 18px;
    font-weight: 600;
    color: var(--primary-color);
    text-decoration: none;
    transition: var(--transition);
  }

  .info-box h3 a:hover {
    color: #7b1fa2;
    text-decoration: underline;
  }

  .show-meta {
    display: flex;
    align-items: center;
    margin-bottom: 8px;
    color: var(--text-light);
    font-size: 13px;
  }

  .show-meta i {
    margin-right: 6px;
    color: var(--primary-color);
    font-size: 12px;
  }

  .show-description {
    color: var(--text-color);
    font-size: 13px;
    line-height: 1.5;
    margin-bottom: 12px;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
  }

  .artist-info {
    display: flex;
    align-items: center;
    margin-top: 12px;
    padding-top: 12px;
    border-top: 1px solid #eee;
  }

  .artist-name {
    font-weight: 600;
    font-size: 13px;
    margin-bottom: 2px;
  }

  .artist-genre {
    font-size: 11px;
    color: var(--text-light);
  }

  .city-tag {
    position: absolute;
    top: 10px;
    left: 10px;
    background: rgba(0,0,0,0.7);
    color: white;
    padding: 3px 8px;
    border-radius: 20px;
    font-size: 11px;
    font-weight: bold;
    z-index: 2;
  }

  .no-shows {
    grid-column: 1 / -1;
    text-align: center;
    padding: 50px;
    color: var(--text-light);
    font-style: italic;
  }

  @media (max-width: 768px) {
    .show-grid {
      grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
    }
    
    .headline-box h2 {
      font-size: 28px;
    }

    .filter-controls {
      flex-direction: column;
      align-items: center;
    }

    .filter-controls select {
      width: 100%;
    }
  }
  /* Filter Controls Styling */
.filter-controls {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
    gap: 12px;
    margin-bottom: 30px;
    background: #f5f7fa;
    padding: 15px;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
}

.filter-controls select {
    padding: 10px 20px;
    border-radius: 8px;
    border: 1px solid #e0e6ed;
    font-size: 14px;
    min-width: 180px;
    background-color: white;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
    appearance: none;
    background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
    background-repeat: no-repeat;
    background-position: right 10px center;
    background-size: 16px;
    cursor: pointer;
    transition: all 0.3s ease;
}

.filter-controls select:focus {
    outline: none;
    border-color: var(--primary-color);
    box-shadow: 0 0 0 3px rgba(156, 39, 176, 0.1);
}

.filter-controls button {
    padding: 10px 20px;
    border-radius: 8px;
    background: var(--primary-color);
    color: white;
    border: none;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

.filter-controls button:hover {
    background: #7b1fa2;
    transform: translateY(-1px);
}

/* Image Styling */
.image-container {
    position: relative;
    height: 180px;
    overflow: hidden;
    border-radius: 8px 8px 0 0;
}

.image-container img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.3s ease;
}

.card-wrapper:hover .image-container img {
    transform: scale(1.05);
}

/* Badge Styling */
.show-badge {
    position: absolute;
    top: 12px;
    right: 12px;
    background: var(--primary-color);
    color: white;
    padding: 4px 10px;
    border-radius: 20px;
    font-size: 11px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    z-index: 2;
}

.city-tag {
    position: absolute;
    top: 12px;
    left: 12px;
    background: rgba(0, 0, 0, 0.7);
    color: white;
    padding: 4px 10px;
    border-radius: 20px;
    font-size: 11px;
    font-weight: 600;
    z-index: 2;
}

/* Responsive Adjustments */
@media (max-width: 768px) {
    .filter-controls {
        flex-direction: column;
        align-items: stretch;
    }
    
    .filter-controls select,
    .filter-controls button {
        width: 100%;
    }
    
    .image-container {
        height: 160px;
    }
}
</style>

<script>
  new WOW().init();
</script>
</head>
<body>

<section id="showsSection" class="py-5">
  <div class="container">
    <div class="headline-box wow animate__animated animate__fadeIn">
      <h2>🎵 Popular Music Shows</h2>
      <p>Experience unforgettable live performances from top artists and bands. Find concerts, music festivals, and special events near you.</p>
    </div>

    <div class="filter-controls">
      <select id="cityFilter" class="form-control">
        <option value="all">All Cities</option>
        <option value="mumbai">Mumbai</option>
        <option value="delhi">Delhi</option>
        <option value="bangalore">Bangalore</option>
        <option value="hyderabad">Hyderabad</option>
        <option value="other">Other Cities</option>
      </select>
      <button id="applyFilter" class="btn btn-primary">Apply Filter</button>
    </div>

    <div class="show-grid" id="showsContainer">
      <% 
        String[] names = {"Bollywood Night Live", "International Pop Festival", "Classical Fusion Concert", 
                         "EDM Night with Top DJs", "Indie Music Festival", "Jazz & Blues Evening",
                         "Retro Rewind Concert", "Hip Hop Battle Ground", "Folk Music Celebration"};
        String[] descs = {
          "Featuring Arijit Singh | 18 APR | Mumbai", 
          "Headliner: Justin Bieber | 22 APR | Delhi",
          "Pt. Ravi Shankar Tribute | 25 APR | Bangalore",
          "DJ Snake & Marshmello | 28 APR | Goa",
          "Independent Artists Showcase | 30 APR | Hyderabad",
          "Jazz Legends Performance | 05 MAY | Kolkata",
          "90s Hits Night | 10 MAY | Pune",
          "Rap Battle Finals | 15 MAY | Mumbai",
          "Traditional Folk Artists | 20 MAY | Jaipur"
        };
        String[] fullDescriptions = {
          "An evening of romantic Bollywood hits performed live by Arijit Singh and other playback singers.",
          "International pop stars Justin Bieber and Dua Lipa headline this massive music festival.",
          "A tribute to Pt. Ravi Shankar featuring classical fusion performances by top musicians.",
          "Electronic dance music extravaganza with world-famous DJs and stunning light shows.",
          "Showcasing the best independent music talent from across the country.",
          "An intimate evening of jazz and blues with legendary performers from around the world.",
          "Relive the golden era of 90s Bollywood music with original singers and bands.",
          "The national finals of India's biggest hip hop competition featuring top rappers.",
          "Celebration of India's rich folk music traditions with performances from different states."
        };
        String[] imageUrls = {
          "https://images.unsplash.com/photo-1470225620780-dba8ba36b745?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
          "https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
          "https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
          "https://images.unsplash.com/photo-1501281668745-f7f57925c3b4?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
          "https://images.unsplash.com/photo-1429962714451-bb934ecdc4ec?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
          "https://images.unsplash.com/photo-1496293455970-f8581aae0e3b?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
          "https://images.unsplash.com/photo-1470225620780-dba8ba36b745?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
          "https://images.unsplash.com/photo-1514525253161-7a46d19cd819?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
          "https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80"
        };
        String[] artistNames = {
          "Arijit Singh",
          "Justin Bieber",
          "Pt. Ravi Shankar Tribute Band",
          "DJ Snake & Marshmello",
          "Indie Collective",
          "Jazz Legends Ensemble",
          "90s Rewind Band",
          "Hip Hop All Stars",
          "Folk Masters"
        };
        String[] artistGenres = {
          "Bollywood Playback",
          "International Pop",
          "Classical Fusion",
          "Electronic Dance Music",
          "Independent Music",
          "Jazz & Blues",
          "Retro Bollywood",
          "Hip Hop/Rap",
          "Traditional Folk"
        };
        String[] cities = {
          "mumbai",
          "delhi",
          "bangalore",
          "goa",
          "hyderabad",
          "kolkata",
          "pune",
          "mumbai",
          "jaipur"
        };
        
        for (int i = 0; i < names.length; i++) {
      %>
        <div class="show-card wow animate__animated animate__zoomIn" data-wow-delay="<%= (i * 0.1) %>s" data-city="<%= cities[i] %>">
          <div class="card-wrapper">
            <div class="image-container">
              <img src="<%= imageUrls[i] %>" alt="<%= names[i] %>" class="img-fluid">
              <span class="show-badge">LIVE</span>
              <span class="city-tag"><%= cities[i] %></span>
            </div>
            <div class="info-box">
              <h3><a href="#"><%= names[i] %></a></h3>
              
              <div class="show-meta">
                <i class="fas fa-calendar-alt"></i>
                <span><%= descs[i] %></span>
              </div>
              
              <p class="show-description"><%= fullDescriptions[i] %></p>
              
              <div class="artist-info">
                <div>
                  <div class="artist-name"><%= artistNames[i] %></div>
                  <div class="artist-genre"><%= artistGenres[i] %></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      <% } %>
    </div>
  </div>
</section>

<!-- JS Scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
$(document).ready(function() {
  // Initialize WOW.js
  new WOW().init();

  // Filter shows by city
  $('#applyFilter').click(function() {
    var selectedCity = $('#cityFilter').val();
    var showCards = $('.show-card');
    var visibleCards = 0;
    var maxCardsToShow = 6; // Maximum cards to show
    var minCardsToShow = 3; // Minimum cards to show
    
    showCards.each(function() {
      var cardCity = $(this).data('city');
      var shouldShow = (selectedCity === 'all') || 
                       (selectedCity === 'other' && !['mumbai','delhi','bangalore','hyderabad'].includes(cardCity)) ||
                       (cardCity === selectedCity);
      
      if (shouldShow && visibleCards < maxCardsToShow) {
        $(this).show();
        visibleCards++;
      } else {
        $(this).hide();
      }
    });
    
    // Show no shows message if needed
    if (visibleCards === 0) {
      $('#showsContainer').append('<div class="no-shows">No shows found for the selected city</div>');
    } else {
      $('.no-shows').remove();
      
      // Ensure we show at least minCardsToShow if available
      if (visibleCards < minCardsToShow && visibleCards < showCards.length) {
        var additionalToShow = minCardsToShow - visibleCards;
        showCards.each(function() {
          if (additionalToShow > 0 && $(this).is(':hidden')) {
            $(this).show();
            additionalToShow--;
          }
        });
      }
    }
  });

  // Trigger filter on page load
  $('#applyFilter').trigger('click');
});
</script>

</body>
</html>
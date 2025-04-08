<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Business Seminar</title>

<!-- Bootstrap & FontAwesome -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

<!-- Animate.css & WOW.js -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>

<style>
  :root {
    --primary-color: #0056b3;
    --secondary-color: #d2005e;
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

  #speakersSection {
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

  .speaker-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 25px;
    justify-content: center;
  }

  .speaker-card {
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

  .seminar-badge {
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
    color: #003d7a;
    text-decoration: underline;
  }

  .seminar-meta {
    display: flex;
    align-items: center;
    margin-bottom: 8px;
    color: var(--text-light);
    font-size: 13px;
  }

  .seminar-meta i {
    margin-right: 6px;
    color: var(--primary-color);
    font-size: 12px;
  }

  .seminar-description {
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

  .speaker-info {
    display: flex;
    align-items: center;
    margin-top: 12px;
    padding-top: 12px;
    border-top: 1px solid #eee;
  }

  .speaker-name {
    font-weight: 600;
    font-size: 13px;
    margin-bottom: 2px;
  }

  .speaker-title {
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

  .no-events {
    grid-column: 1 / -1;
    text-align: center;
    padding: 50px;
    color: var(--text-light);
    font-style: italic;
  }

  @media (max-width: 768px) {
    .speaker-grid {
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
    border-color: #0056b3;
    box-shadow: 0 0 0 3px rgba(0, 86, 179, 0.1);
}

.filter-controls button {
    padding: 10px 20px;
    border-radius: 8px;
    background: #0056b3;
    color: white;
    border: none;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

.filter-controls button:hover {
    background: #003d7a;
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
.seminar-badge {
    position: absolute;
    top: 12px;
    right: 12px;
    background: #0056b3;
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

<section id="speakersSection" class="py-5">
  <div class="container">
    <div class="headline-box wow animate__animated animate__fadeIn">
      <h2>Business Seminars</h2>
      <p>Connect with industry leaders and expert speakers at our premier business events. Gain insights, network with professionals, and take your business to the next level.</p>
    </div>

    <div class="filter-controls">
      <select id="cityFilter" class="form-control">
        <option value="all">All Cities</option>
        <option value="surat">Surat</option>
        <option value="ahmedabad">Ahmedabad</option>
        <option value="vadodara">Vadodara</option>
        <option value="navsari">Navsari</option>
        <option value="other">Other Cities</option>
      </select>
      <button id="applyFilter" class="btn btn-primary">Apply Filter</button>
    </div>

    <div class="speaker-grid" id="eventsContainer">
      <% 
        String[] names = {"Digital Transformation Summit", "Startup Investors Meet", "AI in Business Conference", 
                         "Women Entrepreneurship Summit", "Future of E-Commerce", "Leadership Excellence Forum",
                         "Gujarat Tech Expo", "Surat Business Conclave", "Vadodara Innovation Summit"};
        String[] descs = {
          "Keynote by Mukesh Ambani | 18 APR | Mumbai", 
          "Angel network event | 22 APR | Bangalore",
          "Industry leaders panel | 25 APR | Delhi",
          "Empowerment summit | 28 APR | Hyderabad",
          "Experts discussion | 30 APR | Chennai",
          "CEO roundtable | 05 MAY | Pune",
          "Tech showcase | 10 MAY | Ahmedabad",
          "Business networking | 15 MAY | Surat",
          "Startup pitch | 20 MAY | Vadodara"
        };
        String[] fullDescriptions = {
          "Explore how digital technologies are reshaping industries with insights from Reliance Industries Chairman Mukesh Ambani and other tech leaders.",
          "Connect with angel investors and venture capitalists looking to fund the next big startup idea in India's booming tech ecosystem.",
          "Learn how artificial intelligence is transforming business operations from top AI researchers and industry practitioners.",
          "Hear inspiring stories from successful women entrepreneurs and learn strategies to overcome challenges in the business world.",
          "Discover emerging trends in e-commerce and digital retail from leading marketplace founders and retail experts.",
          "Develop your leadership skills with insights from India's top CEOs and management thought leaders.",
          "Showcase of Gujarat's tech innovations with participation from top IT companies and startups.",
          "Annual business conference bringing together Surat's top entrepreneurs and business leaders.",
          "Innovation summit featuring Vadodara's growing startup ecosystem and research institutions."
        };
        String[] imageUrls = {
          "https://images.unsplash.com/photo-1431540015161-0bf868a2d407?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
          "https://images.unsplash.com/photo-1522071820081-009f0129c71c?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
          "https://images.unsplash.com/photo-1551288049-bebda4e38f71?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
          "https://images.unsplash.com/photo-1542744173-8e7e53415bb0?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
          "https://images.unsplash.com/photo-1522202176988-66273c2fd55f?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
          "https://images.unsplash.com/photo-1505373877841-8d25f7d46678?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
          "https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
          "https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
          "https://images.unsplash.com/photo-1467232004584-a241de8bcf5d?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80"
        };
        String[] speakerNames = {
          "Mukesh Ambani",
          "Ritesh Agarwal",
          "Andrew Ng",
          "Kiran Mazumdar-Shaw",
          "Kunal Bahl",
          "Indra Nooyi",
          "Pankaj Patel",
          "Devansh Jain",
          "Rajesh Sharma"
        };
        String[] speakerTitles = {
          "Chairman, Reliance Industries",
          "Founder, OYO Rooms",
          "AI Researcher, Stanford",
          "Chairperson, Biocon",
          "Co-founder, Snapdeal",
          "Former CEO, PepsiCo",
          "CEO, Zydus Cadila",
          "Director, Surat Diamonds",
          "Professor, MSU Vadodara"
        };
        String[] cities = {
          "mumbai",
          "bangalore",
          "delhi",
          "hyderabad",
          "chennai",
          "pune",
          "ahmedabad",
          "surat",
          "vadodara"
        };
        
        for (int i = 0; i < names.length; i++) {
      %>
        <div class="speaker-card wow animate__animated animate__zoomIn" data-wow-delay="<%= (i * 0.1) %>s" data-city="<%= cities[i] %>">
          <div class="card-wrapper">
            <div class="image-container">
              <img src="<%= imageUrls[i] %>" alt="<%= names[i] %>" class="img-fluid">
              <span class="seminar-badge">FEATURED</span>
              <span class="city-tag"><%= cities[i] %></span>
            </div>
            <div class="info-box">
              <h3><a href="#"><%= names[i] %></a></h3>
              
              <div class="seminar-meta">
                <i class="fas fa-calendar-alt"></i>
                <span><%= descs[i] %></span>
              </div>
              
              <p class="seminar-description"><%= fullDescriptions[i] %></p>
              
              <div class="speaker-info">
                <div>
                  <div class="speaker-name"><%= speakerNames[i] %></div>
                  <div class="speaker-title"><%= speakerTitles[i] %></div>
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

  // Filter events by city
  $('#applyFilter').click(function() {
    var selectedCity = $('#cityFilter').val();
    var eventCards = $('.speaker-card');
    var visibleCards = 0;
    var maxCardsToShow = 6; // Maximum cards to show
    var minCardsToShow = 3; // Minimum cards to show
    
    eventCards.each(function() {
      var cardCity = $(this).data('city');
      var shouldShow = (selectedCity === 'all') || 
                       (selectedCity === 'other' && !['surat','ahmedabad','vadodara','navsari'].includes(cardCity)) ||
                       (cardCity === selectedCity);
      
      if (shouldShow && visibleCards < maxCardsToShow) {
        $(this).show();
        visibleCards++;
      } else {
        $(this).hide();
      }
    });
    
    // Show no events message if needed
    if (visibleCards === 0) {
      $('#eventsContainer').append('<div class="no-events">No events found for the selected city</div>');
    } else {
      $('.no-events').remove();
      
      // Ensure we show at least minCardsToShow if available
      if (visibleCards < minCardsToShow && visibleCards < eventCards.length) {
        var additionalToShow = minCardsToShow - visibleCards;
        eventCards.each(function() {
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
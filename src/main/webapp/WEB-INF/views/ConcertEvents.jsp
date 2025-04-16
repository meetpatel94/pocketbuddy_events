<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Business Seminars</title>

<!-- Bootstrap & FontAwesome -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

<!-- Animate.css & WOW.js -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>

<style>
  :root {
    --primary-color: #0056b3;
    --primary-light: #e6f0ff;
    --secondary-color: #d2005e;
    --accent-color: #00b894;
    --dark-color: #222;
    --light-color: #f8f9fa;
    --text-color: #333;
    --text-light: #666;
    --border-radius: 12px;
    --box-shadow: 0 6px 16px rgba(0,0,0,0.1);
    --transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
  }

  body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    color: var(--text-color);
    background-color: #f5f7fa;
    line-height: 1.6;
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

  .speaker-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 25px;
    justify-content: center;
  }

  .speaker-card {
    display: flex;
    flex-direction: column;
    opacity: 0;
    transform: translateY(20px);
    transition: opacity 0.5s ease, transform 0.5s ease;
  }

  .speaker-card.visible {
    opacity: 1;
    transform: translateY(0);
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
    will-change: transform;
  }

  .card-wrapper:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 24px rgba(0,0,0,0.15);
  }

  .image-container {
    position: relative;
    height: 200px;
    overflow: hidden;
    background-color: #f5f7fa;
  }

  .card-wrapper img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: var(--transition);
    opacity: 0;
    transition: opacity 0.5s ease;
  }

  .card-wrapper img.loaded {
    opacity: 1;
  }

  .seminar-badge {
    position: absolute;
    top: 10px;
    right: 10px;
    background: var(--primary-color);
    color: white;
    padding: 5px 14px;
    border-radius: 20px;
    font-size: 11px;
    font-weight: bold;
    z-index: 2;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
  }

  .info-box {
    padding: 20px;
    flex-grow: 1;
    display: flex;
    flex-direction: column;
  }

  .info-box h3 {
    margin-bottom: 10px;
  }

  .info-box h3 a {
    font-size: 20px;
    font-weight: 700;
    color: var(--primary-color);
    text-decoration: none;
    transition: var(--transition);
  }

  .info-box h3 a:hover {
    color: #003d7a;
    text-decoration: none;
  }

  .seminar-meta {
    display: flex;
    align-items: center;
    margin-bottom: 12px;
    color: var(--text-light);
    font-size: 14px;
  }

  .seminar-meta i {
    margin-right: 8px;
    color: var(--primary-color);
    font-size: 14px;
  }

  .seminar-description {
    color: var(--text-color);
    font-size: 14px;
    line-height: 1.6;
    margin-bottom: 15px;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
  }

  .speaker-info {
    display: flex;
    align-items: center;
    margin-top: 15px;
    padding-top: 15px;
    border-top: 1px solid #eee;
  }

  .speaker-name {
    font-weight: 600;
    font-size: 14px;
    margin-bottom: 4px;
  }

  .speaker-title {
    font-size: 12px;
    color: var(--text-light);
  }

  .city-tag {
    position: absolute;
    top: 10px;
    left: 10px;
    background: rgba(0,0,0,0.7);
    color: white;
    padding: 5px 12px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: bold;
    z-index: 2;
    text-transform: capitalize;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
  }

  .no-events {
    grid-column: 1 / -1;
    text-align: center;
    padding: 50px;
    color: var(--text-light);
    font-style: italic;
    background: white;
    border-radius: var(--border-radius);
    box-shadow: var(--box-shadow);
  }

  /* Enhanced Filter Controls */
  .filter-container {
    background: white;
    padding: 20px;
    border-radius: var(--border-radius);
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    margin-bottom: 40px;
  }

  .filter-controls {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
    gap: 15px;
  }

  .filter-group {
    position: relative;
    min-width: 200px;
  }

  .filter-group label {
    display: block;
    margin-bottom: 6px;
    font-size: 13px;
    font-weight: 600;
    color: var(--text-light);
    text-transform: uppercase;
    letter-spacing: 0.5px;
  }

  .filter-controls select {
    padding: 12px 20px;
    padding-right: 40px;
    border-radius: 8px;
    border: 1px solid #e0e6ed;
    font-size: 14px;
    width: 100%;
    background-color: white;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
    appearance: none;
    background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
    background-repeat: no-repeat;
    background-position: right 15px center;
    background-size: 16px;
    cursor: pointer;
    transition: var(--transition);
  }

  .filter-controls select:focus {
    outline: none;
    border-color: var(--primary-color);
    box-shadow: 0 0 0 3px rgba(0, 86, 179, 0.1);
  }

  .filter-actions {
    display: flex;
    align-items: flex-end;
    gap: 10px;
  }

  .filter-btn {
    padding: 12px 24px;
    border-radius: 8px;
    background: var(--primary-color);
    color: white;
    border: none;
    font-weight: 600;
    cursor: pointer;
    transition: var(--transition);
    box-shadow: 0 4px 12px rgba(0, 86, 179, 0.2);
    display: flex;
    align-items: center;
    gap: 8px;
  }

  .filter-btn:hover {
    background: #003d7a;
    transform: translateY(-2px);
    box-shadow: 0 6px 16px rgba(0, 86, 179, 0.3);
  }

  .filter-btn i {
    font-size: 14px;
  }

  .reset-btn {
    padding: 12px 18px;
    border-radius: 8px;
    background: white;
    color: var(--text-light);
    border: 1px solid #e0e6ed;
    font-weight: 500;
    cursor: pointer;
    transition: var(--transition);
  }

  .reset-btn:hover {
    background: #f8f9fa;
    border-color: #d0d7de;
    color: var(--text-color);
  }

  /* View Details Button */
  .view-details-btn {
    margin-top: auto;
    padding: 10px 20px;
    background-color: var(--primary-color);
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 14px;
    font-weight: 500;
    cursor: pointer;
    transition: var(--transition);
    align-self: flex-start;
    box-shadow: 0 2px 8px rgba(0, 86, 179, 0.2);
    display: flex;
    align-items: center;
    gap: 8px;
  }

  .view-details-btn:hover {
    background-color: #003d7a;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0, 86, 179, 0.3);
  }

  .view-details-btn i {
    font-size: 12px;
  }

  /* Modal Styling */
  .event-modal .modal-content {
    border-radius: var(--border-radius);
    border: none;
    overflow: hidden;
  }

  .event-modal .modal-header {
    border-bottom: 1px solid #eee;
    padding: 20px 25px;
    background-color: var(--primary-color);
  }

  .event-modal .modal-title {
    font-weight: 700;
    color: white;
    font-size: 22px;
  }

  .event-modal .close {
    color: white;
    opacity: 0.8;
    text-shadow: none;
    transition: var(--transition);
  }

  .event-modal .close:hover {
    opacity: 1;
    color: white;
    transform: rotate(90deg);
  }

  .event-modal .modal-body {
    padding: 25px;
  }

  .event-modal .event-image {
    width: 100%;
    height: 250px;
    object-fit: cover;
    border-radius: 8px;
    margin-bottom: 20px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  }

  .event-modal .event-details {
    margin-bottom: 20px;
  }

  .event-modal .event-details h5 {
    font-size: 18px;
    margin-bottom: 15px;
    color: var(--dark-color);
    font-weight: 700;
  }

  .event-modal .event-details p {
    font-size: 15px;
    color: var(--text-color);
    margin-bottom: 8px;
    display: flex;
    align-items: center;
  }

  .event-modal .event-details i {
    color: var(--primary-color);
    margin-right: 10px;
    width: 20px;
    text-align: center;
    font-size: 16px;
  }

  .event-modal .event-description {
    background: var(--primary-light);
    padding: 20px;
    border-radius: 8px;
    margin-top: 20px;
  }

  .event-modal .event-description h5 {
    font-size: 18px;
    margin-bottom: 15px;
    color: var(--dark-color);
    font-weight: 700;
  }

  .event-modal .event-description p {
    font-size: 15px;
    line-height: 1.7;
    color: var(--text-color);
  }

  .event-modal .modal-footer {
    border-top: 1px solid #eee;
    padding: 15px 25px;
  }

  /* Loading Animation */
  .skeleton-loading {
    position: relative;
    overflow: hidden;
    background-color: #f0f0f0;
  }

  .skeleton-loading::after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: linear-gradient(90deg, 
      rgba(255,255,255,0) 0%, 
      rgba(255,255,255,0.8) 50%, 
      rgba(255,255,255,0) 100%);
    animation: shimmer 1.5s infinite;
  }

  @keyframes shimmer {
    0% { transform: translateX(-100%); }
    100% { transform: translateX(100%); }
  }

  /* Responsive Design */
  @media (max-width: 992px) {
    .speaker-grid {
      grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
      gap: 20px;
    }
    
    .headline-box h2 {
      font-size: 32px;
    }
  }

  @media (max-width: 768px) {
    .filter-container {
      padding: 15px;
    }
    
    .filter-controls {
      flex-direction: column;
      align-items: stretch;
      gap: 15px;
    }
    
    .filter-group {
      width: 100%;
    }
    
    .filter-actions {
      width: 100%;
      justify-content: space-between;
    }
    
    .filter-btn, .reset-btn {
      flex: 1;
      text-align: center;
    }
    
    .image-container {
      height: 180px;
    }
    
    .info-box {
      padding: 15px;
    }
  }

  @media (max-width: 576px) {
    #speakersSection {
      padding: 60px 0;
    }
    
    .headline-box h2 {
      font-size: 28px;
    }
    
    .headline-box p {
      font-size: 15px;
      padding: 0 15px;
    }
    
    .image-container {
      height: 160px;
    }
    
    .event-modal .modal-body {
      padding: 20px;
    }
    
    .event-modal .event-image {
      height: 180px;
    }
  }
  /*  */
  select.form-control:not([size]):not([multiple]) {
    height: calc(2.25rem + 10px);
  }
.filter-btn {
    margin-top: 24px;
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
       <h2>Concerts Shows</h2>
      <p>Experience the thrill of live entertainment at our exclusive concerts and shows. Connect with top artists, immerse yourself in unforgettable performances, and create memories that last a lifetime. Whether you're a music lover or a fan of live acts, this is your chance to enjoy world-class entertainment and vibrant atmospheres like never before.</p>
    </div>

    <div class="filter-container wow animate__animated animate__fadeIn">
      <div class="filter-controls">
        <div class="filter-group">
          <label for="cityFilter">City</label>
          <select name="cityName" id="cityFilter" class="form-control">
            <option value="all">All Cities</option>        
            <c:forEach items="${allcity}" var="c">
              <option value="${c.cityName}">${c.cityName}</option>             
            </c:forEach> 
          </select>
        </div>
        
        <div class="filter-group">
          <label for="stateFilter">State</label>
          <select name="staName" id="stateFilter" class="form-control">
            <option value="all">All States</option>        
            <c:forEach items="${allstate}" var="s">
              <option value="${s.staName}">${s.staName}</option>
            </c:forEach> 
          </select>
        </div>
        
        <div class="filter-actions">
          <button id="applyFilter" class="filter-btn">
            <i class="fas fa-filter"></i> Apply Filters
          </button>
          <button id="resetFilter" class="reset-btn">
            Reset
          </button>
        </div>
      </div>
    </div>

    <div class="speaker-grid" id="eventsContainer">
      <c:forEach items="${newevent}" var="n">
        <c:if test="${n.eventType eq 'concerts'}">
          <div class="speaker-card" data-city="${n.city.toLowerCase()}" data-state="${n.state.toLowerCase()}">
            <div class="card-wrapper">
              <div class="image-container">
                <img data-src="${n.profilePicPath}" alt="Business Seminar" class="img-fluid lazy">
                <span class="seminar-badge">BUSINESS</span>
                <span class="city-tag">${n.city}</span>
              </div>
              <div class="info-box">
                <h3><a href="#">${n.name}</a></h3>
                
                <div class="seminar-meta">
                  <i class="fas fa-calendar-alt"></i>
                  <span>${n.keynote}</span> 
                </div>
                
                <p class="seminar-description">${n.description}</p>
                
                <div class="speaker-info">
                  <div>
                    <div class="speaker-name">${n.name}</div>
                    <div class="speaker-title">${n.state}</div>
                  </div>
                </div>
                
                <button class="view-details-btn" data-toggle="modal" data-target="#eventModal" 
                  data-name="${n.name}"
                  data-image="${n.profilePicPath}"
                  data-city="${n.city}"
                  data-state="${n.state}"
                  data-date="${n.keynote}"
                  data-description="${n.description}">
                  <i class="fas fa-eye"></i> View Details
                </button>
              </div>
            </div>
          </div>
        </c:if>
      </c:forEach>
    </div>
  </div>
</section>

<!-- Event Details Modal -->
<div class="modal fade event-modal" id="eventModal" tabindex="-1" role="dialog" aria-labelledby="eventModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="eventModalLabel">Event Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <img src="" class="event-image" id="modalEventImage" alt="Event Image">
        
        <div class="event-details">
          <h5 id="modalEventName"></h5>
          
          <p><i class="fas fa-map-marker-alt"></i> <span id="modalEventCity"></span></p>
          <p><i class="fas fa-calendar-alt"></i> <span id="modalEventDate"></span></p>
        </div>
        
        <div class="event-description">
          <h5>Event Description</h5>
          <p id="modalEventDescription"></p>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- JS Scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
$(document).ready(function() {
  // Initialize WOW.js
  new WOW().init();

  // Lazy load images with Intersection Observer
  const lazyLoadObserver = new IntersectionObserver((entries, observer) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        const img = entry.target;
        img.src = img.dataset.src;
        img.classList.add('loaded');
        observer.unobserve(img);
      }
    });
  }, {
    rootMargin: '100px 0px',
    threshold: 0.01
  });

  document.querySelectorAll('.lazy').forEach(img => {
    lazyLoadObserver.observe(img);
  });

  // Fade in cards when they come into view
  const cardObserver = new IntersectionObserver((entries, observer) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
        observer.unobserve(entry.target);
      }
    });
  }, {
    threshold: 0.1
  });

  document.querySelectorAll('.speaker-card').forEach(card => {
    cardObserver.observe(card);
  });

  // Filter events by city and state
  function applyFilters() {
    const selectedCity = $('#cityFilter').val().toLowerCase();
    const selectedState = $('#stateFilter').val().toLowerCase();
    const eventCards = $('.speaker-card');
    let hasVisibleCards = false;
    
    // Remove any existing "no events" message
    $('.no-events').remove();
    
    eventCards.each(function() {
      const cardCity = $(this).data('city');
      const cardState = $(this).data('state');
      let shouldShow = true;
      
      // Apply city filter
      if (selectedCity !== 'all') {
        shouldShow = shouldShow && (cardCity === selectedCity);
      }
      
      // Apply state filter
      if (selectedState !== 'all') {
        shouldShow = shouldShow && (cardState === selectedState);
      }
      
      if (shouldShow) {
        $(this).show().addClass('visible');
        hasVisibleCards = true;
      } else {
        $(this).hide().removeClass('visible');
      }
    });
    
    // Show message if no events found
    if (!hasVisibleCards) {
      $('#eventsContainer').append(
        '<div class="no-events wow animate__animated animate__fadeIn">' +
        'No business events found for the selected filters. Please try different filters.' +
        '</div>'
      );
    }
  }

  // Apply filters when button is clicked
  $('#applyFilter').click(applyFilters);
  
  // Reset filters
  $('#resetFilter').click(function() {
    $('#cityFilter').val('all');
    $('#stateFilter').val('all');
    applyFilters();
  });
  
  // Apply filters immediately on page load
  applyFilters();
  
  // Event details modal handler
  $('#eventModal').on('show.bs.modal', function(event) {
    const button = $(event.relatedTarget);
    const name = button.data('name');
    const image = button.data('image');
    const city = button.data('city');
    const date = button.data('date');
    const description = button.data('description');
    
    const modal = $(this);
    modal.find('.modal-title').text(name);
    modal.find('#modalEventName').text(name);
    modal.find('#modalEventImage').attr('src', image);
    modal.find('#modalEventCity').text(city);
    modal.find('#modalEventDate').text(date);
    modal.find('#modalEventDescription').text(description);
  });

  // Handle image loading errors
  document.querySelectorAll('.lazy').forEach(img => {
    img.onerror = function() {
      this.src = 'data:image/svg+xml;charset=UTF-8,%3Csvg xmlns="http://www.w3.org/2000/svg" width="300" height="200" viewBox="0 0 300 200"%3E%3Crect width="300" height="200" fill="%23f0f0f0"/%3E%3Ctext x="150" y="100" font-family="Arial" font-size="16" text-anchor="middle" fill="%23aaa"%3EImage not available%3C/text%3E%3C/svg%3E';
      this.classList.add('loaded');
    };
  });
});
</script>

</body>
</html>
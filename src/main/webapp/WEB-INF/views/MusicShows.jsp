<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Music Events</title>

<!-- Bootstrap & FontAwesome -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

<!-- Animate.css & WOW.js -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>

<style>
  :root {
    --primary-color: #9c27b0;
    --secondary-color: #e91e63;
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
    background-color: #f5f7fa;
  }

  #eventsSection {
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

  .events-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 25px;
    justify-content: center;
  }

  .event-card {
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

  .event-badge {
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

  .event-meta {
    display: flex;
    align-items: center;
    margin-bottom: 8px;
    color: var(--text-light);
    font-size: 13px;
  }

  .event-meta i {
    margin-right: 6px;
    color: var(--primary-color);
    font-size: 12px;
  }

  .event-description {
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

  .venue-tag {
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
    text-transform: capitalize;
  }

  .no-events {
    grid-column: 1 / -1;
    text-align: center;
    padding: 50px;
    color: var(--text-light);
    font-style: italic;
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

  @media (max-width: 768px) {
    .events-grid {
      grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
    }
    
    .headline-box h2 {
      font-size: 28px;
    }

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

<section id="eventsSection" class="py-5">
  <div class="container">
    <div class="headline-box wow animate__animated animate__fadeIn">
      <h2>Music Events</h2>
      <p>Discover amazing live music performances and concerts in your area. Experience the best local and international artists.</p>
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

    <div class="events-grid" id="eventsContainer">
      <c:forEach items="${newevent }" var="n">
        <c:if test="${n.eventType eq 'music'}">
          <div class="event-card wow animate__animated animate__zoomIn" data-city="${n.city.toLowerCase()}">
            <div class="card-wrapper">
              <div class="image-container">
                <img src="${n.profilePicPath}" alt="Music Event" class="img-fluid">
                <span class="event-badge">MUSIC</span>
                <span class="venue-tag">${n.city}</span>
              </div>
              <div class="info-box">
                <h3><a href="#">${n.name}</a></h3>
                
                <div class="event-meta">
                  <i class="fas fa-calendar-alt"></i>
                  <span>${n.keynote}</span>
                </div>
                
                <p class="event-description">${n.description}</p>
                
                <div class="artist-info">
                  <div>
                    <div class="artist-name">${n.name}</div>
                    <%-- <div class="artist-genre">${n.genre}</div> --%>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </c:if>
      </c:forEach>
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

  // Filter events by city (only music events will be visible)
  $('#applyFilter').click(function() {
    var selectedCity = $('#cityFilter').val().toLowerCase();
    var eventCards = $('.event-card');
    var hasVisibleCards = false;
    
    // Remove any existing "no events" message
    $('.no-events').remove();
    
    eventCards.each(function() {
      var cardCity = $(this).data('city');
      var shouldShow = false;
      
      if (selectedCity === 'all') {
        shouldShow = true;
      } else if (selectedCity === 'other') {
        shouldShow = !['surat', 'ahmedabad', 'vadodara', 'navsari'].includes(cardCity);
      } else {
        shouldShow = (cardCity === selectedCity);
      }
      
      if (shouldShow) {
        $(this).show();
        hasVisibleCards = true;
      } else {
        $(this).hide();
      }
    });
    
    // Show message if no events found
    if (!hasVisibleCards) {
      $('#eventsContainer').append(
        '<div class="no-events wow animate__animated animate__fadeIn">' +
        'No music events found for the selected city. Please try another filter.' +
        '</div>'
      );
    }
  });

  // Trigger filter on page load
  $('#applyFilter').trigger('click');
});
</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dance Shows</title>

<!-- Combined CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
<jsp:include page="showCss.jsp"></jsp:include>

</head>
<body>

<section id="speakersSection" class="py-5">
  <div class="container">
    <div class="headline-box wow animate__animated animate__fadeIn">
      <h2>Dance Shows</h2>
      <p>Connect with industry leaders and expert speakers at our premier business events. Gain insights, network with professionals, and take your business to the next level.</p>
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
          <button id="resetFilter" class="reset-btn">Reset</button>
        </div>
      </div>
    </div>

    <div class="speaker-grid" id="eventsContainer">
      <c:forEach items="${newevent}" var="n">
        <c:if test="${n.eventType eq 'dance'}">
          <div class="speaker-card" data-city="${n.city.toLowerCase()}" data-state="${n.state.toLowerCase()}">
            <div class="card-wrapper">
              <div class="image-container">
                <img data-src="${n.profilePicPath}" alt="Music Event" class="img-fluid lazy">
                <span class="seminar-badge" style="background: #FD79A8;">Dance</span>
                <span class="city-tag">${n.city}</span>
              </div>
              <div class="info-box">
                <h3><a href="#">${n.name}</a></h3>
                <div class="seminar-meta"><i class="fas fa-calendar-alt"></i><span>${n.keynote}</span></div>
                <div class="seminar-meta"><i class="fas fa-clock"></i><span>${n.stime} To ${n.etime}</span></div>
                <p class="seminar-description">${n.description}</p>
                <div class="speaker-info">
                  <div>
                    <div class="speaker-name">${n.name}</div>
                    <div class="speaker-title">${n.state}</div>
                  </div>
                </div>
                <button class="view-details-btn" data-toggle="modal" data-target="#eventModal" 
                  data-name="${n.name}" data-image="${n.profilePicPath}" data-city="${n.city}"
                  data-date="${n.keynote}" data-description="${n.description}">
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
<div class="modal fade event-modal" id="eventModal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Event Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <img src="" class="event-image" id="modalEventImage" alt="Event Image">
        <div class="event-details">
          <h5 id="modalEventName"></h5>
          <p><i class="fas fa-map-marker-alt"></i><span id="modalEventCity"></span></p>
          <p><i class="fas fa-calendar-alt"></i><span id="modalEventDate"></span></p>
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

<jsp:include page="showJs.jsp"></jsp:include>

</body>
</html>
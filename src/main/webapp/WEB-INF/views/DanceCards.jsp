<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Dance Events in Ahmedabad</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .event-card {
      border: none;
      border-radius: 12px;
      overflow: hidden;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
      transition: transform 0.2s ease;
    }

    .event-card:hover {
      transform: translateY(-5px);
    }

    .event-img {
      height: 180px;
      object-fit: cover;
      width: 100%;
    }

    .badge-price {
      background-color: #28a745;
      color: white;
      font-size: 14px;
      padding: 6px 12px;
      border-radius: 20px;
    }

    .badge-interested {
      color: #007bff;
      font-size: 13px;
    }

    .event-info {
      padding: 15px;
    }

    .event-date {
      font-weight: 500;
      color: #444;
    }

    .event-title {
      font-size: 18px;
      font-weight: 600;
      margin-top: 8px;
      margin-bottom: 4px;
    }

    .event-location {
      font-size: 14px;
      color: #777;
    }
  </style>
</head>
<body>

<div class="container my-5">
  <h3 class="mb-4 font-weight-bold">Dance events in <span class="text-primary">Ahmedabad</span></h3>
  <div class="row">

    <!-- Card 1 -->
    <div class="col-md-4 mb-4">
      <div class="card event-card">
        <img src="aset/dance/d1.jpg" alt="HipHop Jam" class="event-img">
        <div class="event-info">
          <div class="event-title">Chalo! Malaysia HipHop Jam</div>
          <div class="event-location">At Good Place Cafe</div>
          <div class="d-flex justify-content-between align-items-center mt-2">
            <span class="event-date">SUN, 06 APR</span>
            <span class="badge-price">INR 400</span>
          </div>
          <small class="badge-interested mt-1 d-block">★ 36 Interested</small>
        </div>
      </div>
    </div>

    <!-- Card 2 -->
    <div class="col-md-4 mb-4">
      <div class="card event-card">
        <img src="aset/dance/d2.jpg" alt="Ballet" class="event-img">
        <div class="event-info">
          <div class="event-title">Cirque du Ballet: Annual Student Dance Recital</div>
          <div class="event-location">Tagore Memorial Hall: Ahmedabad</div>
          <div class="d-flex justify-content-between align-items-center mt-2">
            <span class="event-date">20 APR ONWARDS</span>
            <span class="badge-price">Free</span>
          </div>
          <small class="badge-interested mt-1 d-block">★ 12 Interested</small>
        </div>
      </div>
    </div>

    <!-- Card 3 -->
    <div class="col-md-4 mb-4">
      <div class="card event-card">
        <img src="aset/dance/d3.jpg" alt="Dance Meditation" class="event-img">
        <div class="event-info">
          <div class="event-title">Dance meditation: Find your Rhythm, Free your Mind</div>
          <div class="event-location">Soul Square</div>
          <div class="d-flex justify-content-between align-items-center mt-2">
            <span class="event-date">SAT, 12 APR</span>
            <span class="badge-price">INR 777</span>
          </div>
        </div>
      </div>
    </div>

    <!-- Card 4 -->
    <div class="col-md-4 mb-4">
      <div class="card event-card">
        <img src="aset/dance/d4.jpg" alt="Bollywood Night" class="event-img">
        <div class="event-info">
          <div class="event-title">HIT PLAY BOLLYTECH NIGHT</div>
          <div class="event-location">Venue to be announced</div>
          <div class="d-flex justify-content-between align-items-center mt-2">
            <span class="event-date">SAT, 10 MAY</span>
            <span class="badge-price">INR 799</span>
          </div>
        </div>
      </div>
    </div>

    <!-- Card 5 -->
    <div class="col-md-4 mb-4">
      <div class="card event-card">
        <img src="aset/dance/d5.jpg" alt="Harmony Dance Meditation" class="event-img">
        <div class="event-info">
          <div class="event-title">Harmony in motion: Dance meditation</div>
          <div class="event-location">Cafe Aarmbh, Ahmedabad</div>
          <div class="d-flex justify-content-between align-items-center mt-2">
            <span class="event-date">SAT, 19 APR</span>
            <span class="badge-price">INR 555</span>
          </div>
        </div>
      </div>
    </div>

  </div>
</div>

</body>
</html>
    
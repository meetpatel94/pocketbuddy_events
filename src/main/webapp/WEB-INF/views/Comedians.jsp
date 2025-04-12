<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PocketBuddy - Comedy Stars</title>

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

<!-- Bootstrap -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<style>
  body {
    background-color: #f8f9fa;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  }
  
  .comedy-header {
    background-color: #6f42c1;
    color: white;
    padding: 40px 0;
    margin-bottom: 40px;
    text-align: center;
  }
  
  .comedy-header h1 {
    font-weight: 700;
    margin-bottom: 10px;
  }
  
  .comedy-header p {
    font-size: 1.2rem;
    opacity: 0.9;
  }
  
  .comedian-card {
    background: white;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    margin-bottom: 30px;
    transition: transform 0.3s ease;
  }
  
  .comedian-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 25px rgba(0,0,0,0.15);
  }
  
  .comedian-img {
    height: 250px;
    object-fit: cover;
    width: 100%;
    border-bottom: 3px solid #6f42c1;
  }
  
  .comedian-info {
    padding: 20px;
  }
  
  .comedian-name {
    color: #6f42c1;
    font-weight: 700;
    margin-bottom: 5px;
  }
  
  .comedy-style {
    display: inline-block;
    background-color: #6f42c1;
    color: white;
    padding: 3px 12px;
    border-radius: 20px;
    font-size: 0.8rem;
    margin-bottom: 10px;
  }
  
  .comedian-desc {
    color: #555;
    margin-bottom: 15px;
  }
  
  .social-links {
    margin-top: 15px;
  }
  
  .social-links a {
    display: inline-block;
    width: 36px;
    height: 36px;
    background-color: #f0e6ff;
    color: #6f42c1;
    border-radius: 50%;
    text-align: center;
    line-height: 36px;
    margin-right: 8px;
    transition: all 0.3s ease;
  }
  
  .social-links a:hover {
    background-color: #6f42c1;
    color: white;
    transform: scale(1.1);
  }
  
  .container {
    max-width: 1200px;
  }
</style>
</head>
<body>

<!-- Header Section -->
<div class="comedy-header">
  <div class="container">
    <h1>PocketBuddy</h1>
    <h2>Comedy Event Stars</h2>
    <p>Laugh your heart out with our stellar lineup</p>
  </div>
</div>

<!-- Comedians Grid -->
<div class="container">
  <div class="row">
    <!-- Comedian 1 -->
    <div class="col-md-4 col-sm-6">
      <div class="comedian-card">
        <img src="images/comedians/mike-laughter.jpg" alt="Mike Laughter" class="comedian-img">
        <div class="comedian-info">
          <h3 class="comedian-name">Mike Laughter</h3>
          <span class="comedy-style">Stand Up</span>
          <p class="comedian-desc">Master of observational comedy</p>
          <div class="social-links">
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-youtube"></i></a>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Comedian 2 -->
    <div class="col-md-4 col-sm-6">
      <div class="comedian-card">
        <img src="images/comedians/sarah-satire.jpg" alt="Sarah Satire" class="comedian-img">
        <div class="comedian-info">
          <h3 class="comedian-name">Sarah Satire</h3>
          <span class="comedy-style">Satire</span>
          <p class="comedian-desc">Queen of dark humor & satire</p>
          <div class="social-links">
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-youtube"></i></a>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Comedian 3 -->
    <div class="col-md-4 col-sm-6">
      <div class="comedian-card">
        <img src="images/comedians/tommy-improv.jpg" alt="Tommy Improv" class="comedian-img">
        <div class="comedian-info">
          <h3 class="comedian-name">Tommy Improv</h3>
          <span class="comedy-style">Improv</span>
          <p class="comedian-desc">Improv genius with quick wit</p>
          <div class="social-links">
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-youtube"></i></a>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Comedian 4 -->
    <div class="col-md-4 col-sm-6">
      <div class="comedian-card">
        <img src="images/comedians/lucy-punchline.jpg" alt="Lucy Punchline" class="comedian-img">
        <div class="comedian-info">
          <h3 class="comedian-name">Lucy Punchline</h3>
          <span class="comedy-style">Stand Up</span>
          <p class="comedian-desc">Stand-up sensation with viral jokes</p>
          <div class="social-links">
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-youtube"></i></a>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Comedian 5 -->
    <div class="col-md-4 col-sm-6">
      <div class="comedian-card">
        <img src="images/comedians/dave-roast.jpg" alt="Dave Roast" class="comedian-img">
        <div class="comedian-info">
          <h3 class="comedian-name">Dave Roast</h3>
          <span class="comedy-style">Roast</span>
          <p class="comedian-desc">Roast battle champion</p>
          <div class="social-links">
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-youtube"></i></a>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Comedian 6 -->
    <div class="col-md-4 col-sm-6">
      <div class="comedian-card">
        <img src="images/comedians/jenny-witty.jpg" alt="Jenny Witty" class="comedian-img">
        <div class="comedian-info">
          <h3 class="comedian-name">Jenny Witty</h3>
          <span class="comedy-style">Wordplay</span>
          <p class="comedian-desc">Clever wordplay specialist</p>
          <div class="social-links">
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-youtube"></i></a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
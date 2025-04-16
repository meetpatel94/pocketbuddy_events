<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dance Show Performers</title>

<!-- Font Awesome for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
  #performers {
    padding: 80px 0;
    background-color: #f8f9fa;
  }
  
  .section-header {
    text-align: center;
    margin-bottom: 50px;
  }
  
  .section-header h2 {
    font-size: 36px;
    font-weight: 700;
    color: #2c3e50;
    margin-bottom: 15px;
    text-transform: uppercase;
    letter-spacing: 1px;
  }
  
  .section-header p {
    color: #7f8c8d;
    font-size: 18px;
    max-width: 700px;
    margin: 0 auto;
  }
  
  .dancer-card {
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    overflow: hidden;
    margin-bottom: 30px;
    transition: all 0.3s ease;
    position: relative;
  }
  
  .dancer-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 15px 30px rgba(0,0,0,0.2);
  }
  
  .dancer-card img {
    width: 100%;
    height: 300px;
    object-fit: cover;
    transition: all 0.3s ease;
  }
  
  .dancer-card:hover img {
    opacity: 0.9;
  }
  
  .featured-badge {
    position: absolute;
    top: 15px;
    right: 15px;
    background: #e74c3c;
    color: white;
    padding: 5px 10px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: bold;
    text-transform: uppercase;
    z-index: 2;
  }
  
  .dancer-details {
    padding: 20px;
    text-align: center;
  }
  
  .dancer-details h3 {
    font-size: 22px;
    font-weight: 600;
    margin-bottom: 5px;
  }
  
  .dancer-details h3 a {
    color: #2c3e50;
    text-decoration: none;
    transition: all 0.3s ease;
  }
  
  .dancer-details h3 a:hover {
    color: #e74c3c;
  }
  
  .dancer-details p {
    color: #7f8c8d;
    font-style: italic;
    margin-bottom: 15px;
  }
  
  .dance-style {
    display: inline-block;
    background: #3498db;
    color: white;
    padding: 3px 10px;
    border-radius: 20px;
    font-size: 12px;
    margin-bottom: 10px;
  }
  
  .social-links {
    margin-top: 15px;
  }
  
  .social-links a {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 36px;
    height: 36px;
    background: #f1f1f1;
    color: #2c3e50;
    border-radius: 50%;
    margin: 0 5px;
    transition: all 0.3s ease;
  }
  
  .social-links a:hover {
    background: #e74c3c;
    color: #fff;
    transform: scale(1.1);
  }
  
  /* Fallback for images */
  .dancer-card img {
    background: #eee;
    object-fit: contain;
  }
  
  /* Performance type indicators */
  .performance-type {
    position: absolute;
    top: 15px;
    left: 15px;
    background: rgba(0,0,0,0.7);
    color: white;
    padding: 3px 10px;
    border-radius: 20px;
    font-size: 12px;
    z-index: 2;
  }
</style>
</head>
<body>

<section id="performers" class="wow fadeInUp">
  <div class="container">
    <div class="section-header">
      <h2>Featured Dance Performers</h2>
      <p>Meet the incredible dancers and choreographers for this year's international dance showcase</p>
    </div>

    <div class="row">
      <div class="col-lg-4 col-md-6">
        <div class="dancer-card">
          <span class="featured-badge">Headliner</span>
          <span class="performance-type">Contemporary</span>
          <img src="data:image/jpeg;base64,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" alt="Mikhail Baryshnikov" class="img-fluid" onerror="this.src='https://randomuser.me/api/portraits/men/2.jpg'">
          <div class="dancer-details">
            <h3><a href="dancer-details.html">Mikhail Baryshnikov</a></h3>
            <span class="dance-style">Contemporary/Ballet</span>
            <p>Legendary dancer with 40+ years of performance experience</p>
            <div class="social-links">
              <a href="https://instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
              <a href="https://youtube.com" target="_blank"><i class="fab fa-youtube"></i></a>
              <a href="https://facebook.com" target="_blank"><i class="fab fa-facebook-f"></i></a>
              <a href="https://tiktok.com" target="_blank"><i class="fab fa-tiktok"></i></a>
            </div>
          </div>
        </div>
      </div>
      
      <div class="col-lg-4 col-md-6">
        <div class="dancer-card">
          <span class="featured-badge">Featured</span>
          <span class="performance-type">Hip-Hop</span>
          <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOS4tqtO5b03SggLYI0K4dfg7G8ZlzKQoOirfhREYoXur85kL0zLOTcfGK0UyJTD0SCS0&usqp=CAU" alt="Les Twins" class="img-fluid" onerror="this.src='https://randomuser.me/api/portraits/men/3.jpg'">
          <div class="dancer-details">
            <h3><a href="dancer-details.html">Les Twins</a></h3>
            <span class="dance-style">Hip-Hop/Street</span>
            <p>World champion hip-hop duo from France</p>
            <div class="social-links">
              <a href="https://instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
              <a href="https://youtube.com" target="_blank"><i class="fab fa-youtube"></i></a>
              <a href="https://facebook.com" target="_blank"><i class="fab fa-facebook-f"></i></a>
              <a href="https://tiktok.com" target="_blank"><i class="fab fa-tiktok"></i></a>
            </div>
          </div>
        </div>
      </div>
      
      <div class="col-lg-4 col-md-6">
        <div class="dancer-card">
          <span class="performance-type">Ballet</span>
          <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2cvj9bZbzBq8zwgdcM8e2mcu4wZpc_CJbSg&s" alt="Misty Copeland" class="img-fluid" onerror="this.src='https://randomuser.me/api/portraits/women/4.jpg'">
          <div class="dancer-details">
            <h3><a href="dancer-details.html">Misty Copeland</a></h3>
            <span class="dance-style">Classical Ballet</span>
            <p>Principal dancer at American Ballet Theatre</p>
            <div class="social-links">
              <a href="https://instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
              <a href="https://youtube.com" target="_blank"><i class="fab fa-youtube"></i></a>
              <a href="https://facebook.com" target="_blank"><i class="fab fa-facebook-f"></i></a>
              <a href="https://tiktok.com" target="_blank"><i class="fab fa-tiktok"></i></a>
            </div>
          </div>
        </div>
      </div>
      
      <div class="col-lg-4 col-md-6">
        <div class="dancer-card">
          <span class="featured-badge">Rising Star</span>
          <span class="performance-type">Breakdance</span>
          <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2GjGF6y3Xw4PmAYB3eS0M-cc9DRd02DBTxrN5EfGeZ53XV6UyvgYhlzIraqL_IwcVG-4&usqp=CAU" alt="B-Boy Lilou" class="img-fluid" onerror="this.src='https://randomuser.me/api/portraits/men/5.jpg'">
          <div class="dancer-details">
            <h3><a href="dancer-details.html">B-Boy Lilou</a></h3>
            <span class="dance-style">Breakdance</span>
            <p>Red Bull BC One World Champion</p>
            <div class="social-links">
              <a href="https://instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
              <a href="https://youtube.com" target="_blank"><i class="fab fa-youtube"></i></a>
              <a href="https://facebook.com" target="_blank"><i class="fab fa-facebook-f"></i></a>
              <a href="https://tiktok.com" target="_blank"><i class="fab fa-tiktok"></i></a>
            </div>
          </div>
        </div>
      </div>
      
      <div class="col-lg-4 col-md-6">
        <div class="dancer-card">
          <span class="featured-badge">Headliner</span>
          <span class="performance-type">Latin</span>
          <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSW28UpZq-iLhgDk1mhYNEonozn_Rj1OiDncQ&s" alt="Shakira" class="img-fluid" onerror="this.src='https://randomuser.me/api/portraits/women/1.jpg'">
          <div class="dancer-details">
            <h3><a href="dancer-details.html">Shakira</a></h3>
            <span class="dance-style">Latin/Bellydance</span>
            <p>International superstar known for her hip movements</p>
            <div class="social-links">
              <a href="https://instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
              <a href="https://youtube.com" target="_blank"><i class="fab fa-youtube"></i></a>
              <a href="https://facebook.com" target="_blank"><i class="fab fa-facebook-f"></i></a>
              <a href="https://tiktok.com" target="_blank"><i class="fab fa-tiktok"></i></a>
            </div>
          </div>
        </div>
      </div>
      
      <div class="col-lg-4 col-md-6">
        <div class="dancer-card">
          <span class="performance-type">K-Pop</span>
          <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdcLYo0u0nLjZ6zqlhUaGxPqtHA9sjNVncpg&s" alt="Lisa Manoban" class="img-fluid" onerror="this.src='https://randomuser.me/api/portraits/women/2.jpg'">
          <div class="dancer-details">
            <h3><a href="dancer-details.html">Lisa Manoban</a></h3>
            <span class="dance-style">K-Pop/Urban</span>
            <p>Main dancer of BLACKPINK</p>
            <div class="social-links">
              <a href="https://instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
              <a href="https://youtube.com" target="_blank"><i class="fab fa-youtube"></i></a>
              <a href="https://facebook.com" target="_blank"><i class="fab fa-facebook-f"></i></a>
              <a href="https://tiktok.com" target="_blank"><i class="fab fa-tiktok"></i></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Bootstrap JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- WOW.js for animations -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
<script>
  new WOW().init();
</script>

</body>
</html>
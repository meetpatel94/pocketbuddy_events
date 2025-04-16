<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Music Festival Performers</title>

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
  }
  .social a i{
    background-color: black;
  }
  .section-header p {
    color: #7f8c8d;
    font-size: 18px;
  }
  
  .performer-card {
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    overflow: hidden;
    margin-bottom: 30px;
    transition: all 0.3s ease;
  }
  
  .performer-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 15px 30px rgba(0,0,0,0.2);
  }
  
  .performer-card img {
    width: 100%;
    height: 300px;
    object-fit: cover;
    transition: all 0.3s ease;
  }
  
  .performer-card:hover img {
    opacity: 0.9;
  }
  
  .details {
    padding: 20px;
    text-align: center;
  }
  
  .details h3 {
    font-size: 22px;
    font-weight: 600;
    margin-bottom: 5px;
  }
  
  .details h3 a {
    color: #2c3e50;
    text-decoration: none;
    transition: all 0.3s ease;
  }
  
  .details h3 a:hover {
    color: #3498db;
  }
  
  .details p {
    color: #7f8c8d;
    font-style: italic;
    margin-bottom: 15px;
  }
  
  .social {
    margin-top: 15px;
  }
  
  .social a {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 36px;
    height: 36px;
    background: #f1f1f1;
    color: #2c3e50;
    border-radius: 50%;
    margin: 24px 5px;
    transition: all 0.3s ease;
  }
  
  .social a:hover {
    background: #3498db;
    color: #fff;
    transform: scale(1.1);
  }
  
  /* Fallback for images */
  .performer-card img {
    background: #eee;
    object-fit: contain;
  }
</style>
</head>
<body>

<section id="performers" class="wow fadeInUp">
  <div class="container">
    <div class="section-header">
      <h2>🎤 Music Festival Stars</h2>
      <p>Experience the electrifying performances of our stellar lineup</p>
    </div>

    <div class="row">
      <div class="col-lg-4 col-md-6">
        <div class="performer-card">
          <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTeRGJKU0ku4AP8adAml-GzMaZ4gFLw6vwgA&s" alt="Ariana Grande" class="img-fluid" onerror="this.src='https://randomuser.me/api/portraits/women/44.jpg'">
          <div class="details">
            <h3><a href="performer-details.html">Ariana Grande</a></h3>
            <p>Pop sensation with record-breaking hits</p>
            <div class="social">
              <a href="https://twitter.com/ArianaGrande" target="_blank"><i class="fab fa-twitter"></i></a>
              <a href="https://facebook.com/arianagrande" target="_blank"><i class="fab fa-facebook-f"></i></a>
              <a href="https://linkedin.com" target="_blank"><i class="fab fa-linkedin-in"></i></a>
              <a href="https://instagram.com/arianagrande" target="_blank"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
        </div>
      </div>
      
      <div class="col-lg-4 col-md-6">
        <div class="performer-card">
          <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWifGjxr8a5KjTMxhTiTcd4pn24PSGjktWpA&s" alt="The Weeknd" class="img-fluid" onerror="this.src='https://randomuser.me/api/portraits/men/32.jpg'">
          <div class="details">
            <h3><a href="performer-details.html">The Weeknd</a></h3>
            <p>R&B superstar with soulful vocals</p>
            <div class="social">
              <a href="https://twitter.com/theweeknd" target="_blank"><i class="fab fa-twitter"></i></a>
              <a href="https://facebook.com/theweeknd" target="_blank"><i class="fab fa-facebook-f"></i></a>
              <a href="https://linkedin.com" target="_blank"><i class="fab fa-linkedin-in"></i></a>
              <a href="https://instagram.com/theweeknd" target="_blank"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
        </div>
      </div>
      
      <div class="col-lg-4 col-md-6">
        <div class="performer-card">
          <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwChYnmdRYW1jdTSTxMRnpt4uwl3NXFQwPqg&s" alt="Billie Eilish" class="img-fluid" onerror="this.src='https://randomuser.me/api/portraits/women/33.jpg'">
          <div class="details">
            <h3><a href="performer-details.html">Billie Eilish</a></h3>
            <p>Genre-defying artist with haunting melodies</p>
            <div class="social">
              <a href="https://twitter.com/billieeilish" target="_blank"><i class="fab fa-twitter"></i></a>
              <a href="https://facebook.com/billieeilish" target="_blank"><i class="fab fa-facebook-f"></i></a>
              <a href="https://linkedin.com" target="_blank"><i class="fab fa-linkedin-in"></i></a>
              <a href="https://instagram.com/billieeilish" target="_blank"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
        </div>
      </div>
      
      <div class="col-lg-4 col-md-6">
        <div class="performer-card">
          <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnDskRhmfuuPEZSCNFiXU-TjhxqOsfmm2m6g&s" alt="BTS" class="img-fluid" onerror="this.src='https://randomuser.me/api/portraits/men/22.jpg'">
          <div class="details">
            <h3><a href="performer-details.html">BTS</a></h3>
            <p>Global K-pop phenomenon</p>
            <div class="social">
              <a href="https://twitter.com/BTS_twt" target="_blank"><i class="fab fa-twitter"></i></a>
              <a href="https://facebook.com/bangtan.official" target="_blank"><i class="fab fa-facebook-f"></i></a>
              <a href="https://linkedin.com" target="_blank"><i class="fab fa-linkedin-in"></i></a>
              <a href="https://instagram.com/bts.bighitofficial" target="_blank"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
        </div>
      </div>
      
      <div class="col-lg-4 col-md-6">
        <div class="performer-card">
          <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSf6mbsNTIr5nLOH49_T8GLdYIqnbKFx42XQ&s" alt="Dua Lipa" class="img-fluid" onerror="this.src='https://randomuser.me/api/portraits/women/55.jpg'">
          <div class="details">
            <h3><a href="performer-details.html">Dua Lipa</a></h3>
            <p>Dance-pop queen with infectious beats</p>
            <div class="social">
              <a href="https://twitter.com/DUALIPA" target="_blank"><i class="fab fa-twitter"></i></a>
              <a href="https://facebook.com/dualipaofficial" target="_blank"><i class="fab fa-facebook-f"></i></a>
              <a href="https://linkedin.com" target="_blank"><i class="fab fa-linkedin-in"></i></a>
              <a href="https://instagram.com/dualipa" target="_blank"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
        </div>
      </div>
      
      <div class="col-lg-4 col-md-6">
        <div class="performer-card">
          <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQj5jOh-gNtf38UQKk5A2QYMaXuZUD1AlSXcw&s" alt="Ed Sheeran" class="img-fluid" onerror="this.src='https://randomuser.me/api/portraits/men/11.jpg'">
          <div class="details">
            <h3><a href="performer-details.html">Ed Sheeran</a></h3>
            <p>Singer-songwriter with heartfelt lyrics</p>
            <div class="social">
              <a href="https://twitter.com/edsheeran" target="_blank"><i class="fab fa-twitter"></i></a>
              <a href="https://facebook.com/EdSheeranMusic" target="_blank"><i class="fab fa-facebook-f"></i></a>
              <a href="https://linkedin.com" target="_blank"><i class="fab fa-linkedin-in"></i></a>
              <a href="https://instagram.com/teddysphotos" target="_blank"><i class="fab fa-instagram"></i></a>
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
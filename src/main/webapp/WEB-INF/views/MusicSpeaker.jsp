<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Music Stars Lineup</title>

<!-- Bootstrap & FontAwesome -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

<!-- Animate.css & WOW.js -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>

<style>
  #lineupSection {
    padding: 60px 0;
    background-color: #f2f4f8;
  }

  .headline-box {
    text-align: center;
    margin-bottom: 40px;
  }

  .headline-box h2 {
    font-size: 34px;
    font-weight: bold;
    color: #222;
  }

  .headline-box p {
    color: #666;
    font-size: 15px;
  }

  .performer-grid {
    display: flex;
    flex-wrap: wrap;
    gap: 30px;
    justify-content: center;
  }

  .performer-card {
    flex: 1 1 300px;
    max-width: 300px;
    display: flex;
  }

  .card-wrapper {
    background: #fff;
    border-radius: 16px;
    box-shadow: 0 6px 16px rgba(0,0,0,0.1);
    overflow: hidden;
    transition: 0.3s ease-in-out;
    display: flex;
    flex-direction: column;
    width: 100%;
  }

  .card-wrapper:hover {
    transform: translateY(-8px);
    box-shadow: 0 10px 24px rgba(0,0,0,0.15);
  }

  .card-wrapper img {
    width: 100%;
    height: 210px;
    object-fit: cover;
  }

  .info-box {
    padding: 18px;
    flex-grow: 1;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    text-align: center;
  }

  .info-box h3 a {
    font-size: 19px;
    font-weight: 600;
    color: #0056d2;
    text-decoration: none;
  }

  .info-box h3 a:hover {
    color: #0040a8;
  }

  .info-box p {
    color: #555;
    font-size: 14px;
    margin-top: 8px;
    margin-bottom: 18px;
  }

  .media-links {
    display: flex;
    justify-content: center;
    gap: 14px;
    flex-wrap: wrap;
  }

  .media-links a {
    display: inline-flex;
    width: 36px;
    height: 36px;
    border-radius: 50%;
    background: #e2e6ea;
    color: #333;
    align-items: center;
    justify-content: center;
    font-size: 16px;
    transition: all 0.3s ease-in-out;
  }

  .media-links a:hover {
    background: #0056d2;
    color: #fff;
    transform: scale(1.1);
  }

  @media (max-width: 768px) {
    .performer-card {
      max-width: 100%;
    }
  }
</style>

<script>
  new WOW().init();
</script>
</head>
<body>

<section id="lineupSection" class="py-5">
  <div class="container">
    <div class="headline-box">
      <h2 class="animate__animated animate__fadeInDown">🎤 Music Event Singers</h2>
      <p class="animate__animated animate__fadeInUp">An unforgettable lineup of talent and energy</p>
    </div>

    <div class="performer-grid">
      <% 
        String[] names = {"Ariana Melody", "Leo Harmon", "Chloe Rivera", "Zane Walker", "Nia Brooks", "Ethan Blaze"};
        String[] descs = {
          "Pop sensation with global hits", "Soulful voice with powerful performances",
          "Queen of jazz and blues", "Rockstar with electrifying energy",
          "R&B artist with a magical touch", "Hip-hop artist with a global fanbase"
        };
        for (int i = 0; i < names.length; i++) {
      %>
        <div class="performer-card d-flex align-items-stretch wow animate__animated animate__zoomIn" data-wow-delay="<%= (i * 0.2) %>s">
          <div class="card-wrapper">
            <img src="singers/s<%= i + 1 %>.jpg" alt="Performer <%= i + 1 %>" class="img-fluid">
            <div class="info-box">
              <div>
                <h3><a href="singer-details.html"><%= names[i] %></a></h3>
                <p><%= descs[i] %></p>
              </div>
              <div class="media-links">
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-instagram"></i></a>
                <a href="#"><i class="fa fa-youtube"></i></a>
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

</body>
</html>

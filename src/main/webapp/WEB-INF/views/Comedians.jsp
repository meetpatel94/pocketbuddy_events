<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Comedy Stars Lineup</title>

<!-- Font Awesome 6 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

<!-- Bootstrap -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<!-- Animate.css & WOW.js -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>

<style>
  #lineupSection {
    padding: 60px 0;
    background-color: #f8f2f5;
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
    color: #d2008b;
    text-decoration: none;
  }

  .info-box h3 a:hover {
    color: #a8006d;
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
    background: #eae2e6;
    color: #333;
    align-items: center;
    justify-content: center;
    font-size: 16px;
    transition: all 0.3s ease-in-out;
  }

  .media-links a:hover {
    background: #d2008b;
    color: #fff;
    transform: scale(1.1);
  }

  @media (max-width: 768px) {
    .performer-card {
      max-width: 100%;
    }
  }
  .img-con{
   height:180px !important;
   width:300px;
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
      <h2 class="animate__animated animate__fadeInDown">Comedy Event Stars</h2>
      <p class="animate__animated animate__fadeInUp">A hilarious lineup of the funniest comedians today</p>
    </div>

    <div class="performer-grid">
      <% 
        String[] names = {"Dave Laughington", "Sarah Giggleman", "Mike Chuckles", "Tina Roastwell", "Carl Guffaw", "Lisa Snortworthy"};
        String[] descs = {
          "Master of observational comedy", 
          "Queen of witty one-liners",
          "Improvisation genius", 
          "Stand-up veteran with razor-sharp humor",
          "Dark comedy specialist", 
          "Satirical genius with political edge"
        };
        String[] imageUrls = {
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdcLYo0u0nLjZ6zqlhUaGxPqtHA9sjNVncpg&s",
          "https://i.ytimg.com/vi/AbASkLpKZSw/hq720.jpg?sqp=-oaymwEnCK4FEIIDSFryq4qpAxkIARUAAAAAGAElAADIQj0AgKJDuAK33r8Y&rs=AOn4CLBPoiJrJLxp6Ai36OjU89mucqVAIQ",
          "https://i.ytimg.com/vi/Du0teoQGUD4/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLBjZ6gcWrFpjW2bVFOAOMVXp5j4bA",
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQo5umQTEqs6i9nQxfxqCumnjCxTZAJSh_tor4myLHAxQXW2pNyQNPGbY-SM1OXi3gf1mg&usqp=CAU",
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLhtTlUAxM-XCsKmliEYI2YvfhZ18LbPBg9eyFgw3Xsg4XmhymKSqeckM_8F3QrkkQPKg&usqp=CAU",
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRe2f5Nf-hkqSrh383oVIHMQrh4y7nL_Vw3WPvJsfZp-Ipw5doS365roTsDuX1Dcyj8dRs&usqp=CAU",
        };
        
        for (int i = 0; i < names.length; i++) {
      %>
        <div class="performer-card d-flex align-items-stretch wow animate__animated animate__zoomIn" data-wow-delay="<%= (i * 0.2) %>s">
          <div class="card-wrapper">
            <img src="<%= imageUrls[i] %>" alt="<%= names[i] %>" class="img-fluid img-con">
            <div class="info-box">
              <div>
                <h3><a href="comedian-details.html"><%= names[i] %></a></h3>
                <p><%= descs[i] %></p>
              </div>
              <div class="media-links">
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-youtube"></i></a>
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
</html> --%>
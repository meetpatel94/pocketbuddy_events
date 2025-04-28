<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>PocketBuddy-ShowNearByEvents</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="img/logo.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <!-- Bootstrap CSS File -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="lib/animate/animate.min.css" rel="stylesheet">
  <link href="lib/venobox/venobox.css" rel="stylesheet">
  <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="css/style.css" rel="stylesheet">

  <!-- =======================================================
    Theme Name: TheEvent
    Theme URL: https://bootstrapmade.com/theevent-conference-event-bootstrap-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
   <style>
  button {
    background-color: #007bff;
    color: white;
    padding: 12px 24px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 18px;
    transition: 0.3s ease-in-out;
}

button:hover {
    background-color: #0056b3;
}

/* Popup Styles */
.popup {
    display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%) scale(0.8);
    background: white;
    padding: 20px 20px 0px 20px;
    box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.3);
    border-radius: 12px;
    width: 440px;
    text-align: center;
    opacity: 0;
    transition: transform 0.3s ease-out, opacity 0.3s ease-out;
    z-index: 1000;
}

.popup.show {
    display: block;
    opacity: 1;
    transform: translate(-50%, -50%) scale(1);
}

/* Star Rating */
.stars {
    display: flex;
    justify-content: center;
    margin: 10px 0;
}

.star {
    font-size: 35px;
    cursor: pointer;
    color: lightgray;
    transition: color 0.2s ease-in-out;
}

.star:hover,
.star.active {
    color: gold;
}

/* Form Styling */
form {
    display: flex;
    flex-direction: column;
    align-items: center;
}

select, input[type="number"], input[type="text"] {
    width: 90%;
    padding: 8px;
    margin: 8px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
}

input[type="submit"] {
    background-color: #28a745;
    color: white;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
    border-radius: 5px;
    font-size: 16px;
    transition: 0.3s ease-in-out;
}

input[type="submit"]:hover {
    background-color: #218838;
}

/* Close Button */
.close {
    background: red;
    color: white;
    border: none;
    padding: 8px 15px;
    cursor: pointer;
    border-radius: 5px;
    margin-top: 10px;
    transition: 0.3s ease-in-out;
}

.close:hover {
    background: darkred;
}

/* Emoji Display */
.emoji {
    font-size: 40px;
    margin-top: 10px;
    opacity: 0;
    transition: opacity 0.3s ease-in-out, transform 0.3s ease-in-out;
}

.emoji.show {
    opacity: 1;
    transform: scale(1.1);
}

/* Responsive Design */
@media (max-width: 400px) {
    .popup {
        width: 90%;
    }
}
.events-container {
    font-family: 'Segoe UI', sans-serif;
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}

h1 {
    color: #333;
    text-align: center;
    margin-bottom: 30px;
}

.trending-shows h2 {
    color: #ff4757;
    margin-bottom: 25px;
    font-size: 24px;
}

.shows-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
    gap: 25px;
    margin-bottom: 40px;
}

.show-card {
    background: white;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    transition: transform 0.3s ease;
}

.show-card:hover {
    transform: translateY(-5px);
}

.show-image {
    height: 180px;
    background-size: cover;
    background-position: center;
    position: relative;
}

.price-tag {
    position: absolute;
    top: 15px;
    right: 15px;
    background: rgba(0,0,0,0.7);
    color: white;
    padding: 5px 10px;
    border-radius: 20px;
    font-weight: bold;
}

.show-info {
    padding: 15px;
}

.show-info h3 {
    margin: 0 0 5px 0;
    font-size: 18px;
    color: #333;
}

.artist {
    color: #666;
    font-size: 14px;
    margin: 0 0 8px 0;
}

.venue-date {
    color: #888;
    font-size: 13px;
    margin: 0 0 10px 0;
}

.stats {
    display: flex;
    align-items: center;
    font-size: 13px;
}

.interested {
    color: #888;
    display: flex;
    align-items: center;
}

.interested::before {
    content: "•";
    margin: 0 5px;
    color: #ff4757;
}

.other-events h2 {
    color: #333;
    margin: 30px 0 20px 0;
    font-size: 22px;
}
/* Previous CSS remains the same, add these new styles */

.show-info {
    padding: 15px;
    display: flex;
    flex-direction: column;
    height: calc(100% - 180px); /* Adjust based on image height */
}

.book-btn {
    margin-top: auto;
    padding: 10px 15px;
    background-color: #432E54 !important;
    color: white !important;
    border: none;
    border-radius: 5px;
    font-weight: bold;
    cursor: pointer;
    transition: all 0.3s ease;
    width: 100%;
}
.book-btn a{
   color: white !important;
}
.book-btn:hover {
    background-color: #ff6b81;
    transform: translateY(-2px);
}

/* Make sure the card has proper height distribution */
.show-card {
    display: flex;
    flex-direction: column;
    height: 100%;
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .shows-grid {
        grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
    }
}

@media (max-width: 480px) {
    .shows-grid {
        grid-template-columns: 1fr;
    }
}

/*hereeee  */
#intro {
 background: url(../img/music.webp) top center;
}
.book-btn{
 display:none;
}
</style>
</head>
<body>

    <!--========================== Header ============================-->
    <jsp:include page="Header.jsp"></jsp:include>
    
    <!--========================== RatingPopupPage ============================-->
    <jsp:include page="RatingPopupPage.jsp"></jsp:include>
    
    <!--========================== Intro Section ============================-->
    <section id="intro">
    <div class="intro-container wow fadeIn">
      <h1 class="mb-4 pb-0"><br><span>Music</span> signifies the vibrant energy of the place!</h1>
      <p class="mb-4 pb-0">10-12 December, Downtown events</p>
      <a href="https://www.youtube.com/watch?v=jDDaplaOz7Q" class="venobox play-btn mb-4" data-vbtype="video"
        data-autoplay="true"></a>
      <a href="#about" class="about-btn scrollto">About The Event</a>
    </div>
  </section>

<main id="main">
  
    <!--========================== About Section ============================-->
     <section id="about">
      <div class="container">
        <div class="row">
          <div class="col-lg-6">
            <h2>About The Event</h2>
            <p>Sed nam ut dolor qui repellendus iusto odit. Possimus inventore eveniet accusamus error amet eius aut
              accusantium et. Non odit consequatur repudiandae sequi ea odio molestiae. Enim possimus sunt inventore in
              est ut optio sequi unde.</p>
          </div>
          <div class="col-lg-3">
            <h3>Where</h3>
            <p>Downtown Conference Center, Ahemdabad</p>
          </div>
          <div class="col-lg-3">
            <h3>When</h3>
            <p>Monday to Wednesday<br>10-12 December</p>
          </div>
        </div>
      </div>
    </section>
  
    <!--======================== Speakers Section ==========================-->
    <jsp:include page="MusicSpeaker.jsp"></jsp:include>
    
    <!--======================== Trending Music Shows Section ==========================-->
     <jsp:include page="MusicTrendingShows.jsp"></jsp:include>
    
    <!--========================  Music Shows Section ==========================-->
    <jsp:include page="MusicShows.jsp"></jsp:include>

    <!--======================== UpComing Music Shows Section ==========================-->
    <jsp:include page="UpComingMusicEvents.jsp"></jsp:include>

    <!--======================== Event Schedule Section ==========================-->

<section id="schedule" class="section-with-bg">
  <div class="container wow fadeInUp">
    <div class="section-header">
      <h2>Music Festival Schedule</h2>
      <p>Check out the artist lineup for each day</p>
    </div>

    <ul class="nav nav-tabs" role="tablist">
      <li class="nav-item">
        <a class="nav-link active" href="#day-1" role="tab" data-toggle="tab">Day 1</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#day-2" role="tab" data-toggle="tab">Day 2</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#day-3" role="tab" data-toggle="tab">Day 3</a>
      </li>
    </ul>

    <h3 class="sub-heading">Experience non-stop music, lights, and energy over three unforgettable days.</h3>

    <div class="tab-content row justify-content-center">

      <!-- Day 1 -->
      <div role="tabpanel" class="col-lg-9 tab-pane fade show active" id="day-1">
        <div class="row schedule-item">
          <div class="col-md-2"><time>03:00 PM</time></div>
          <div class="col-md-10">
            <h4>Gates Open</h4>
            <p>Welcome to Day 1 of the music fest! Get your wristbands and merch.</p>
          </div>
        </div>

        <div class="row schedule-item">
          <div class="col-md-2"><time>04:00 PM</time></div>
          <div class="col-md-10">
            <div class="speaker">
              <img src="aset/download.jpg" alt="DJ Nova">
            </div>
            <h4>Opening Set <span>DJ Nova</span></h4>
            <p>Setting the vibe with chill electronic beats and house mixes.</p>
          </div>
        </div>

        <div class="row schedule-item">
          <div class="col-md-2"><time>06:00 PM</time></div>
          <div class="col-md-10">
            <div class="speaker">
              <img src="aset/images1.jpg" alt="Luna Groove">
            </div>
            <h4>Live Band <span>Luna Groove</span></h4>
            <p>Indie fusion band bringing you soul, funk, and a lot of rhythm.</p>
          </div>
        </div>

        <div class="row schedule-item">
          <div class="col-md-2"><time>08:00 PM</time></div>
          <div class="col-md-10">
            <div class="speaker">
              <img src="aset/images2.jpg" alt="MC Blaze">
            </div>
            <h4>Rap Showcase <span>MC Blaze</span></h4>
            <p>High-energy hip-hop with powerful verses and crowd interaction.</p>
          </div>
        </div>

        <div class="row schedule-item">
          <div class="col-md-2"><time>10:00 PM</time></div>
          <div class="col-md-10">
            <div class="speaker">
              <img src="aset/images3.jpg" alt="DJ Sonic">
            </div>
            <h4>Headliner <span>DJ Sonic</span></h4>
            <p>EDM and trance takeover with massive visuals and laser show.</p>
          </div>
        </div>
      </div>
      <!-- End Day 1 -->

      <!-- Day 2 -->
      <div role="tabpanel" class="col-lg-9 tab-pane fade" id="day-2">
        <div class="row schedule-item">
          <div class="col-md-2"><time>03:00 PM</time></div>
          <div class="col-md-10">
            <h4>Gates Open</h4>
            <p>Grab a drink, find your crew, and get ready for Day 2!</p>
          </div>
        </div>

        <div class="row schedule-item">
          <div class="col-md-2"><time>04:00 PM</time></div>
          <div class="col-md-10">
            <div class="speaker">
              <img src="aset/images4.jpg" alt="Synthwave Saints">
            </div>
            <h4>Retro Set <span>Synthwave Saints</span></h4>
            <p>Take a ride through nostalgic 80s synths and vaporwave vibes.</p>
          </div>
        </div>

        <div class="row schedule-item">
          <div class="col-md-2"><time>06:00 PM</time></div>
          <div class="col-md-10">
            <div class="speaker">
              <img src="aset/images5.jpg" alt="Aurora Vox">
            </div>
            <h4>Vocal Performance <span>Aurora Vox</span></h4>
            <p>Powerful solo act with stunning vocals and visual storytelling.</p>
          </div>
        </div>

        <div class="row schedule-item">
          <div class="col-md-2"><time>08:00 PM</time></div>
          <div class="col-md-10">
            <div class="speaker">
              <img src="aset/images6.jpg" alt="The Beatroots">
            </div>
            <h4>Funk & Jazz Fusion <span>The Beatroots</span></h4>
            <p>Get groovy with a live mix of funk, jazz, and dance tunes.</p>
          </div>
        </div>

        <div class="row schedule-item">
          <div class="col-md-2"><time>10:00 PM</time></div>
          <div class="col-md-10">
            <div class="speaker">
              <img src="aset/images7.jpg" alt="DJ Pulse">
            </div>
            <h4>Night Rave <span>DJ Pulse</span></h4>
            <p>Non-stop dance tracks under the stars with light shows and fireworks.</p>
          </div>
        </div>
      </div>
      <!-- End Day 2 -->

      <!-- Day 3 -->
      <div role="tabpanel" class="col-lg-9 tab-pane fade" id="day-3">
        <div class="row schedule-item">
          <div class="col-md-2"><time>03:00 PM</time></div>
          <div class="col-md-10">
            <h4>Gates Open</h4>
            <p>The final day—let’s go out with a bang!</p>
          </div>
        </div>

        <div class="row schedule-item">
          <div class="col-md-2"><time>04:00 PM</time></div>
          <div class="col-md-10">
            <div class="speaker">
              <img src="aset/hiphop.webp" alt="Skyline Harmony">
            </div>
            <h4>Chill Pop <span>Skyline Harmony</span></h4>
            <p>Smooth vocals and dreamy melodies to set the evening tone.</p>
          </div>
        </div>

        <div class="row schedule-item">
          <div class="col-md-2"><time>06:00 PM</time></div>
          <div class="col-md-10">
            <div class="speaker">
              <img src="aset/bassover.jpg" alt="Roxxie Raze">
            </div>
            <h4>Rock Set <span>Roxxie Raze</span></h4>
            <p>High-voltage rock n’ roll with crowd-surfing energy.</p>
          </div>
        </div>

        <div class="row schedule-item">
          <div class="col-md-2"><time>08:00 PM</time></div>
          <div class="col-md-10">
            <div class="speaker">
              <img src="img/dance.webp" alt="DJ Neonix">
            </div>
            <h4>Finale Set <span>DJ Neonix</span></h4>
            <p>Massive EDM finale with pyrotechnics, lasers, and surprises.</p>
          </div>
        </div>
      </div>
      <!-- End Day 3 -->

    </div>
  </div>
</section>
    

    <!--========================== Event Venue Section ============================-->
    <jsp:include page="EventVenue.jsp"></jsp:include>  

    <!--========================== Hotels Section ============================-->
    <%-- <jsp:include page="Hotel.jsp"></jsp:include> --%>

    <!--========================== Gallery Section ============================-->
    <jsp:include page="Gallery.jsp"></jsp:include>

    <!--========================== Sponsors Section ============================-->
    <jsp:include page="Sponsors.jsp"></jsp:include>

    <!--========================== F.A.Q Section ============================-->
    <jsp:include page="FAQ.jsp"></jsp:include>
    
    <!--========================== BuyTicket Section ============================-->
    <jsp:include page="BuyTicketSection.jsp"></jsp:include>
    
    <!--========================== Contact Section ============================-->
    <jsp:include page="ContactUs.jsp"></jsp:include>
   

</main>

  <!--============================== Footer ============================-->
  <jsp:include page="Footer.jsp"></jsp:include>

  <a href="#" class="back-to-top"><i class="fa fa-angle-up"></i></a>

  <!-- JavaScript Libraries -->
  <jsp:include page="JS.jsp"></jsp:include>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js" integrity="sha512-fD9DI5bZwQxOi7MhYWnnNPlvXdp/2Pj3XSTRrFs5FQa4mizyGLnJcN6tuvUS6LbmgN1ut+XGSABKvjN0H6Aoow==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  
</body>
</html>

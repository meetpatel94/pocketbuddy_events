<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section id="contact" class="section-bg wow fadeInUp " >
      <div class="container">
        <div class="section-header">
          <h2 style="color:#432E54;">Contact Us</h2>
        </div>
        <div class="row contact-info">
          <div class="col-md-4">
            <div class="contact-address">
              <i class="ion-ios-location-outline"></i>
              <h3>Address</h3>
              <address style="color:#007bff;">A108 Adam Street, NY 535022, USA</address>
            </div>
          </div>

          <div class="col-md-4">
            <div class="contact-phone">
              <i class="ion-ios-telephone-outline"></i>
              <h3>Phone Number</h3>
              <p ><a href="tel:+155895548855">+1 5589 55488 55</a></p>
            </div>
          </div>

          <div class="col-md-4">
            <div class="contact-email">
              <i class="ion-ios-email-outline"></i>
              <h3>Email</h3>
              <p><a href="mailto:info@example.com">info@example.com</a></p>
            </div>
          </div>

        </div>

        <div class="form">
          <div id="sendmessage">Your message has been sent. Thank you!</div>
          <div id="errormessage"></div>
          <form action="savecomments" method="post" role="form" >
            <div class="form-row">
              <div class="form-group col-md-14">
                <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" required />
                <div class="validation"></div>
              </div>
              <div class="form-group ">
                <input type="hidden" class="form-control" name="email" id="email" value="${user.email}" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" required />
                <div class="validation"></div>
              </div>
            </div>
            <div class="form-group">
              <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" required/>
              <div class="validation"></div>
            </div>
            <div class="form-group">
              <textarea class="form-control" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message" required></textarea>
              <div class="validation"></div>
            </div>
            <input type="date" name="date" id="commentDate" style="display: none;" />
            <input type="time" name="time" id="commentTime" style="display: none;" />
            
            <div class="text-center"><input type="submit" value="Send Message"></div>
            
          </form>
        </div>
      </div>
    </section><!-- #contact -->
    <script>
  document.addEventListener('DOMContentLoaded', function () {
    const dateInput = document.getElementById('commentDate');
    const timeInput = document.getElementById('commentTime');

    const now = new Date();

    // Format date as YYYY-MM-DD
    const dateStr = now.toISOString().split('T')[0];

    // Format time as HH:MM
    const timeStr = now.toTimeString().split(' ')[0].slice(0, 5);

    dateInput.value = dateStr;
    timeInput.value = timeStr;
  });
</script>
    
</body>
</html>
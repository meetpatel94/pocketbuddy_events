<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- Popup Box -->
<div id="ratingPopup" class="popup">
  <h2>Rate Your Experience</h2>
  
  <!-- Star Rating -->
  <div class="stars">
      <span class="star" onclick="rate(1)">★</span>
      <span class="star" onclick="rate(2)">★</span>
      <span class="star" onclick="rate(3)">★</span>
      <span class="star" onclick="rate(4)">★</span>
      <span class="star" onclick="rate(5)">★</span>
  </div>

  <!-- Emoji Display -->
  <div id="emojiDisplay" class="emoji"></div>

  <!-- Rating Form -->
  <form action="rateduser" method="post">
      <label for="exp">Experience:</label>
      <select name="exp" id="exp" required onchange="updateEmoji()">
          <option value="">Select</option>
          <option value="Poor">Poor</option>
          <option value="Good">Good</option>
          <option value="Very Satisfied">Very Satisfied</option>
      </select>

      <label for="rating">Rate:</label>
      <input type="number" name="rating" id="rating" min="1" max="5" required disabled>

      <label for="description">Description:</label>
      <input type="text" name="description" id="description" placeholder="Write a comment...">

      <input type="hidden" name="userId" value="${user.userId}">

      <input type="submit" value="Submit">
  </form>

  <button class="close" onclick="closePopup()">Close</button>
</div>
<script>
  function openPopup() {
      let popup = document.getElementById("ratingPopup");
      popup.classList.add("show");
  }

  function closePopup() {
      let popup = document.getElementById("ratingPopup");
      popup.classList.remove("show");
  }

  function rate(stars) {
      let allStars = document.querySelectorAll(".star");
      allStars.forEach((star, index) => {
          star.classList.toggle("active", index < stars);
      });
      document.getElementById("rating").value = stars; // Update rating input
  }

  function updateEmoji() {
      let experience = document.getElementById("exp").value;
      let emojiDisplay = document.getElementById("emojiDisplay");

      let emoji = "";
      if (experience === "Poor") {
          emoji = "😞";
      } else if (experience === "Good") {
          emoji = "😊";
      } else if (experience === "Very Satisfied") {
          emoji = "😍";
      }

      emojiDisplay.innerHTML = emoji;
      if (emoji) {
          emojiDisplay.classList.add("show");
      } else {
          emojiDisplay.classList.remove("show");
      }
  }
</script>
</body>
</html>
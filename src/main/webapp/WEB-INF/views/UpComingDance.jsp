<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Dance Shows</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
  <style>
    :root {
      --primary-color: #432E54;
      --secondary-color: #f82249;
    }

    body {
      background-color: #f8f9fa;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .events-container {
      padding: 30px 0;
    }

    .section-header {
      text-align: center;
      margin-bottom: 30px;
    }

    .section-header h2 {
      color: var(--primary-color);
      font-weight: 700;
      margin-bottom: 15px;
    }

    .city-filter {
      max-width: 300px;
      margin: 0 auto 20px;
    }

    .events-table {
      width: 100%;
      background: white;
      border-radius: 10px;
      box-shadow: 0 2px 15px rgba(0,0,0,0.1);
      overflow: hidden;
    }

    .events-table table {
      width: 100%;
      border-collapse: collapse;
    }

    .events-table th {
      background-color: var(--primary-color);
      color: white;
      padding: 15px;
      text-align: left;
      font-weight: 500;
    }

    .events-table td {
      padding: 15px;
      border-bottom: 1px solid #f0f0f0;
      vertical-align: middle;
    }

    .events-table tr:hover {
      background-color: #f9f9f9;
    }

    .book-btn {
      background-color: var(--primary-color);
      color: white;
      border: none;
      padding: 8px 15px;
      border-radius: 5px;
      cursor: pointer;
      transition: all 0.3s;
      font-weight: 500;
    }

    .book-btn:hover {
      background-color: var(--secondary-color);
      transform: translateY(-2px);
      box-shadow: 0 3px 10px rgba(0,0,0,0.2);
    }

    @media (max-width: 768px) {
      .events-table {
        display: block;
        overflow-x: auto;
      }

      .events-table th, 
      .events-table td {
        white-space: nowrap;
      }
    }
  </style>
</head>
<body>
  <div class="events-container">
    <div class="container">
      <div class="section-header">
        <h2>Upcoming Dance Shows</h2>
        <div class="city-filter">
          <select id="dance-city-select" class="form-select">
            <option value="ahmedabad">Ahmedabad</option>
            <option value="delhi">Delhi</option>
            <option value="mumbai">Mumbai</option>
            <option value="bangalore">Bangalore</option>
          </select>
        </div>
      </div>

      <div class="events-table">
        <table>
          <thead>
            <tr>
              <th>Date</th>
              <th>Show</th>
              <th>Venue</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody id="dance-events-body">
            <!-- Ahmedabad -->
            <tr data-city="ahmedabad">
              <td>10 Apr 2025</td>
              <td>Rhythm of Gujarat</td>
              <td>Town Hall</td>
              <td><button class="book-btn">Book Now</button></td>
            </tr>
            <tr data-city="ahmedabad">
              <td>15 Apr 2025</td>
              <td>Dance Fiesta</td>
              <td>Saputara Cultural Centre</td>
              <td><button class="book-btn">Book Now</button></td>
            </tr>
            <tr data-city="ahmedabad">
              <td>22 Apr 2025</td>
              <td>Garba Night Beats</td>
              <td>Riverfront Ground</td>
              <td><button class="book-btn">Book Now</button></td>
            </tr>

            <!-- Delhi -->
            <tr data-city="delhi">
              <td>18 Apr 2025</td>
              <td>Bharatanatyam Evening</td>
              <td>Kamani Auditorium</td>
              <td><button class="book-btn">Book Now</button></td>
            </tr>
            <tr data-city="delhi">
              <td>23 Apr 2025</td>
              <td>Hip-Hop Showcase</td>
              <td>Siri Fort Auditorium</td>
              <td><button class="book-btn">Book Now</button></td>
            </tr>
            <tr data-city="delhi">
              <td>28 Apr 2025</td>
              <td>Folk Dance Fair</td>
              <td>Indira Gandhi Indoor Stadium</td>
              <td><button class="book-btn">Book Now</button></td>
            </tr>

            <!-- Mumbai -->
            <tr data-city="mumbai">
              <td>20 Apr 2025</td>
              <td>Mumbai Street Dance Battle</td>
              <td>Mehboob Studio</td>
              <td><button class="book-btn">Book Now</button></td>
            </tr>
            <tr data-city="mumbai">
              <td>26 Apr 2025</td>
              <td>Bollywood Grooves</td>
              <td>Jio World Drive</td>
              <td><button class="book-btn">Book Now</button></td>
            </tr>
            <tr data-city="mumbai">
              <td>30 Apr 2025</td>
              <td>Classical Fusion Night</td>
              <td>NCPA Tata Theatre</td>
              <td><button class="book-btn">Book Now</button></td>
            </tr>

            <!-- Bangalore -->
            <tr data-city="bangalore">
              <td>25 Apr 2025</td>
              <td>Dance India Dance Tour</td>
              <td>Palace Grounds</td>
              <td><button class="book-btn">Book Now</button></td>
            </tr>
            <tr data-city="bangalore">
              <td>27 Apr 2025</td>
              <td>Contemporary Bliss</td>
              <td>Rangashankara Theatre</td>
              <td><button class="book-btn">Book Now</button></td>
            </tr>
            <tr data-city="bangalore">
              <td>01 May 2025</td>
              <td>Nritya Sammelan</td>
              <td>Chowdiah Memorial Hall</td>
              <td><button class="book-btn">Book Now</button></td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>

  <!-- Bootstrap JS Bundle -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <!-- jQuery -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <script>
    document.addEventListener('DOMContentLoaded', function () {
      const cityDropdown = document.getElementById('dance-city-select');
      const eventRows = document.querySelectorAll('#dance-events-body tr');

      function filterDanceEvents() {
        const selectedCity = cityDropdown.value;
        eventRows.forEach(row => {
          row.style.display = (row.getAttribute('data-city') === selectedCity) ? '' : 'none';
        });
      }

      // Initial filter
      filterDanceEvents();

      // On city change
      cityDropdown.addEventListener('change', filterDanceEvents);
    });
  </script>
</body>
</html>

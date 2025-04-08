<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* Modal Container */
/* Compact Ticket Modal CSS */
#buy-ticket-modal .modal-dialog {
  max-width: 500px;
  margin: 1.75rem auto;
}

#buy-ticket-modal .modal-content {
  border-radius: 12px;
  overflow: hidden;
  border: none;
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.15);
}

/* Header */
#buy-ticket-modal .modal-header {
  background: linear-gradient(135deg, #6e48aa 0%, #9d50bb 100%);
  padding: 1rem 1.5rem;
  border-bottom: none;
  color: white;
}

#buy-ticket-modal .modal-title {
  font-weight: 600;
  font-size: 1.25rem;
  margin: 0;
}

#buy-ticket-modal .close {
  color: white;
  opacity: 0.8;
  font-size: 1.5rem;
  padding: 0;
  margin: -0.5rem -0.5rem -0.5rem auto;
}

/* Body - Compact Layout */
#buy-ticket-modal .modal-body {
  padding: 1.5rem;
  max-height: calc(100vh - 200px);
  overflow-y: auto; /* Only scroll if absolutely necessary */
}

/* Compact Form Groups */
#buy-ticket-modal .form-group {
  margin-bottom: 1rem;
}

#buy-ticket-modal .form-group label {
  display: block;
  margin-bottom: 0.25rem;
  font-size: 0.85rem;
  font-weight: 500;
  color: #555;
}

#buy-ticket-modal .form-control {
  height: 40px;
  padding: 0.5rem 0.75rem;
  font-size: 0.9rem;
  border: 1px solid #ddd;
  border-radius: 6px;
  width: 100%;
}

#buy-ticket-modal select.form-control {
  appearance: none;
  background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
  background-repeat: no-repeat;
  background-position: right 0.75rem center;
  background-size: 12px;
}

/* Submit Button */
#buy-ticket-modal .btn {
  background: linear-gradient(135deg, #6e48aa 0%, #9d50bb 100%);
  color: white;
  border: none;
  padding: 0.6rem;
  font-weight: 600;
  font-size: 0.9rem;
  border-radius: 6px;
  width: 100%;
  margin-top: 0.5rem;
  transition: all 0.2s;
}

#buy-ticket-modal .btn:hover {
  opacity: 0.9;
  transform: translateY(-1px);
}

/* Remove section cards to save space */
.form-section {
  margin-bottom: 1rem;
}

.section-title {
  font-size: 0.95rem;
  color: #6e48aa;
  margin-bottom: 0.75rem;
  font-weight: 600;
}

/* Responsive adjustments */
@media (max-width: 576px) {
  #buy-ticket-modal .modal-dialog {
    margin: 0.5rem auto;
  }
  
  #buy-ticket-modal .modal-body {
    padding: 1rem;
  }
  
  #buy-ticket-modal .form-control {
    height: 38px;
  }
}

/* Focus states */
#buy-ticket-modal .form-control:focus {
  border-color: #9d50bb;
  box-shadow: 0 0 0 2px
</style>
</head>
<body>

 <section id="buy-tickets" class="section-with-bg wow fadeInUp">
      <div class="container">

        <div class="section-header">
          <h2>Booking Seats</h2>
          <p>Velit consequatur consequatur inventore iste fugit unde omnis eum aut.</p>
        </div>

        <div class="row">
          <div class="col-lg-4">
            <div class="card mb-5 mb-lg-0">
              <div class="card-body">
                <h5 class="card-title text-muted text-uppercase text-center">Standard Access</h5>
                <h6 class="card-price text-center">$150</h6>
                <hr>
                <ul class="fa-ul">
                  <li><span class="fa-li"><i class="fa fa-check"></i></span>Regular Seating</li>
                  <li><span class="fa-li"><i class="fa fa-check"></i></span>Coffee Break</li>
                  <li><span class="fa-li"><i class="fa fa-check"></i></span>Custom Badge</li>
                  <li class="text-muted"><span class="fa-li"><i class="fa fa-times"></i></span>Community Access</li>
                  <li class="text-muted"><span class="fa-li"><i class="fa fa-times"></i></span>Workshop Access</li>
                  <li class="text-muted"><span class="fa-li"><i class="fa fa-times"></i></span>After Party</li>
                </ul>
                <hr>
                <div class="text-center">
                  <button type="button" class="btn" data-toggle="modal" data-target="#buy-ticket-modal" data-ticket-type="standard-access" style="background-color:#432E54">Book Now</button>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="card mb-5 mb-lg-0">
              <div class="card-body">
                <h5 class="card-title text-muted text-uppercase text-center">Pro Access</h5>
                <h6 class="card-price text-center">$250</h6>
                <hr>
                <ul class="fa-ul">
                  <li><span class="fa-li"><i class="fa fa-check"></i></span>Regular Seating</li>
                  <li><span class="fa-li"><i class="fa fa-check"></i></span>Coffee Break</li>
                  <li><span class="fa-li"><i class="fa fa-check"></i></span>Custom Badge</li>
                  <li><span class="fa-li"><i class="fa fa-check"></i></span>Community Access</li>
                  <li class="text-muted"><span class="fa-li"><i class="fa fa-times"></i></span>Workshop Access</li>
                  <li class="text-muted"><span class="fa-li"><i class="fa fa-times"></i></span>After Party</li>
                </ul>
                <hr>
                <div class="text-center">
                  <button type="button" class="btn" data-toggle="modal" data-target="#buy-ticket-modal" data-ticket-type="pro-access" style="background-color:#432E54">Book Now</button>
                </div>
              </div>
            </div>
          </div>
          Pro Tier
          <div class="col-lg-4">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title text-muted text-uppercase text-center">Premium Access</h5>
                <h6 class="card-price text-center">$350</h6>
                <hr>
                <ul class="fa-ul">
                  <li><span class="fa-li"><i class="fa fa-check"></i></span>Regular Seating</li>
                  <li><span class="fa-li"><i class="fa fa-check"></i></span>Coffee Break</li>
                  <li><span class="fa-li"><i class="fa fa-check"></i></span>Custom Badge</li>
                  <li><span class="fa-li"><i class="fa fa-check"></i></span>Community Access</li>
                  <li><span class="fa-li"><i class="fa fa-check"></i></span>Workshop Access</li>
                  <li><span class="fa-li"><i class="fa fa-check"></i></span>After Party</li>
                </ul>
                <hr>
                <div class="text-center">
                  <button type="button" class="btn" data-toggle="modal" data-target="#buy-ticket-modal" data-ticket-type="premium-access" style="background-color:#432E54">Book Now</button>
                </div>

              </div>
            </div>
          </div>
        </div>

      </div>
   <div id="buy-ticket-modal" class="modal fade">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <h4 class="modal-title">Book Your Tickets</h4>
        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body p-4">
        <form method="POST" action="buyticket">
          Personal Information Section
          <div class="form-section mb-4">
            <h5 class="section-title mb-3">Personal Information</h5>
            <div class="form-group">
              <label for="firstName">Full Name</label>
              <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Enter your full name" required>
            </div>
            <div class="form-group">
              <label for="email">Email Address</label>
              <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
            </div>
          </div>
          
          Event Details Section
          <div class="form-section mb-4">
            <h5 class="section-title mb-3">Event Details</h5>
            <div class="form-group">
              <label for="date">Event Date</label>
              <input type="date" class="form-control" id="date" name="date" required>
            </div>
            <div class="form-group">
              <label for="event">Event Type</label>
              <select id="event" name="event" class="form-control" required>
                <option value="">-- Select Event --</option>
                <option value="music">Music</option>
                <option value="dance">Dance</option>
                <option value="comedy">Comedy</option>
                <option value="concerts">Concerts</option>
              </select>
            </div>
            <div class="form-group">
              <label for="seats">Number of Tickets</label>
              <input type="number" class="form-control" id="seats" name="seats" min="1" max="10" required>
            </div>
          </div>
          
          Ticket Type Section
          <div class="form-section mb-4">
            <h5 class="section-title mb-3">Ticket Options</h5>
            <div class="form-group">
              <label for="access">Ticket Type</label>
              <select id="access" name="access" class="form-control" required>
                <option value="">-- Select Ticket Type --</option>
                <option value="standard-access">Standard Access ($50)</option>
                <option value="pro-access">Pro Access ($75)</option>
                <option value="premium-access">Premium Access ($100)</option>
              </select>
            </div>
          </div>
          
          Submit Button
          <div class="text-center mt-4">
            <button type="submit" class="btn btn-primary btn-lg w-100 py-3">
              <i class="fas fa-ticket-alt mr-2"></i> Confirm Booking
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
</section>
</body>
</html> -->
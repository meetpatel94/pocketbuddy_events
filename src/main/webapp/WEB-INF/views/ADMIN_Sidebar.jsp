<div class="sidebar" data-background-color="dark">
  <div class="sidebar-logo">
    <!-- Logo Header -->
    <div class="logo-header" data-background-color="dark">
      <a href="admindashboard" class="logo">
      
        <img
          src="lg.png"
          alt="navbar brand"
          class="navbar-brand"
          height="40"
        />
      </a>
      <div class="nav-toggle">
        <button class="btn btn-toggle toggle-sidebar">
          <i class="gg-menu-right"></i>
        </button>
        <button class="btn btn-toggle sidenav-toggler">
          <i class="gg-menu-left"></i>
        </button>
      </div>
      <button class="topbar-toggler more">
        <i class="gg-more-vertical-alt"></i>
      </button>
    </div>
    <!-- End Logo Header -->
  </div>
  <div class="sidebar-wrapper scrollbar scrollbar-inner">
    <div class="sidebar-content">
      <ul class="nav nav-secondary">
        <li class="nav-section">
          <span class="sidebar-mini-icon">
            <i class="fa fa-ellipsis-h"></i>
          </span>
          <h4 class="text-section">MANAGE</h4>
        </li>

        <!-- Users Section -->
        <li class="nav-item">
          <a data-bs-toggle="collapse" href="#users">
            <i class="fas fa-users"></i>
            <p>Users</p>
            <span class="caret"></span>
          </a>
          <div class="collapse" id="users">
            <ul class="nav nav-collapse">
              <li>
                <a href="adduser">
                  <span class="sub-item">Add Users</span>
                </a>
              </li>
              <li>
                <a href="listuser">
                  <span class="sub-item">List Users</span>
                </a>
              </li> 
            </ul>
          </div>
        </li>

        <!-- Members Section -->
        <li class="nav-item">
          <a data-bs-toggle="collapse" href="#members">
            <i class="fas fa-user-friends"></i>
            <p>Members</p>
            <span class="caret"></span>
          </a>
          <div class="collapse" id="members">
            <ul class="nav nav-collapse">
              <li>
                <a href="newmember">
                  <span class="sub-item">Add Members</span>
                </a>
              </li>
              <li>
                <a href="listmembers">
                  <span class="sub-item">List Members</span>
                </a>
              </li> 
            </ul>
          </div>
        </li>

        <!-- Events Section -->
        <li class="nav-item">
          <a data-bs-toggle="collapse" href="#events">
            <i class="fas fa-calendar-alt"></i>
            <p>Events Management</p>
            <span class="caret"></span>
          </a>
          <div class="collapse" id="events">
            <ul class="nav nav-collapse">
              <li>
                <a href="businessevents">
                  <span class="sub-item">All Events</span>
                </a>
              </li>
              
              
              
              <!-- <li>
                <a href="trendingevent">
                  <span class="sub-item">Trending Events</span>
                </a>
              </li> -->
              
              <li>
                <a href="eventshows">
                  <span class="sub-item">UpComing Events List</span>
                </a>
              </li>
              
               <li>
                <a href="eventtype">
                  <span class="sub-item">Add Events</span>
                </a>
              </li>
              
              
              
              <!-- <li>
                <a href="listbuyers">
                  <span class="sub-item">Event Participant Users</span>
                </a>
              </li> -->
                
            </ul>
          </div>
        </li>
        
        <li class="nav-item">
  <a data-bs-toggle="collapse" href="#locations">
    <i class="fas fa-map-marker-alt"></i>
    <p>Manage Locations</p>
    <span class="caret"></span>
  </a>
  <div class="collapse" id="locations">
    <ul class="nav nav-collapse">
      
      <li>
        <a href="newsta">
          <span class="sub-item">State Manage</span>
        </a>
      </li>
      <li>
        <a href="viewcities">
          <span class="sub-item">City Manage</span>
        </a>
      </li>
    </ul>
  </div>
</li>

        <!-- Simple Links Section -->
        <li class="nav-section">
          <span class="sidebar-mini-icon">
            <i class="fa fa-ellipsis-h"></i>
          </span>
          <h4 class="text-section">ACTIONS</h4>
        </li>

        <!-- Rating Users Link -->
        <li class="nav-item">
          <a href="listrateduser">
            <i class="fas fa-star"></i>
            <p>Rating Users</p>
          </a>
        </li>
        
        <li class="nav-item">
           <a href="commentspage">
            <i class="fas fa-comments"></i>
            <p>Comments Users</p>
           </a>
        </li>

        <!-- Home Link -->
        <li class="nav-item">
          <a href="home">
            <i class="fas fa-home"></i>
            <p>Home</p>
          </a>
        </li>

        <!-- Contact Us Link -->
        <!-- <li class="nav-item">
          <a href="contactus">
            <i class="fas fa-envelope"></i>
            <p>Contact Us</p>
          </a>
        </li> -->

        <!-- Log Out Link -->
        <li class="nav-item">
          <a href="logout">
            <i class="fas fa-sign-out-alt"></i>
            <p>Log Out</p>
          </a>
        </li>
      </ul>
    </div>
  </div>
</div>
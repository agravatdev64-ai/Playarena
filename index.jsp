<%
/* ===== ADMIN SESSION ===== */
String admin = (String) session.getAttribute("admin");%>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>PlayArena | Admin Panel</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="style.css"/>
</style>
</head>

<body>

<!-- ===== ADMIN NAVBAR ===== -->
<nav class="navbar navbar-expand-lg fixed-top">
  <div class="container">
    <span class="navbar-brand">PlayArena Admin</span>

    <button class="navbar-toggler" type="button"
            data-bs-toggle="collapse" data-bs-target="#adminMenu">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="adminMenu">
            <ul class="navbar-nav ms-auto">

                <li class="nav-item">
                    <a class="nav-link  active" href="index.jsp">Home</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="menage_sports.jsp">Manage Sports</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="booking.jsp">Booking</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="contact.jsp">Contact Us</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="feedback.jsp">Feedback</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="users.jsp">Users</a>
                </li>

                <% if(admin != null){ %>

        <li class="nav-item">
            <a class="nav-link text-danger fw-semibold" href="logout.jsp">
                Logout
            </a>
        </li>
    <% } else { %>
        <!-- BEFORE LOGIN / AFTER LOGOUT -->
        <li class="nav-item">
            <a class="nav-link fw-semibold" href="login.jsp">
                Login
            </a>
        </li>
    <% } %>

            </ul>
        </div>
  </div>
</nav>

<!-- ===== ADMIN MAIN CONTENT ===== -->
<div class="container">
  <div class="admin-content">

    <h2>Welcome to PlayArena Admin Panel</h2>

    <p>
      The PlayArena Admin Panel serves as the central control system for managing
      all operations related to sports booking, user interaction, and platform
      maintenance. This panel is designed to provide administrators with a clean
      and organized workspace to ensure smooth platform performance.
    </p>

    <h5>Platform Management</h5>
    <p>
      Administrators are responsible for maintaining accurate sports information,
      including sport names, descriptions, images, and pricing. Keeping this data
      up to date ensures transparency and avoids booking conflicts.
    </p>

    <p>
      Proper management of sports listings directly impacts the user experience
      and overall reliability of the booking system.
    </p>

    <h5>Bookings & User Activity</h5>
    <p>
      Monitoring booking activity helps identify scheduling issues and ensures
      that facilities are being used efficiently. Any inconsistencies should be
      reviewed and resolved promptly.
    </p>

    <p>
      User communication through contact messages and feedback provides valuable
      insight into platform performance and customer satisfaction.
    </p>

    <h5>Security & Responsibility</h5>
    <p>
      Admin access carries responsibility. All changes made within this panel
      directly affect platform data and user trust. Ensure that updates are
      reviewed carefully before being applied.
    </p>

    <p>
      Responsible administration helps maintain system stability, data accuracy,
      and long-term success of the PlayArena platform.
    </p>

  </div>
</div>

<!-- ===== ADMIN FOOTER ===== -->
<footer class="admin-footer text-center">
  <div class="container">
    <p class="mb-0">© 2026 PlayArena Admin Panel. All rights reserved.</p>
  </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

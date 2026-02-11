<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String user = (String) session.getAttribute("username");

    if (user == null) {
        response.sendRedirect("../visiter/index.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>PlayArena | Contact Us</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../visiter/style.css"/>
</head>

<body>

<!-- ===== NAVBAR ===== -->
<nav class="navbar navbar-expand-lg fixed-top">
  <div class="container">
    <a class="navbar-brand" href="index.jsp">PlayArena</a>

    <button class="navbar-toggler" type="button"
            data-bs-toggle="collapse" data-bs-target="#menu">
      <span class="navbar-toggler-icon"></span>
    </button>

   <div class="collapse navbar-collapse" id="menu">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="sports.jsp">Booking</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="services.jsp">Services</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="about.jsp">About Us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="contact.jsp">Contact Us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="feedback.jsp">Feedback</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="logout.jsp">Logout</a>
        </li>
      </ul>
  </div>
</nav>
<!-- ===== PAGE HEADER ===== -->
<section class="page-header">
  <div class="container">
    <h1>Contact PlayArena</h1>
    <p>Contact PlayArena for bookings, inquiries, or support related to games and events.
Our team is always ready to assist you and ensure a great experience.</p>
  </div>
</section>
<!-- ===== CONTACT FORM ===== -->
<div class="container" style="margin-top:130px;">
  <div class="row justify-content-center">
    <div class="col-md-6">

      <div class="contact-card">
        <form action="con.jsp" method="post">

          <div class="mb-3">
            <label>Your Name</label>
            <input type="text" name="nm" class="form-control" required>
          </div>

          <div class="mb-3">
            <label>Email Address</label>
            <input type="email" name="email" class="form-control" required>
          </div>

          <div class="mb-4">
            <label>Message</label>
            <textarea class="form-control" name="msg" rows="4" required></textarea>
          </div>

          <button type="submit" class="btn btn-send w-100 text-white">
            Send Message
          </button>

        </form>
      </div>

    </div>
  </div>
</div>

<!-- ===== FOOTER ===== -->
<footer class="footer text-center">
  <div class="container">
    <p class="mb-0">© 2026 PlayArena. All rights reserved.</p>
  </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

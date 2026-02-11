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
<title>PlayArena | Online Sports Facility Booking</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="../visiter/style.css"/>
</head>

<body>

<!-- ===== NAVBAR ===== -->
<nav class="navbar navbar-expand-lg fixed-top">
<div class="container">
<a class="navbar-brand" href="index.jsp">PlayArena</a>
<button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#menu">
<span class="navbar-toggler-icon"></span>
</button>
<div class="collapse navbar-collapse" id="menu">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link active" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="sports.jsp">Booking</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="services.jsp">Services</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="about.jsp">About Us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="contact.jsp">Contact Us</a>
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

<!-- ===== HERO ===== -->
<section class="hero" id="hero">
<div class="container">
<div class="hero-content">
<h1>Simple & Reliable Sports Facility Booking</h1>
<p>
PlayArena helps players, academies, and sports clubs easily manage and discover sports facilities.
Our platform focuses on transparency, availability accuracy, and a smooth user experience.
</p>
</div>
</div>
</section>

<!-- ===== FEATURES ===== -->
<section class="section">
<div class="container">
<div class="section-title">
<h2>What Makes PlayArena Different</h2>
<p>Designed for real sports facilities and real players</p>
</div>

<div class="row g-4">
<div class="col-md-4">
<div class="feature">
<i class="bi bi-calendar-check"></i>
<h5>Accurate Availability</h5>
<p>Real-time slot visibility avoids booking conflicts.</p>
</div>
</div>

<div class="col-md-4">
<div class="feature">
<i class="bi bi-shield-lock"></i>
<h5>Secure Platform</h5>
<p>Industry-grade security keeps your data protected.</p>
</div>
</div>

<div class="col-md-4">
<div class="feature">
<i class="bi bi-ui-checks"></i>
<h5>Easy to Use</h5>
<p>Simple and clean interface for all users.</p>
</div>
</div>
</div>
</div>
</section>

<!-- ===== FOOTER ===== -->
<footer class="text-center">
<p class="mb-0">© 2026 PlayArena. All rights reserved.</p>
</footer>

<!-- ===== AUTO BACKGROUND CHANGE (FIXED) ===== -->
<script>
const hero = document.getElementById("hero");

const images = [
  "<%=request.getContextPath()%>/img2/i1.jpg",
  "<%=request.getContextPath()%>/img2/i2.jpg"
];

// preload images
images.forEach(src => {
  const img = new Image();
  img.src = src;
});

let index = 0;

setInterval(() => {
  index = (index + 1) % images.length;
  hero.style.backgroundImage =
    "linear-gradient(rgba(0,0,0,0.75), rgba(0,0,0,0.75)), url('" + images[index] + "')";
}, 3500);
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

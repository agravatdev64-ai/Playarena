<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>PlayArena | Services</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<link rel="stylesheet" href="style.css"/>
</head>

<body>

<!-- ===== NAVBAR (SERVICES ACTIVE) ===== -->
<nav class="navbar navbar-expand-lg fixed-top">
  <div class="container">
    <a class="navbar-brand" href="index.jsp">PlayArena</a>
    <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#menu">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="menu">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="services.jsp">Services</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="about.jsp">About Us</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="login.jsp">Login</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- ===== PAGE HEADER ===== -->
<section class="page-header">
  <div class="container">
    <h1>Available Sports</h1>
    <p class="mt-3">
      Explore and book indoor and outdoor sports facilities
      available on the PlayArena platform.
    </p>
  </div>
</section>

<!-- ===== SERVICES ===== -->
<section class="section">
  <div class="container">
    <div class="row g-4">

      <div class="col-md-4">
        <div class="service-card">
          <img src="../img2/img1.jpeg" alt="Box Cricket">
          <h5>Box Cricket</h5>
          <p>Fully enclosed box cricket grounds for matches and practice.</p>
        </div>
      </div>

      <div class="col-md-4">
        <div class="service-card">
          <img src="../img2/img2.jpeg" alt="Table Tennis">
          <h5>Table Tennis</h5>
          <p>Professional tables with smooth surface and lighting.</p>
        </div>
      </div>

      <div class="col-md-4">
        <div class="service-card">
          <img src="../img2/img3.jpg" alt="Pool">
          <h5>Pool</h5>
          <p>Well-maintained pool tables for casual and competitive play.</p>
        </div>
      </div>

      <div class="col-md-4">
        <div class="service-card">
          <img src="../img2/img4.jpeg" alt="Pickle Ball">
          <h5>Pickle Ball</h5>
          <p>Modern pickleball courts for recreational and league play.</p>
        </div>
      </div>

      <div class="col-md-4">
        <div class="service-card">
          <img src="../img2/img5.jpg" alt="Carom">
          <h5>Carom</h5>
          <p>Indoor carom boards with professional playing surface.</p>
        </div>
      </div>

      <div class="col-md-4">
        <div class="service-card">
          <img src="../img2/img6.jpg" alt="Volleyball">
          <h5>Volleyball</h5>
          <p>Standard courts suitable for training and tournaments.</p>
        </div>
      </div>

    </div>
  </div>
</section>

<!-- ===== FOOTER ===== -->
<footer class="footer text-center">
  <div class="container">
    <p class="mb-0">© 2026 PlayArena. All rights reserved.</p>
  </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

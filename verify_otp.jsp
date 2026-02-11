<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>PlayArena | Forgot Password</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="style.css"/>
</head>

<body>

<!-- ===== NAVBAR (LOGIN ACTIVE) ===== -->
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
          <a class="nav-link" href="services.jsp">Services</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="about.jsp">About Us</a>
        </li>
        <!-- Forgot password comes under Login -->
        <li class="nav-item">
          <a class="nav-link active fw-semibold" href="login.jsp">Login</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- ===== FORGOT PASSWORD FORM ===== -->
<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-5 col-lg-4">

      <div class="forgot-card">
        <h3 class="text-center mb-3">OTP Send</h3>
        <form action="very.jsp" method="post">
          <div class="mb-3">
            <input type="hidden" name="email" value="<%= request.getParameter("email") %>">
            <label class="form-label">Enter OTP</label>
            <input type="number" name="otp"  class="form-control" required>
          </div>

          <button type="submit" class="btn btn-forgot w-100 text-white">
            Send otp
          </button>
        </form>

        <div class="text-center mt-4">
          <a href="login.jsp" class="auth-link">Back to Login</a>
        </div>

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


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>PlayArena | Register</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<link rel="stylesheet" href="style.css"/>
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
        <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="services.jsp">Services</a></li>
        <li class="nav-item"><a class="nav-link" href="about.jsp">About Us</a></li>
        <li class="nav-item">
          <a class="nav-link active fw-semibold" href="login.jsp">Login</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- ===== REGISTER FORM ===== -->
<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-6 col-lg-5">

      <div class="register-card">

        <!-- ===== MESSAGE BOX (ONLY ADDITION) ===== -->
        <%
            String msg = request.getParameter("msg");
            if(msg != null){
        %>
        <div class="alert alert-info text-center alert-dismissible fade show">
            <%= msg %>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
        <% } %>

        <h3 class="auth-title text-center mb-4">Create Account</h3>

        <form action="j4.jsp" method="post">

          <div class="mb-3">
            <label class="form-label">Full Name</label>
            <input type="text" name="name" class="form-control" required>
          </div>

          <div class="mb-3">
            <label class="form-label">Email Address</label>
            <input type="email" name="email" class="form-control" required>
          </div>

          <!-- PASSWORD -->
          <div class="mb-3 position-relative">
            <label class="form-label">Password</label>
            <input type="password" name="password" id="password" class="form-control pe-5" required>
            <span class="password-toggle" onclick="togglePassword()">👁</span>
          </div>

          <!-- CONFIRM PASSWORD -->
          <div class="mb-3 position-relative">
            <label class="form-label">Confirm Password</label>
            <input type="password" name="confirm_password" id="confirmPassword" class="form-control pe-5" required>
            <span class="password-toggle" onclick="toggleConfirmPassword()">👁</span>
          </div>

          <button type="submit" class="btn btn-register w-100 text-white">
            Register
          </button>
        </form>

        <div class="text-center mt-4">
          <p class="mb-0">
            Already have an account?
            <a href="login.jsp" class="auth-link">Login</a>
          </p>
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

<!-- ===== JS FOR SHOW / HIDE PASSWORD ===== -->
<script>
function togglePassword(){
    const pass = document.getElementById("password");
    pass.type = pass.type === "password" ? "text" : "password";
}
function toggleConfirmPassword(){
    const pass = document.getElementById("confirmPassword");
    pass.type = pass.type === "password" ? "text" : "password";
}
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

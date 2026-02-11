<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Set Password</title>
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

<!-- ===== SET PASSWORD FORM ===== -->
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

        <h3 class="auth-title text-center mb-4">Set Password</h3>

        <form action="reset.jsp" method="post">

          <div class="mb-3 position-relative">
            <label class="form-label">Enter New Password</label>
            <input type="password" id="newpass" name="newpass" class="form-control pe-5">
            <span class="password-toggle" onclick="togglePassword()">👁</span>
          </div>

          <button type="submit" class="btn btn-register w-100 text-white">
            Update Password
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

<!-- ===== SHOW / HIDE PASSWORD SCRIPT ===== -->
<script>
function togglePassword(){
    const pass = document.getElementById("newpass");
    pass.type = pass.type === "password" ? "text" : "password";
}
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

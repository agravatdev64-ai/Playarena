<%@ page contentType="text/html;charset=UTF-8" %>

<%
String ADMIN_USERNAME = "admin";
String ADMIN_PASSWORD = "admin123";

String msg = "";

if ("POST".equalsIgnoreCase(request.getMethod())) {
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (ADMIN_USERNAME.equals(username) && ADMIN_PASSWORD.equals(password)) {
        session.setAttribute("admin", username);
        response.sendRedirect("index.jsp");
        return;
    } else {
        msg = "Invalid Admin Username or Password";
    }
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Login | PlayArena</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<link rel="stylesheet" href="style.css"/>
</head>

<body>

<!-- ================= NAVBAR ================= -->
<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container">

        <a class="navbar-brand" href="index.jsp">PlayArena Admin</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#adminMenu">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="adminMenu">
            <ul class="navbar-nav ms-auto">

                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
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

                <li class="nav-item">
                    <a class="nav-link active" href="login.jsp">Login</a>
                </li>

            </ul>
        </div>
    </div>
</nav>

<!-- ===== LOGIN CONTENT ===== -->
<div class="login-wrapper">
    <div class="login-card">

        <h2 class="text-center mb-4">Admin Login</h2>

        <% if(!msg.isEmpty()) { %>
            <div class="alert alert-danger text-center">
                <%= msg %>
            </div>
        <% } %>

        <form method="post">

            <div class="mb-3">
                <label class="form-label fw-semibold">Username</label>
                <input type="text" name="username" class="form-control" required>
            </div>

            <!-- PASSWORD WITH EYE -->
            <div class="mb-4">
                <label class="form-label fw-semibold">Password</label>

                <div class="input-group">
                    <input type="password" name="password" id="password" class="form-control" required>
                    <span class="input-group-text" style="cursor:pointer;" onclick="togglePassword()">
                        <i class="bi bi-eye" id="eyeIcon"></i>
                    </span>
                </div>
            </div>

            <button type="submit" class="btn btn-login w-100">
                Login
            </button>
        </form>
    </div>
</div>

<!-- ================= FOOTER ================= -->
<footer class="admin-footer text-center">
    <div class="container">
        <p class="mb-0">© 2026 PlayArena Admin Panel. All rights reserved.</p>
    </div>
</footer>

<!-- SHOW / HIDE PASSWORD SCRIPT -->
<script>
function togglePassword() {
    const password = document.getElementById("password");
    const eyeIcon = document.getElementById("eyeIcon");

    if (password.type === "password") {
        password.type = "text";
        eyeIcon.classList.remove("bi-eye");
        eyeIcon.classList.add("bi-eye-slash");
    } else {
        password.type = "password";
        eyeIcon.classList.remove("bi-eye-slash");
        eyeIcon.classList.add("bi-eye");
    }
}
</script>

</body>
</html>

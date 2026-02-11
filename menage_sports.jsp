<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String admin = (String) session.getAttribute("admin");
if(admin == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>PlayArena | Manage Sports</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
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
                    <a class="nav-link active" href="menage_sports.jsp">Manage Sports</a>
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
                    <a class="nav-link text-warning fw-semibold" href="logout.jsp">Logout</a>
                </li>

            </ul>
        </div>
    </div>
</nav>

<!-- ================= CONTENT ================= -->
<div class="container">
<div class="admin-content">

    <div class="d-flex justify-content-between mb-3">
        <h2>Manage Sports</h2>
        <a href="add.jsp" class="btn btn-insert">+ Insert Sport</a>
    </div>

    <div class="table-responsive">
    <table class="table table-bordered table-hover text-center">

        <thead>
        <tr>
            <th>ID</th>
            <th>Sport Name</th>
            <th>Price / Hour</th>
            <th>Description</th>
            <th>Image</th>
            <th>Actions</th>
        </tr>
        </thead>

        <tbody>
        <%
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/db","root",""
            );
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM sports");

            while(rs.next()){
        %>
        <tr>
            <td><%=rs.getInt("id")%></td>
            <td><%=rs.getString("name")%></td>
            <td><%=rs.getString("price")%></td>
            <td><%=rs.getString("description")%></td>
            <td>
                <img src="../<%=rs.getString("img")%>">
            </td>
            <td>
                <a href="../crud/updatall.jsp?type=sport&id=<%=rs.getInt("id")%>"class="btn btn-primary btn-sm">Update</a>
                <a href="../crud/deleteall.jsp?type=sport&id=<%=rs.getInt("id")%>"class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete?')">Delete</a>
            </td>
        </tr>
        <%
            }
            con.close();
        }catch(Exception e){
            out.println(e);
        }
        %>
        </tbody>

    </table>
    </div>

</div>
</div>

<!-- ================= FOOTER ================= -->
<footer class="admin-footer text-center">
    <div class="container">
        <p class="mb-0">© 2026 PlayArena Admin Panel. All rights reserved.</p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

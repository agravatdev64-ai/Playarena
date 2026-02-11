<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%
/* ===== SESSION CHECK ===== */
String user = (String) session.getAttribute("username");
if(user == null){
    response.sendRedirect("../visiter/index.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>PlayArena | Booking</title>
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

    <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#menu">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="menu">
        <ul class="navbar-nav ms-auto">
            <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
            <li class="nav-item"><a class="nav-link active" href="sports.jsp">Booking</a></li>
            <li class="nav-item"><a class="nav-link" href="services.jsp">Services</a></li>
            <li class="nav-item"><a class="nav-link" href="about.jsp">About Us</a></li>
            <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact Us</a></li>
            <li class="nav-item"><a class="nav-link" href="feedback.jsp">Feedback</a></li>
            <li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
        </ul>
    </div>
</div>
</nav>

<!-- ===== HEADER ===== -->
<section class="page-header">
<div class="container">
    <h1>Book Your Sport</h1>
    <p>Select a sport below to proceed with booking</p>
</div>
</section>

<!-- ===== SPORTS LIST ===== -->
<div class="container my-5">
<div class="row g-4">

<%
Connection con = null;
Statement st = null;
ResultSet rs = null;

try{
    Class.forName("com.mysql.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/db?useUnicode=true&characterEncoding=UTF-8",
        "root",
        ""
    );

    st = con.createStatement();
    rs = st.executeQuery("SELECT * FROM sports");

    while(rs.next()){
%>

<div class="col-md-4">
    <div class="booking-card">
        <img src="<%=request.getContextPath()%>/<%=rs.getString("img")%>" alt="Sport Image">

        <div class="p-3 text-center">
            <h5><%=rs.getString("name")%></h5>

            <!-- ✅ RUPEE SYMBOL FIXED -->
            <p class="price"> <%=rs.getString("price")%> / hour</p>

            <p><%=rs.getString("description")%></p>

            <a href="booking.jsp?id=<%=rs.getInt("id")%>" class="btn btn-book mt-2">
                Book Now
            </a>
        </div>
    </div>
</div>

<%
    }
}catch(Exception e){
    out.println("<p class='text-danger'>Error: "+e.getMessage()+"</p>");
}finally{
    if(rs!=null) rs.close();
    if(st!=null) st.close();
    if(con!=null) con.close();
}
%>

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

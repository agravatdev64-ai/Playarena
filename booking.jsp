<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String user = (String) session.getAttribute("username");
    if (user == null) {
        response.sendRedirect("../visiter/index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>PlayArena | Booking Form</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../visiter/style.css"/>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg fixed-top">
<div class="container">
<a class="navbar-brand" href="index.jsp">PlayArena</a>

<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#menu">
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

<!-- FORM -->
<div class="container" style="margin-top:130px;">
<div class="row justify-content-center">
<div class="col-md-6">

<div class="form-card">
<h4 class="text-center mb-4">Booking Form</h4>

<form method="post" action="sendOtp.jsp">

<!-- NAME -->
<div class="mb-3">
<label>Full Name</label>
<input type="text" name="bnm" class="form-control" required>
</div>

<!-- DATE -->
<div class="mb-3">
<label>Select Date</label>
<input type="date" name="date" class="form-control" required>
</div>

<!-- TIME -->
<div class="row">
<div class="col-md-6 mb-3">
<label>Start Time</label>
<input type="time" name="st" id="st" class="form-control" onchange="calculateHours()" required>
</div>

<div class="col-md-6 mb-3">
<label>End Time</label>
<input type="time" name="et" id="et" class="form-control" onchange="calculateHours()" required>
</div>
</div>

<!-- HOURS -->
<div class="mb-3">
<label>Total Hours</label>
<input type="text" name="hu" id="hu" class="form-control" readonly>
</div>

<!-- SPORT -->
<div class="mb-3">
<label>Select Sport</label>
<select name="snm" id="sm" class="form-select" onchange="setPrice()" required>
<option value="">-- Select Sport --</option>

<%
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/db","root",""
    );
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT name, price FROM sports");

    while(rs.next()){
%>
<option value="<%= rs.getString("name") %>"
        data-price="<%= rs.getString("price") %>">
    <%= rs.getString("name") %>
</option>
<%
    }
    con.close();
}catch(Exception e){
%>
<option>Error loading sports</option>
<%
}
%>
</select>
</div>

<!-- PRICE -->
<div class="mb-4">
<label>Price Per Hour</label>
<input type="text" name="price" id="price" class="form-control" readonly>
</div>

<button type="submit" class="btn btn-book w-100 text-white">
Book Now
</button>

</form>
</div>

</div>
</div>
</div>

<!-- FOOTER -->
<footer class="footer text-center">
<div class="container">
    <p class="mb-0">© 2026 PlayArena. All rights reserved.</p>
</div>
</footer>

<script>
function calculateHours(){
    let s = document.getElementById("st").value;
    let e = document.getElementById("et").value;

    if(s && e){
        let start = new Date("1970-01-01T" + s);
        let end = new Date("1970-01-01T" + e);
        let diff = (end - start) / (1000 * 60 * 60);
        document.getElementById("hu").value = diff > 0 ? diff : "";
    }
}

function setPrice(){
    let sport = document.getElementById("sm");
    let price = sport.options[sport.selectedIndex].getAttribute("data-price");
    document.getElementById("price").value = price ? price : "";
}
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

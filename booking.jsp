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
<title>PlayArena | Booking Data</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="style.css"/>
</head>

<body>

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
                    <a class="nav-link  active" href="booking.jsp">Booking</a>
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
                    <a class="nav-link" href="logout.jsp">Logout</a>
                </li>

            </ul>
        </div>
    </div>
</nav>

<!-- CONTENT -->
<div class="container">
<div class="admin-content">

<h2 class="mb-4">Booking Data</h2>

<div class="table-responsive">
<table class="table table-bordered table-hover text-center">

<thead>
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Date</th>
    <th>Start</th>
    <th>End</th>
    <th>Hour</th>
    <th>Sport Name</th>
    <th>Price</th>
    <th>OTP</th>
    <th>Action(Uodate/Delete)</th>
    <th>Action(Bill)</th>
    <th>Total Bill</th>
</tr>
</thead>

<tbody>
<%
Connection con = null;
Statement st = null;
ResultSet rs = null;

try{
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/db","root",""
    );

    st = con.createStatement();
    rs = st.executeQuery("SELECT * FROM f1");

    while(rs.next()){
        int id = rs.getInt("id");
        int hours = rs.getInt("hu");

        /* ===== SAFE PRICE CONVERSION (FIX) ===== */
        String priceStr = rs.getString("price");   // ₹1500
        priceStr = priceStr.replaceAll("[^0-9]", "");
        int price = Integer.parseInt(priceStr);
%>
<tr>
    <td><%=rs.getInt("id")%></td>
    <td><%=rs.getString("bnm")%></td>
    <td><%=rs.getString("date")%></td>
    <td><%=rs.getString("st")%></td>
    <td><%=rs.getString("et")%></td>
    <td><%=rs.getString("hu")%></td>
    <td><%=rs.getString("snm")%></td>
    <td><%=rs.getString("price")%></td>
    <td><%=rs.getString("otp")%></td>
     <!-- ACTION -->

     <td>
    <!-- UPDATE = BLUE -->
    <a href="../crud/updatall.jsp?type=booking&id=<%=rs.getInt("id")%>"class="btn btn-primary btn-sm">Update</a>
    <a href="../crud/deleteall.jsp?type=booking&id=<%=rs.getInt("id")%>"class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete?')">Delete</a>
            </td>
    <td>
        <button class="btn btn-success btn-sm"
            onclick="generateBill(<%=price%>, <%=hours%>, 'total<%=id%>')">
            Generate Bill
        </button>
    </td>

    <td id="total<%=id%>" class="total-cell">-</td>
</tr>
<%
   }
}catch(Exception e){
    out.println("<tr><td colspan='10' class='text-danger'>"+e+"</td></tr>");
}finally{
    if(rs!=null) rs.close();
    if(st!=null) st.close();
    if(con!=null) con.close();
}
%>
</tbody>

</table>
</div>

</div>
</div>
<!-- ===== JS ===== -->
<script>
function generateBill(price, hours, cellId){
    let total = price * hours;
    document.getElementById(cellId).innerHTML = "₹ " + total;
}
</script>
<!-- FOOTER -->
<footer class="text-center">
<p class="mb-0">© 2026 PlayArena Admin Panel. All rights reserved.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

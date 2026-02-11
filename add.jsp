<%@ page import="java.sql.*,java.io.*,java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*,org.apache.commons.fileupload.disk.*,org.apache.commons.fileupload.servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
String admin = (String) session.getAttribute("admin");
if(admin == null){
    response.sendRedirect("login.jsp");
    return;
}

String msg = "";
String msgType = "";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>PlayArena | Add Sport</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="style.css"/>
</head>

<body>

<!-- NAVBAR -->
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
                    <a class="nav-link" href="logout.jsp">Logout</a>
                </li>

            </ul>
        </div>
    </div>
</nav>
<!-- CONTENT -->
<div class="container">
<div class="admin-content">

<h2 class="mb-4">Add New Sport</h2>

<!-- MESSAGE -->
<% if(!msg.equals("")){ %>
<div class="alert alert-<%=msgType%> alert-dismissible fade show">
    <%=msg%>
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
</div>
<% } %>

<form method="post" enctype="multipart/form-data">

    <div class="mb-3">
        <label class="form-label fw-semibold">Sport Name</label>
        <input type="text" name="name" class="form-control" required>
    </div>

    <div class="mb-3">
        <label class="form-label fw-semibold">Price / Hour</label>
        <input type="text" name="price" class="form-control" required>
    </div>

    <div class="mb-3">
        <label class="form-label fw-semibold">Description</label>
        <textarea name="description" class="form-control" rows="4"></textarea>
    </div>

    <div class="mb-4">
        <label class="form-label fw-semibold">Sport Image</label>
        <input type="file" name="image" class="form-control" required>
    </div>

    <button type="submit" class="btn btn-primary btn-sm w-100">
        Insert Sport
    </button>

</form>

<%
/* ================= INSERT WITH DUPLICATE CHECK ================= */
if(ServletFileUpload.isMultipartContent(request)){

    String name="", price="", description="", imgPath="";

    DiskFileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);

    try{
        List<FileItem> items = upload.parseRequest(request);

        for(FileItem item : items){
            if(item.isFormField()){
                if(item.getFieldName().equals("name"))
                    name = item.getString("UTF-8").trim();
                if(item.getFieldName().equals("price"))
                    price = item.getString("UTF-8");
                if(item.getFieldName().equals("description"))
                    description = item.getString("UTF-8");
            }else{
                if(item.getSize() > 0){
                    String fileName = System.currentTimeMillis()+"_"+item.getName();
                    String uploadPath = application.getRealPath("/")+"img";
                    File dir = new File(uploadPath);
                    if(!dir.exists()) dir.mkdirs();

                    item.write(new File(uploadPath + "/" + fileName));
                    imgPath = "img/" + fileName;
                }
            }
        }

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/db","root",""
        );

        // 🔴 CHECK SPORT ALREADY EXISTS
        PreparedStatement check = con.prepareStatement(
            "SELECT COUNT(*) FROM sports WHERE name=?"
        );
        check.setString(1, name);
        ResultSet rs = check.executeQuery();
        rs.next();

        if(rs.getInt(1) > 0){
            out.println("<script>alert('Sports Alredy Asis'); window.location='menage_sports.jsp';</script>");
            msgType = "danger";
        }else{
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO sports(name,price,description,img) VALUES(?,?,?,?)"
            );
            ps.setString(1,name);
            ps.setString(2,price);
            ps.setString(3,description);
            ps.setString(4,imgPath);
            ps.executeUpdate();

            msg = "Sport added successfully!";
            msgType = "success";
        }

        con.close();

    }catch(Exception e){
        msg = e.getMessage();
        msgType = "danger";
    }
}
%>

</div>
</div>

<!-- FOOTER -->
<footer class="admin-footer text-center">
<div class="container">
    <p class="mb-0">© 2026 PlayArena Admin Panel. All rights reserved.</p>
</div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<%@ page import="java.sql.*,java.io.*,java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*,org.apache.commons.fileupload.disk.*,org.apache.commons.fileupload.servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
/* ================= SESSION CHECK ================= */
String admin = (String) session.getAttribute("admin");
if(admin == null){
    response.sendRedirect("login.jsp");
    return;
}

/* ================= PARAMS ================= */
String type = request.getParameter("type");
int id = Integer.parseInt(request.getParameter("id"));

/* ================= DB ================= */
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/db","root",""
);
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>PlayArena | Update</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../admin/style.css">
</head>

<body>

<nav class="navbar navbar-expand-lg fixed-top">
<div class="container">
    <a class="navbar-brand" href="../admin/index.jsp">PlayArena Admin</a>
</div>
</nav>

<div class="container mt-5 pt-4">
<div class="admin-card">

<%
/* =====================================================
   =================== BOOKING UPDATE ==================
   ===================================================== */
if("booking".equals(type)){

String bnm="",date="",st="",et="",hu="",snm="",price="",otp="";

if("POST".equalsIgnoreCase(request.getMethod())){
PreparedStatement ps = con.prepareStatement(
"UPDATE f1 SET bnm=?,date=?,st=?,et=?,hu=?,snm=?,price=?,otp=? WHERE id=?");
ps.setString(1,request.getParameter("bnm"));
ps.setString(2,request.getParameter("date"));
ps.setString(3,request.getParameter("st"));
ps.setString(4,request.getParameter("et"));
ps.setString(5,request.getParameter("hu"));
ps.setString(6,request.getParameter("snm"));
ps.setString(7,request.getParameter("price"));
ps.setString(8,request.getParameter("otp"));
ps.setInt(9,id);
ps.executeUpdate();
response.sendRedirect("../admin/booking.jsp");
return;
}

PreparedStatement ps = con.prepareStatement("SELECT * FROM f1 WHERE id=?");
ps.setInt(1,id);
ResultSet rs = ps.executeQuery();
if(rs.next()){
bnm=rs.getString("bnm");
date=rs.getString("date");
st=rs.getString("st");
et=rs.getString("et");
hu=rs.getString("hu");
snm=rs.getString("snm");
price=rs.getString("price");
otp=rs.getString("otp");
}
%>
<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container">
        <a class="navbar-brand" href="../admin/index.jsp">PlayArena Admin</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#adminMenu">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="adminMenu">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="../admin/index.jsp">Home</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link " href="../admin/menage_sports.jsp">Manage Sports</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link active" href="../admin/booking.jsp">Booking</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="../admin/contact.jsp">Contact Us</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="../admin/feedback.jsp">Feedback</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="../admin/users.jsp">Users</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link text-warning fw-semibold" href="../admin/logout.jsp">Logout</a>
                </li>

            </ul>
        </div>
    </div>
</nav>

<h3 class="mb-4">Update Booking</h3>

<form method="post">
<input type="hidden" name="price" id="price" value="<%=price%>">

<div class="mb-3">
<label class="form-label">Customer Full Name</label>
<input type="text" class="form-control" name="bnm" value="<%=bnm%>" required>
</div>

<div class="mb-3">
<label class="form-label">Booking Date</label>
<input type="date" class="form-control" name="date" value="<%=date%>" required>
</div>

<div class="row mb-3">
<div class="col-md-6">
<label class="form-label">Start Time</label>
<input type="time" class="form-control" id="st" name="st" value="<%=st%>" onchange="calc()" required>
</div>

<div class="col-md-6">
<label class="form-label">End Time</label>
<input type="time" class="form-control" id="et" name="et" value="<%=et%>" onchange="calc()" required>
</div>
</div>

<div class="mb-3">
<label class="form-label">Total Hours</label>
<input type="text" class="form-control" id="hu" name="hu" value="<%=hu%>" readonly>
</div>

<div class="mb-3">
<label class="form-label">OTP</label>
<input type="text" class="form-control" id="hu" name="otp" value="<%=otp%>" readonly>
</div>

<div class="mb-3">
<label class="form-label">Sport / Facility</label>
<select class="form-select" id="snm" name="snm" onchange="setPrice()" required>
<option value="">-- Select Sport --</option>
<%
Statement s=con.createStatement();
ResultSet r=s.executeQuery("SELECT name,price FROM sports");
while(r.next()){
%>
<option value="<%=r.getString(1)%>" data-price="<%=r.getString(2)%>"
<%=r.getString(1).equals(snm)?"selected":""%>>
<%=r.getString(1)%>
</option>
<% } %>
</select>
</div>

<div class="mb-4">
<label class="form-label">Price Per Hour (₹)</label>
<input type="text" class="form-control" id="ph" readonly>
</div>
<button class="btn btn-primary btn-sm w-100">Update Booking</button>
</form>

<script>
function calc(){
let s=document.getElementById("st").value;
let e=document.getElementById("et").value;
if(s&&e){
document.getElementById("hu").value=
(new Date("1970-01-01T"+e)-new Date("1970-01-01T"+s))/3600000;
}
}
function setPrice(){
let sel=document.getElementById("snm");
let p=sel.options[sel.selectedIndex].getAttribute("data-price");
document.getElementById("ph").value=p;
document.getElementById("price").value=p;
}
window.onload=setPrice;
</script>

<%
}
/* =====================================================
   =================== CONTACT UPDATE ==================
   ===================================================== */
else if("contact".equals(type)){

String nm="",email="",msg="";

if("POST".equalsIgnoreCase(request.getMethod())){
PreparedStatement ps=con.prepareStatement(
"UPDATE con SET nm=?,email=?,msg=? WHERE id=?");
ps.setString(1,request.getParameter("nm"));
ps.setString(2,request.getParameter("email"));
ps.setString(3,request.getParameter("msg"));
ps.setInt(4,id);
ps.executeUpdate();
response.sendRedirect("../admin/contact.jsp");
return;
}

PreparedStatement ps=con.prepareStatement("SELECT * FROM con WHERE id=?");
ps.setInt(1,id);
ResultSet rs=ps.executeQuery();
if(rs.next()){
nm=rs.getString("nm");
email=rs.getString("email");
msg=rs.getString("msg");
}
%>
<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container">
        <a class="navbar-brand" href="../admin/index.jsp">PlayArena Admin</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#adminMenu">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="adminMenu">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="../admin/index.jsp">Home</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link " href="../admin/menage_sports.jsp">Manage Sports</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="../admin/booking.jsp">Booking</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link active" href="../admin/contact.jsp">Contact Us</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="../admin/feedback.jsp">Feedback</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="../admin/users.jsp">Users</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link text-warning fw-semibold" href="../admin/logout.jsp">Logout</a>
                </li>

            </ul>
        </div>
    </div>
</nav>
<h3 class="mb-4">Update Contact Message</h3>

<form method="post">
<div class="mb-3">
<label class="form-label">Full Name</label>
<input class="form-control" name="nm" value="<%=nm%>" required>
</div>

<div class="mb-3">
<label class="form-label">Email Address</label>
<input class="form-control" name="email" value="<%=email%>" required>
</div>

<div class="mb-4">
<label class="form-label">Message</label>
<textarea class="form-control" name="msg" rows="4" required><%=msg%></textarea>
</div>

<button class="btn btn-primary btn-sm w-100">Update Contact</button>
</form>

<%
}
/* =====================================================
   =================== FEEDBACK UPDATE =================
   ===================================================== */
else if("feedback".equals(type)){

String nm="",email="",ros="",com="";

if("POST".equalsIgnoreCase(request.getMethod())){
PreparedStatement ps=con.prepareStatement(
"UPDATE fd SET nm=?,email=?,ros=?,com=? WHERE id=?");
ps.setString(1,request.getParameter("nm"));
ps.setString(2,request.getParameter("email"));
ps.setString(3,request.getParameter("ros"));
ps.setString(4,request.getParameter("com"));
ps.setInt(5,id);
ps.executeUpdate();
response.sendRedirect("../admin/feedback.jsp");
return;
}

PreparedStatement ps=con.prepareStatement("SELECT * FROM fd WHERE id=?");
ps.setInt(1,id);
ResultSet rs=ps.executeQuery();
if(rs.next()){
nm=rs.getString("nm");
email=rs.getString("email");
ros=rs.getString("ros");
com=rs.getString("com");
}
%>
<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container">
        <a class="navbar-brand" href="../admin/index.jsp">PlayArena Admin</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#adminMenu">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="adminMenu">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="../admin/index.jsp">Home</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link " href="../admin/menage_sports.jsp">Manage Sports</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="../admin/booking.jsp">Booking</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="../admin/contact.jsp">Contact Us</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link active" href="../admin/feedback.jsp">Feedback</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="../admin/users.jsp">Users</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link text-warning fw-semibold" href="../admin/logout.jsp">Logout</a>
                </li>

            </ul>
        </div>
    </div>
</nav>
<h3 class="mb-4">Update Feedback</h3>

<form method="post">
<div class="mb-3">
<label class="form-label">Full Name</label>
<input class="form-control" name="nm" value="<%=nm%>" required>
</div>

<div class="mb-3">
<label class="form-label">Email Address</label>
<input class="form-control" name="email" value="<%=email%>" required>
</div>

<div class="mb-3">
<label class="form-label">Rating</label>
<select class="form-select" name="ros" required>
<option <%=ros.equals("Excellent")?"selected":""%>>Excellent</option>
<option <%=ros.equals("Good")?"selected":""%>>Good</option>
<option <%=ros.equals("Average")?"selected":""%>>Average</option>
<option <%=ros.equals("Poor")?"selected":""%>>Poor</option>
</select>
</div>

<div class="mb-4">
<label class="form-label">Feedback Comment</label>
<textarea class="form-control" name="com" rows="4" required><%=com%></textarea>
</div>

<button class="btn btn-primary btn-sm w-100">Update Feedback</button>
</form>

<%
}
/* =====================================================
   =================== SPORT UPDATE ====================
   ===================================================== */
else if("sport".equals(type)){

String name="",price="",description="",img="";

/* FETCH */
if(!ServletFileUpload.isMultipartContent(request)){
PreparedStatement ps=con.prepareStatement("SELECT * FROM sports WHERE id=?");
ps.setInt(1,id);
ResultSet rs=ps.executeQuery();
if(rs.next()){
name=rs.getString("name");
price=rs.getString("price");
description=rs.getString("description");
img=rs.getString("img");
}
}

/* UPDATE */
if(ServletFileUpload.isMultipartContent(request)){
DiskFileItemFactory f=new DiskFileItemFactory();
ServletFileUpload up=new ServletFileUpload(f);
String oldImg="",newImg="";
List<FileItem> items=up.parseRequest(request);

for(FileItem i:items){
if(i.isFormField()){
if(i.getFieldName().equals("name")) name=i.getString("UTF-8");
if(i.getFieldName().equals("price")) price=i.getString("UTF-8");
if(i.getFieldName().equals("description")) description=i.getString("UTF-8");
if(i.getFieldName().equals("oldImg")) oldImg=i.getString("UTF-8");
}
}
newImg=oldImg;

for(FileItem i:items){
if(!i.isFormField() && i.getSize()>0){
File old=new File(application.getRealPath("/") + oldImg);
if(old.exists()) old.delete();
String fn=System.currentTimeMillis()+"_"+i.getName();
String pth=application.getRealPath("/")+"img";
new File(pth).mkdirs();
i.write(new File(pth+"/"+fn));
newImg="img/"+fn;
}
}

PreparedStatement ps=con.prepareStatement(
"UPDATE sports SET name=?,price=?,description=?,img=? WHERE id=?");
ps.setString(1,name);
ps.setString(2,price);
ps.setString(3,description);
ps.setString(4,newImg);
ps.setInt(5,id);
ps.executeUpdate();
response.sendRedirect("../admin/menage_sports.jsp");
return;
}
%>
<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container">
        <a class="navbar-brand" href="../admin/index.jsp">PlayArena Admin</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#adminMenu">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="adminMenu">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="../admin/index.jsp">Home</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link active" href="../admin/menage_sports.jsp">Manage Sports</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="../admin/booking.jsp">Booking</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="../admin/contact.jsp">Contact Us</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="../admin/feedback.jsp">Feedback</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="../admin/users.jsp">Users</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link text-warning fw-semibold" href="../admin/logout.jsp">Logout</a>
                </li>

            </ul>
        </div>
    </div>
</nav>

<h3 class="mb-4">Update Sport</h3>

<form method="post" enctype="multipart/form-data">
<input type="hidden" name="oldImg" value="<%=img%>">

<div class="mb-3">
<label class="form-label">Sport Name</label>
<input class="form-control" name="name" value="<%=name%>" required>
</div>

<div class="mb-3">
<label class="form-label">Price Per Hour (₹)</label>
<input class="form-control" name="price" value="<%=price%>" required>
</div>

<div class="mb-3">
<label class="form-label">Sport Description</label>
<textarea class="form-control" name="description" rows="4"><%=description%></textarea>
</div>

<div class="mb-3">
<label class="form-label">Current Image</label><br>
<img src="../<%=img%>" width="140">
</div>

<div class="mb-4">
<label class="form-label">Change Image (Optional)</label>
<input type="file" name="image" class="form-control">
</div>

<button class="btn btn-primary btn-sm w-100">Update Sport</button>
</form>

<% } %>

</div>
</div>

<footer class="text-center mt-4">
<p class="mb-0">© 2026 PlayArena Admin Panel. All rights reserved.</p>
</footer>

</body>
</html>

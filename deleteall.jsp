<%@ page import="java.sql.*,java.io.*" %>
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
String sid  = request.getParameter("id");

if(type == null || sid == null){
    response.sendRedirect("index.jsp");
    return;
}

int id = Integer.parseInt(sid);

/* ================= DB ================= */
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/db","root",""
);

/* ================= DEFAULT REDIRECT ================= */
String redirectPage = "index.jsp";

/* ================= DELETE LOGIC ================= */

/* -------- BOOKING -------- */
if("booking".equals(type)){

    PreparedStatement ps = con.prepareStatement(
        "DELETE FROM f1 WHERE id=?"
    );
    ps.setInt(1, id);
    ps.executeUpdate();
    ps.close();

    redirectPage = "../admin/booking.jsp";
}

/* -------- CONTACT -------- */
else if("contact".equals(type)){

    PreparedStatement ps = con.prepareStatement(
        "DELETE FROM con WHERE id=?"
    );
    ps.setInt(1, id);
    ps.executeUpdate();
    ps.close();

    redirectPage = "../admin/contact.jsp";
}

/* -------- FEEDBACK -------- */
else if("feedback".equals(type)){

    PreparedStatement ps = con.prepareStatement(
        "DELETE FROM fd WHERE id=?"
    );
    ps.setInt(1, id);
    ps.executeUpdate();
    ps.close();

    redirectPage = "../admin/feedback.jsp";
}

/* -------- SPORTS (WITH IMAGE DELETE) -------- */
else if("sport".equals(type)){

    String img = "";

    PreparedStatement ps1 = con.prepareStatement(
        "SELECT img FROM sports WHERE id=?"
    );
    ps1.setInt(1, id);
    ResultSet rs = ps1.executeQuery();

    if(rs.next()){
        img = rs.getString("img");
    }
    rs.close();
    ps1.close();

    if(img != null && !img.equals("")){
        File f = new File(application.getRealPath("/") + img);
        if(f.exists()){
            f.delete();
        }
    }

    PreparedStatement ps2 = con.prepareStatement(
        "DELETE FROM sports WHERE id=?"
    );
    ps2.setInt(1, id);
    ps2.executeUpdate();
    ps2.close();

    redirectPage = "../admin/menage_sports.jsp";
}

/* ================= CLOSE DB ================= */
con.close();

/* ================= FINAL REDIRECT ================= */
response.sendRedirect(redirectPage);
%>

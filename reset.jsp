<%@ page import="java.sql.*" %>
<%
String email = (String) session.getAttribute("reset_email");
String newpass = request.getParameter("newpass");

if(email == null || newpass == null){
    out.println("Session expired. Please try again.");
    return;
}

try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "");

    PreparedStatement ps = con.prepareStatement("UPDATE users SET password=? WHERE email=?");

    ps.setString(1, newpass);
    ps.setString(2, email);

    int updated = ps.executeUpdate();

    if(updated > 0){
        out.println("<script>alert('Password updated successfully'); window.location='login.jsp';</script>");
        session.removeAttribute("reset_email");
    } else {
        out.println("Password update failed");
    }

}catch(Exception e){
    out.println(e);
}
%>
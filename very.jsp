<%@ page import="java.sql.*" %>
<%
String email = request.getParameter("email");
String otp = request.getParameter("otp");

if (otp == null) {
%>
<%
} else {
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "");
        

        PreparedStatement ps = con.prepareStatement("SELECT * FROM otp_verification " + "WHERE email=? AND otp=? " + "AND created_at >= NOW() - INTERVAL 5 MINUTE " + "ORDER BY id DESC LIMIT 1");

        ps.setString(1, email);
        ps.setString(2, otp);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            session.setAttribute("reset_email", email);
            response.sendRedirect("reset_password.jsp");
        } else {
            out.println("<h3 style='color:red'>Invalid or Expired OTP</h3>");
        }

        rs.close();
        ps.close();
        con.close();

    } catch (Exception e) {
        e.printStackTrace(new java.io.PrintWriter(out, true));
    }
}
%>
<%@ page import="java.sql.*" %>
<%
String msg = "";
String email = request.getParameter("email");

if (email != null) {
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/user", "root", ""
        );

        PreparedStatement ps = con.prepareStatement(
            "SELECT id FROM users WHERE email=?"
        );
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            // ✅ Email exists → send OTP
            response.sendRedirect("send_otp.jsp?email=" + email);
            return;
        } else {
            // ❌ Email not found
            msg = "Email not registered!";
        }

        rs.close();
        ps.close();
        con.close();

    } catch (Exception e) {
        msg = "Server error!";
    }
}
%>
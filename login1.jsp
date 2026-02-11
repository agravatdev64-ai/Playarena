<%@ page language="java" contentType="text/html" %>
<%@ page import="java.sql.*" %>

<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    try {
        // Use updated MySQL driver
        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/user", "root", "");

        // Get NAME from database
        PreparedStatement ps = con.prepareStatement(
            "SELECT name FROM users WHERE email=? AND password=?");

        ps.setString(1, email);
        ps.setString(2, password);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            // ✅ Store username in session
            session.setAttribute("username", rs.getString("name"));
            session.setAttribute("email", email);

            response.sendRedirect("../user/index.jsp");
        } else {
            out.println("<script>alert('Login failed'); window.location='login.jsp';</script>");
        }

        con.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
%>

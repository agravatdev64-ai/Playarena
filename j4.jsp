<%@page import="java.sql.*" %>
<html>
    <body>
        <%
        String name= request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirm_password = request.getParameter("confirm_password");

        if (!password.equals(confirm_password)) {
            out.println("<script>alert('Passwords do not match!'); window.location='register.jsp';</script>");
        } else {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "");
                String que="INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
                PreparedStatement stmt = con.prepareStatement(que);
                stmt.setString(1, name);
                stmt.setString(2, email);
                stmt.setString(3, password);

                int rowsInserted = stmt.executeUpdate();
                if (rowsInserted > 0) {
                    out.println("<script>alert('Register successfully'); window.location='login.jsp';</script>");
                } else {
                    out.println("<script>alert('Register Fail'); window.location='register.jsp';</script>");
                }
                stmt.close();
                con.close();
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        }
        %>
    </body>
</html>
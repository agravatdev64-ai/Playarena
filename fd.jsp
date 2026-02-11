<%
    String user = (String) session.getAttribute("username");

    if (user == null) {
        response.sendRedirect("../visiter/index.jsp");
    }
%>

<%@page import="java.sql.*"%>
<html>
    <body>
        <%
        String nm = request.getParameter("nm");
        String email = request.getParameter("email"); 
        String ros = request.getParameter("ros");
        String com = request.getParameter("com");
        
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "");
            String query = "INSERT INTO fd (nm,email,ros,com) VALUES (?,?,?,?)";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, nm);
            stmt.setString(2, email);
            stmt.setString(3, ros);
            stmt.setString(4, com);
        
            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                
                response.sendRedirect("index.jsp");
            } else {
                out.println("Failed  Register ");
            }
            stmt.close();
            con.close();
        } catch (Exception e) {
            out.println(e);
        }
    %>
    </body>
</html>
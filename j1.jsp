<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.*" %>

<%
/* ---------------- SESSION CHECK ---------------- */
String user = (String) session.getAttribute("username");
String userEmail = (String) session.getAttribute("email"); // must be stored at login

if (user == null || userEmail == null) {
    response.sendRedirect("../visiter/index.jsp");
    return;
}

/* ---------------- FORM DATA ---------------- */
String bnm   = request.getParameter("bnm");
String date  = request.getParameter("date");
String st    = request.getParameter("st");
String et    = request.getParameter("et");
String hu    = request.getParameter("hu");
String snm   = request.getParameter("snm");
String price = request.getParameter("price");

/* ---------------- DB OBJECTS ---------------- */
Connection con = null;
PreparedStatement checkStmt = null;
PreparedStatement insertStmt = null;
ResultSet rs = null;

try {
    /* ---------------- LOAD DRIVER ---------------- */
    Class.forName("com.mysql.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/db?useSSL=false&serverTimezone=UTC",
        "root",
        ""
    );

    /* ---------------- CHECK OVERLAP ---------------- */
    String checkQuery =
        "SELECT id FROM f1 WHERE date=? AND snm=? AND st < ? AND et > ?";
    checkStmt = con.prepareStatement(checkQuery);
    checkStmt.setString(1, date);
    checkStmt.setString(2, snm);
    checkStmt.setString(3, et);
    checkStmt.setString(4, st);

    rs = checkStmt.executeQuery();

    if (rs.next()) {
%>
        <script>
            alert("This sport is already booked for the selected date and time.");
            history.back();
        </script>
<%
    } else {

        /* ---------------- INSERT BOOKING ---------------- */
        String insertQuery =
            "INSERT INTO f1(bnm,date,st,et,hu,snm,price) VALUES (?,?,?,?,?,?,?)";
        insertStmt = con.prepareStatement(insertQuery);
        insertStmt.setString(1, bnm);
        insertStmt.setString(2, date);
        insertStmt.setString(3, st);
        insertStmt.setString(4, et);
        insertStmt.setString(5, hu);
        insertStmt.setString(6, snm);
        insertStmt.setString(7, price);

        insertStmt.executeUpdate();

        /* ---------------- EMAIL LOGIC ---------------- */

        final String fromEmail = "devagravat534@gmail.com";     // sender
        final String appPass   = "nxcrpbpjnyibnjcb";       // app password

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session mailSession = Session.getInstance(props,
            new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, appPass);
                }
            }
        );

        Message msg = new MimeMessage(mailSession);
        msg.setFrom(new InternetAddress(fromEmail));
        msg.setRecipients(Message.RecipientType.TO,
                InternetAddress.parse(userEmail));
        msg.setSubject("Sports Booking Confirmation");

        String emailBody =
            "Hello " + bnm + ",\n\n" +
            "Your booking is CONFIRMED!\n\n" +
            "Sport: " + snm + "\n" +
            "Date: " + date + "\n" +
            "Time: " + st + " to " + et + "\n" +
            "Hours: " + hu + "\n" +
            "Price per hour: Rs." + price + "\n\n" +
            "Thank you for booking with us.\n\n" +
            "— Sports Booking Team";

        msg.setText(emailBody);
        Transport.send(msg);

        response.sendRedirect("index.jsp");
    }

} catch (Exception e) {
    out.println("<pre>" + e + "</pre>");
} finally {
    if (rs != null) rs.close();
    if (checkStmt != null) checkStmt.close();
    if (insertStmt != null) insertStmt.close();
    if (con != null) con.close();
}
%>

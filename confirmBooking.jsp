<%@ page import="java.sql.*,javax.mail.*,javax.mail.internet.*,java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
/* ---------------- SESSION CHECK ---------------- */
String userEmail = (String) session.getAttribute("email");
if (userEmail == null) {
    response.sendRedirect("../visiter/index.jsp");
    return;
}

/* ---------------- GET OTP ---------------- */
String otp = request.getParameter("otp");
if (otp == null || otp.length() != 6) {
%>
<script>
alert("Invalid OTP!");
history.back();
</script>
<%
return;
}

/* ---------------- DB CONNECTION ---------------- */
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/db?useSSL=false",
    "root",""
);

/* ---------------- VERIFY OTP ---------------- */
PreparedStatement ps = con.prepareStatement(
    "SELECT id FROM f1 WHERE otp=? ORDER BY id DESC LIMIT 1"
);
ps.setString(1, otp);

ResultSet rs = ps.executeQuery();
if (!rs.next()) {
%>
<script>
alert("Invalid or Expired OTP!");
history.back();
</script>
<%
con.close();
return;
}

/* ---------------- SEND FINAL CONFIRMATION EMAIL ---------------- */
String bnm   = (String) session.getAttribute("bnm");
String date  = (String) session.getAttribute("date");
String st    = (String) session.getAttribute("st");
String et    = (String) session.getAttribute("et");
String hu    = (String) session.getAttribute("hu");
String snm   = (String) session.getAttribute("snm");
String price = (String) session.getAttribute("price");

/* EMAIL CONFIG */
final String fromEmail = "devagravat534@gmail.com";
final String appPass   = "nxcrpbpjnyibnjcb";

Properties props = new Properties();
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.smtp.host", "smtp.gmail.com");
props.put("mail.smtp.port", "587");

Session mailSession = Session.getInstance(props,
    new Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(fromEmail, appPass);
        }
    }
);

Message msg = new MimeMessage(mailSession);
msg.setFrom(new InternetAddress(fromEmail));
msg.setRecipients(
    Message.RecipientType.TO,
    InternetAddress.parse(userEmail)
);
msg.setSubject("Booking Confirmed | PlayArena");

/* -------- EMAIL BODY (UTF-8 SAFE) -------- */
String body =
"Hello " + bnm + ",\n\n" +
"Your booking is CONFIRMED!\n\n" +
"Booking Details:\n" +
"Sport : " + snm + "\n" +
"Date  : " + date + "\n" +
"Time  : " + st + " to " + et + "\n" +
"Hours : " + hu + "\n" +
"Price : " + price + "\n\n" +
"Thank you for choosing PlayArena.\n" +
"Enjoy your game!\n\n" +
"— PlayArena Team";

/* ✅ WORKS WITH OLD JAVAMAIL */
msg.setContent(body, "text/plain; charset=UTF-8");

Transport.send(msg);

/* ---------------- CLEANUP ---------------- */
con.close();

/* ---------------- REDIRECT ---------------- */
response.sendRedirect("index.jsp");
%>

<%@page import="java.util.*,javax.mail.*,javax.mail.internet.*,java.sql.*"%>

<%
String email = request.getParameter("email");
if (email == null || email.trim().equals("")) {
    out.println("Email required");
    return;
}

/* Generate 6-digit OTP */
String otp = String.valueOf(100000 + new Random().nextInt(900000));

Connection con = null;

try {
    // ===== DATABASE =====
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "");

    /* OPTIONAL: delete old OTPs for same email */
    PreparedStatement del = con.prepareStatement(
        "DELETE FROM otp_verification WHERE email=?"
    );
    del.setString(1, email);
    del.executeUpdate();
    del.close();

    /* Insert new OTP (created_time auto-filled) */
    PreparedStatement ps = con.prepareStatement(
        "INSERT INTO otp_verification(email, otp) VALUES (?, ?)"
    );
    ps.setString(1, email);
    ps.setString(2, otp);
    ps.executeUpdate();
    ps.close();

    // ===== MAIL CONFIG =====
    String from = "devagravat534@gmail.com";
    String password = "nxcrpbpjnyibnjcb"; // Gmail App Password

    Properties props = new Properties();
    props.put("mail.smtp.host", "smtp.gmail.com");
    props.put("mail.smtp.port", "587");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.ssl.protocols", "TLSv1.2");
    props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

    Session mailSession = Session.getInstance(props, new Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(from, password);
        }
    });

    Message msg = new MimeMessage(mailSession);
    msg.setFrom(new InternetAddress(from));
    msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
    msg.setSubject("Your OTP Code");
    msg.setText("Your OTP is: " + otp + "\nValid for 5 minutes.");

    Transport.send(msg);

    // ===== REDIRECT =====
    response.sendRedirect("verify_otp.jsp?email=" + email);

} catch (Exception e) {
    e.printStackTrace(new java.io.PrintWriter(out, true));
} finally {
    if (con != null) con.close();
}
%>
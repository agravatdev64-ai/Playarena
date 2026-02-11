<%@ page import="java.sql.*,java.util.*,javax.mail.*,javax.mail.internet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
String user = (String) session.getAttribute("username");
String userEmail = (String) session.getAttribute("email");

if(user == null || userEmail == null){
    response.sendRedirect("../visiter/index.jsp");
    return;
}

/* FORM DATA */
String bnm   = request.getParameter("bnm");
String date  = request.getParameter("date");
String st    = request.getParameter("st");
String et    = request.getParameter("et");
String hu    = request.getParameter("hu");
String snm   = request.getParameter("snm");
String price = request.getParameter("price");

/* GENERATE 6-DIGIT OTP */
String otp = String.valueOf(100000 + new Random().nextInt(900000));

/* DB */
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/db?useSSL=false",
    "root",""
);

/* INSERT BOOKING + STORE OTP */
PreparedStatement ps = con.prepareStatement(
    "INSERT INTO f1 (bnm,date,st,et,hu,snm,price,otp) VALUES (?,?,?,?,?,?,?,?)"
);
ps.setString(1, bnm);
ps.setString(2, date);
ps.setString(3, st);
ps.setString(4, et);
ps.setString(5, hu);
ps.setString(6, snm);
ps.setString(7, price);
ps.setString(8, otp);   // ✅ OTP STORED HERE
ps.executeUpdate();

/* SAVE DATA FOR FINAL EMAIL */
session.setAttribute("bnm", bnm);
session.setAttribute("date", date);
session.setAttribute("st", st);
session.setAttribute("et", et);
session.setAttribute("hu", hu);
session.setAttribute("snm", snm);
session.setAttribute("price", price);

/* SEND OTP EMAIL */
final String fromEmail = "devagravat534@gmail.com";
final String appPass   = "nxcrpbpjnyibnjcb";

Properties props = new Properties();
props.put("mail.smtp.auth","true");
props.put("mail.smtp.starttls.enable","true");
props.put("mail.smtp.host","smtp.gmail.com");
props.put("mail.smtp.port","587");

Session mailSession = Session.getInstance(props,
    new Authenticator(){
        protected PasswordAuthentication getPasswordAuthentication(){
            return new PasswordAuthentication(fromEmail, appPass);
        }
    }
);

Message msg = new MimeMessage(mailSession);
msg.setFrom(new InternetAddress(fromEmail));
msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(userEmail));
msg.setSubject("OTP for PlayArena Booking");
msg.setText("Your 6-digit OTP is: " + otp);

Transport.send(msg);

con.close();
response.sendRedirect("verifyBookingOtp.jsp");
%>

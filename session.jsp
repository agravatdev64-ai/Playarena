<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
/* ===== ADMIN SESSION CHECK ===== */
String admin = (String) session.getAttribute("admin");

if(admin == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

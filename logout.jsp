<%
    // Destroy session
    if (session != null) {
        session.invalidate();
    }

    // Prevent browser cache
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    // Redirect to login page
    response.sendRedirect("../visiter/index.jsp");
%>

<%-- 
    Document   : Logout
    Created on : Jun 6, 2014, 12:47:20 AM
    Author     : dineshsingh
--%>

<%@page import="org.omg.PortableInterceptor.USER_EXCEPTION"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  
            session.removeAttribute("user");
            session.setAttribute("user",null);
            session.invalidate();
            response.sendRedirect("user.jsp");
        %>
        
    </body>
</html>

<%-- 
    Document   : welcome
    Created on : Jun 6, 2014, 7:35:29 PM
    Author     : dineshsingh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background-color: chocolate">
        <%
            if(session.getAttribute("user")==null||(session.getAttribute("user")==""))
            {
                response.sendRedirect("user.jsp");
            }
            /*out.println(session.isNew());
            out.println(request.getParameter("username"));
            out.println(session.getAttribute("user"));*/
            //Helper h=(Helper)session.getAttribute("object");
            if(session.getAttribute("user")==session.getAttribute("request")){
                out.print("Welcome "+session.getAttribute("user"));
        %>
        <a href="Logout.jsp">logout</a>
        <br/><br/><br/><br/><div align="center"><img src="Enrollement.gif" height="30" width="90"/></div>
        <table align="center"><tr><th><input type="button" name="add" value="New Student" height="30" onclick="add();"/></th></tr>
            <tr><th><input type="button" name="delete" value="Remove Student" onclick="delete1();"/></th></tr>
            <tr><th><input type="button" name="view" value="View Details" onclick="view();"/></th></tr>
        <script>
            function add()
            {
                window.open('add.jsp','two');
            }
            function delete1()
            {
                window.open('delete1.jsp','two');
            }
            function view()
            {
                window.open('View.jsp','two');
            }
        </script>
        <% 
            }
            else
            {   session.setAttribute("user",null);
                session.invalidate();
                response.sendRedirect("user.jsp");
            }
        %>
    </body>
</html>

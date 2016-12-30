<%-- 
    Document   : View
    Created on : Jun 5, 2014, 2:08:36 AM
    Author     : dineshsingh
--%>

<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background-color:  #E85353">
        <div style="background-color: silver;font: 300 italic 1.3em/1.7em FB Armada,sans-serif">
        <h2 align="center"> View Students </h2>
        </div>
        <form action="search.jsp" method="post">
            Search Registration Number <input type="text" name="search"/>
            <input type="submit" name="submit" value="submit"/>
        </form>
        <%
            String dbUrl="jdbc:mysql://localhost:3306/mysql";
            String dbUsername="root";
            String dbPassword="root";
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection(dbUrl,dbUsername,dbPassword);
                String query="select * from students";
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery(query);
        %>
        <table border="2" cellpadding="2" cellspacing="2" align="center">
            <tr><th>Number</th><th>first Name</th><th> Last Name</th><th>Gender</th><th>care Taker</th><th>Branch</th><th>address</th><th>DOB</th></tr>
        <%
                while(rs.next())
                {
                    out.println("<tr><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td>"
                           + "<td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td><td>"+rs.getDate(8)+"</td></tr>");
                }
        %>
    </table>
        <%
                
            }
            catch(Exception e)
            {
                out.println(e.getMessage());
            }
                
        %>
    </body>
</html>

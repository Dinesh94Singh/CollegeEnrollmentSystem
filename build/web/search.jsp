<%-- 
    Document   : search
    Created on : Jun 6, 2014, 10:00:10 PM
    Author     : dineshsingh
--%>

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
    <body style="background-color: #E85353">
        <div style="background-color: silver;font: 300 italic 1.3em/1.7em FB Armada,sans-serif">
        <h2 align="center"> Search Students </h2>
        </div>
        <a href="View.jsp">Go BACK</a>
        <%  
            String dbUrl="jdbc:mysql://localhost:3306/mysql";
            String dbUsername="root";
            String dbPassword="root";
            if(request.getParameter("search")!=null)
            {
                %> <table border="2" cellpadding="2" cellspacing="2" align="center">
            <tr><th>Number</th><th>first Name</th><th> Last Name</th><th>Gender</th><th>care Taker</th><th>Branch</th><th>address</th><th>DOB</th></tr>
            <%  try{
                String query2="select * from students where number="+Integer.parseInt(request.getParameter("search"));
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection(dbUrl,dbUsername,dbPassword);
                Statement st=con.createStatement();
                ResultSet rs=st.executeQuery(query2);
                while(rs.next())
                {
                    out.println("<tr><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td>"
                           + "<td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td><td>"+rs.getDate(8)+"</td></tr>");
                }
            }
            catch(Exception e)
            {
              out.println(e.getMessage());
            }
            }
          %>
            
            
    </body>
</html>

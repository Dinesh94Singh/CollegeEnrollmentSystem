<%-- 
    Document   : delete1
    Created on : Jun 6, 2014, 9:25:30 PM
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
        <h2 align="center"> Delete Students </h2>
        </div>
        <form action="delete1.jsp" method="post">
        Enter Number to Delete : <input type="text" name="remove"/>
        <input type="submit" value="submit"/>
        </form>
        <% 
            String s=request.getParameter("remove");
            String dbUrl="jdbc:mysql://localhost:3306/mysql";
            String dbUsername="root";
            String dbPassword="root";
            if(s!=null){
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection(dbUrl,dbUsername,dbPassword);
                Statement st=con.createStatement();
                int a=Integer.parseInt(s);
                String query="select count(*) from students where number="+a;
                ResultSet rs1=st.executeQuery(query);
                rs1.next();
                if(rs1.getInt(1)!=1)
                    out.println("No student with Regisiterd Number "+a+" to delete ");
                else
                {
                    String query2="delete from students where number="+a;
                    int rowseff=st.executeUpdate(query2);
                    if(rowseff==1)
                    {
                        out.println("Delete Successfull");
                        out.println("<a href='View.jsp'>View all</a>");
                    }
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

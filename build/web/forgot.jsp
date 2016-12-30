<%-- 
    Document   : forgot
    Created on : Jun 6, 2014, 10:28:34 PM
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
    <body style="background-color: red">
        <form action="forgot.jsp" method="post">
            
            <table align="center"><tr><th>Enter UserName:</th><th><input type="text" name="user1"/>
                <tr><th>Select question:</th><th>
            <select name="forgot">
                <option value="First Pet Name">First Pet Name</option>
                <option value="First name">First name</option>
                <option value="First Vehicle">First Vehicle</option>
                <option value="First Laptop">First Laptop</option>
            </select></th></tr><tr><th>
                        Answer:</th><th><input type="text" name="security"></th></tr>
                <tr><th></th><th><input type="submit" value="submit"/></th></tr></table>
        </form>
        <%
            String s=request.getParameter("forgot");
            String username=request.getParameter("user1");
            if((s!=null)&&(username!=null))
            {
            
            String dbUrl="jdbc:mysql://localhost:3306/mysql";
            String dbUsername="root";
            String dbPassword="root";
            
                try
                {
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection(dbUrl,dbUsername,dbPassword);
                String query1="select * from forgot where user='"+username+"'";
                Statement st=con.createStatement();
                ResultSet rs1=st.executeQuery(query1);
                rs1.next();
                if((rs1.getString(2).equals(s))&&(request.getParameter("security").equals(rs1.getString(3))))
                {
                    String query2="select * from faculty where user='"+username+"'";
                    ResultSet rs2=st.executeQuery(query2);
                    rs2.next();
                    out.println("Your Password is "+rs2.getString(2));
                }
                else
                {
                    out.print("Please try the correct combination ! ");
                }
                
                }
                catch(Exception e)
                {
                    out.println(e.getMessage());
                }
                            
;            
            }
        %>
    </body>
</html>

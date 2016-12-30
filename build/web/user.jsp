<%-- 
    Document   : user
    Created on : Jun 4, 2014, 7:00:35 PM
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
    <body style="background-color:#8A4726">
        <script>
            history.forward();
            window.open('index.jsp','two');
        </script>
        <% String username=request.getParameter("user");
           String password=request.getParameter("pwd");
           if((username==null)&&(password==null))
           {
        %>
        <form action="user.jsp" method="post">
            <table><tr><th>UserId:</th><td><input type="text" name="user"/></td></tr>
                <tr><th>Password:</th><th><input type="password" name="pwd"/></th>
                <tr><td></td><td><a href="forgot.jsp">Forgot Password ?</a></td></tr>
                <tr><td></td><td><input type="submit" name="login" onsubmit="check();"/>
                        <input type="reset" name="clear"/></td></tr></table>
        </form>
        <%  }
           else
           {
            String dbUrl="jdbc:mysql://localhost:3306/mysql";
            String dbUsername="root";
            String dbPassword="root";
            if((username!=null)&&(password!=null)){
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection(dbUrl,dbUsername,dbPassword);
                String query="select count(*) from faculty where user='"+username+"' and password='"+password+"'";
                Statement st=con.createStatement();
                ResultSet rs1=st.executeQuery(query);
                rs1.next();
                if(rs1.getInt(1)==1)
                {
                  session.setAttribute("user",username);
                  session.setAttribute("request",username);
                  //Helper h=new Helper(username);
                  //session.setAttribute("object",h);
                  
                  //if(session.)
                  %><jsp:include page="welcome.jsp"/><%
                }    
                else
                {
                    out.println("check username and password<br/><a href='user.jsp'>login</a>");
                }
                
            }
            catch(Exception e)
            {
                out.println("<h1>"+e.getMessage()+"</h1>");
            
            }  
            }//end of if 
           }//end of starting else
        %>
        
    </body>
</html>

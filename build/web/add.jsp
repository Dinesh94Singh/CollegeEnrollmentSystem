<%-- 
    Document   : add
    Created on : Jun 4, 2014, 11:14:20 PM
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
    <body style='background-color: #E85353'>
        <div style="background-color: silver">
        <h1 align="center">Add Student</h1>
        </div>
        
        <form action="add.jsp" method="post"/>
        <table align="center">
            <tr><td>Enter First Name:</td><td><input type="text" name="studentfirstname" size="30"/></td></tr>
            <tr><td>Enter Last Name:</td><td><input type="text" name="studentlastname" size="30"/></td></tr>
            <tr><td>Gender</td><td>male<input type="radio" name="gender" value='male'/>&nbsp;female<input type="radio" name="gender" value='female'/></td></tr>
            <tr><td>DOB</td>
                        <td>
                            <select name="birthday_month" id="month"><option value="0" selected="1">Month</option>
<option value="1">Jan</option><option value="2">Feb</option><option value="3">Mar</option><option value="4">Apr</option>
<option value="5">May</option><option value="6">Jun</option><option value="7">Jul</option><option value="8">Aug</option>
<option value="9">Sep</option><option value="10">Oct</option><option value="11">Nov</option><option value="12">Dec</option>
</select>
<select name="birthday_day" id="day"><option value="0" selected="1">Day</option><option value="1">1</option>
<option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option>
<option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option>
<option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option>
<option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option>
<option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option>
<option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option>
<option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option>
<option value="30">30</option><option value="31">31</option>
</select>
<select name="birthday_year" id="year"><option value="0" selected="1">Year</option><option value="2014">2014</option>
<option value="2013">2013</option><option value="2012">2012</option><option value="2011">2011</option>
<option value="2010">2010</option><option value="2009">2009</option><option value="2008">2008</option>
<option value="2007">2007</option><option value="2006">2006</option><option value="2005">2005</option>
<option value="2004">2004</option><option value="2003">2003</option><option value="2002">2002</option>
<option value="2001">2001</option><option value="2000">2000</option><option value="1999">1999</option>
<option value="1998">1998</option><option value="1997">1997</option><option value="1996">1996</option>
<option value="1995">1995</option><option value="1994">1994</option><option value="1993">1993</option>
<option value="1992">1992</option><option value="1991">1991</option><option value="1990">1990</option>
<option value="1989">1989</option><option value="1988">1988</option><option value="1987">1987</option>
<option value="1986">1986</option><option value="1985">1985</option><option value="1984">1984</option>
<option value="1983">1983</option><option value="1982">1982</option><option value="1981">1981</option>
</select>
                        </td>
            <tr><td>Parent/Guardian's Name:</td><td><input type='text' name='pname' size='30'/></td></tr>
            <tr><td>Phone Number:</td><td><input type="text" name="phno" size="30"/></td></tr>
            <tr><td>Branch</td>
                <td><select name='btech'>
                        <option value="Computer Science">Computer Science</option>
                        <option value='Mechanical Engineering'>Mechanical Engineering</option>
                        <option value="Civil Engineering">Civil Engineering</option>
                        <option value="Electrical Engineering">Electrical Engineering</option>
                    </select>
                </td>
            </tr> 
            <tr><td>Address:</td><td><textarea name="addr" rows='10' cols='50'></textarea></td></tr>
            <tr><td></td><td><input type="submit" value="insert"/>&nbsp;<input type="reset" value="clear"/></td>
        </table>
        </form>
        </div>
       
        <%  
            String dbUrl="jdbc:mysql://localhost:3306/mysql";
            String dbUsername="root";
            String dbPassword="root";
            String FirstName=request.getParameter("studentfirstname");
            String LastName=request.getParameter("studentlastname");
            String gender=request.getParameter("gender");
            String careTaker=request.getParameter("pname");
            String branch=request.getParameter("btech");
            String addr=request.getParameter("addr");
            String phno=request.getParameter("phno");
            //Date d=new Date(year,month,date);
            if((FirstName!=null)&&(LastName!=null)&&(gender!=null)&&(careTaker!=null)&&(branch!=null)&&(request.getParameter("birthday_year")!=null)&&(request.getParameter("birthday_month")!=null)&&(request.getParameter("birthday_day")!=null)&&(phno!=null))
            {
            try
            {
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection(dbUrl,dbUsername,dbPassword);
                String query1="select count from references1 where user='admin'";
                Statement st=con.createStatement();
                ResultSet rs1=st.executeQuery(query1);
                rs1.next();
                long pno=Long.parseLong(phno);
                int count1=rs1.getInt(1)+1;
                String d=request.getParameter("birthday_year")+"-"+request.getParameter("birthday_month")+"-"+request.getParameter("birthday_day");
                String query2="insert into students values("+count1+",'"+FirstName+"','"+LastName+"','"+gender+
                        "','"+careTaker+"','"+branch+"','"+addr+"','"+d+"',"+pno+")";
               int dummy=st.executeUpdate(query2);
               String queryupdate="update references1 set count="+count1+" where user='admin'";
               int update=st.executeUpdate(queryupdate);
               if((dummy!=1 )||(update!=1) )
                   out.println("Sorry Try Again!!");
               else
               {
                   %>
                   <script>
                       alert("Record Inserted Successfully !! ");
                   </script>
        <%
                   
               }
            }
            catch(Exception e)
            {
                out.println("<h1>"+e.getMessage()+"</h1>");
            
            }
            }
         %>
    </body>
</html>

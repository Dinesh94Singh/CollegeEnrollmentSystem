package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class forgot_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body style=\"background-color: red\">\n");
      out.write("        <form action=\"forgot.jsp\" method=\"post\">\n");
      out.write("            \n");
      out.write("            <table align=\"center\"><tr><th>Enter UserName:</th><th><input type=\"text\" name=\"user1\"/>\n");
      out.write("                <tr><th>Select question:</th><th>\n");
      out.write("            <select name=\"forgot\">\n");
      out.write("                <option value=\"First Pet Name\">First Pet Name</option>\n");
      out.write("                <option value=\"First name\">Ph-no</option>\n");
      out.write("                <option value=\"First Vehicle\">First Vehicle</option>\n");
      out.write("                <option value=\"First Laptop\">First Laptop</option>\n");
      out.write("            </select></th></tr><tr><th>\n");
      out.write("                        Answer:</th><th><input type=\"text\" name=\"security\"></th></tr>\n");
      out.write("                <tr><th></th><th><input type=\"submit\" value=\"submit\"/></th></tr></table>\n");
      out.write("        </form>\n");
      out.write("        ");

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
        
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

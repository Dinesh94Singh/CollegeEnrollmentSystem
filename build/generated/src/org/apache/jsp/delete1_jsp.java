package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class delete1_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <body style=\"background-color: #E85353\">\n");
      out.write("        <div style=\"background-color: silver;font: 300 italic 1.3em/1.7em FB Armada,sans-serif\">\n");
      out.write("        <h2 align=\"center\"> Delete Students </h2>\n");
      out.write("        </div>\n");
      out.write("        <form action=\"delete1.jsp\" method=\"post\">\n");
      out.write("        Enter Number to Delete : <input type=\"text\" name=\"remove\"/>\n");
      out.write("        <input type=\"submit\" value=\"submit\"/>\n");
      out.write("        </form>\n");
      out.write("        ");
 
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

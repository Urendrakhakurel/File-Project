package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.apache.commons.io.FilenameUtils;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;
import java.nio.file.Files;
import java.util.Enumeration;
import java.io.File;
import java.sql.*;

public final class _005findex_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/DatabaseConnection.jsp");
  }

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
      response.setContentType("text/html");
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
      out.write('\n');

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","");

      out.write("\n");
      out.write("\n");
      out.write("\n");
    String path = request.getServletContext().getRealPath("") + "/img";
      MultipartRequest mrequest = new MultipartRequest(request, path, 300000000, new FileRenamePolicy() {

        @Override
        public File rename(File file) {
            String name = "khaku-" + String.valueOf(new java.util.Date().getTime());
            String ext = FilenameUtils.getExtension(file.getName());
            return new File(file.getParentFile(), name + "." + ext);

        }
    });

    String filename = null;
    Enumeration files = mrequest.getFileNames();
    if (files.hasMoreElements()) {
        filename = mrequest.getFilesystemName(files.nextElement().toString());
        out.println(filename);
    }
    String ext = FilenameUtils.getExtension(filename);
    if (ext.equalsIgnoreCase("png") || ext.equalsIgnoreCase("jpg") || ext.equalsIgnoreCase("jpeg")||ext.equalsIgnoreCase("mp4")) {
        String Title = mrequest.getParameter("Title");
        String Description = mrequest.getParameter("Description");
        PreparedStatement pstmt = con.prepareStatement("insert into gallery(Title,Image,Description) values(?,?,?)");
        pstmt.setString(1, Title);
        pstmt.setString(2, filename);
        pstmt.setString(3, Description);
        int result = pstmt.executeUpdate();
        if (result > 0) 
        {
            out.println("file upload:" + filename);
        } 
    }
        else 
        {
            Files.delete(new File(path + "/" + filename).toPath());
            response.sendRedirect("index.jsp?msg=invalid format!");
        }
    

      out.write("  \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
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

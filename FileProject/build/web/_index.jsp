
<%@page import="org.apache.commons.io.FilenameUtils"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@include file="DatabaseConnection.jsp"%>


<%    
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
    
%>  
















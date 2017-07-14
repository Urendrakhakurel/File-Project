

<%@page import="org.apache.commons.io.FilenameUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@ include file="DatabaseConnection.jsp"%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1></h1>
        <%  int id = Integer.parseInt(request.getParameter("id"));
            PreparedStatement pstmt = con.prepareStatement("select * from gallery where id=?");
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                String path = request.getServletContext().getContextPath() + "/img/" + rs.getString(3);
                String ext = FilenameUtils.getExtension(rs.getString(3));
        %>
        <h1><%=rs.getString(2)%></h1>
        <%if (ext.equalsIgnoreCase("mp4")) {%>
        <video src="<%=path%>" controls width="300" ></video>
            <%} else {%>
        <img src="<%=path%>"  width="300">  

        <%}%>
        <p><%=rs.getString(4)%><P>
            <%}%>
    </body>
</html>

<%-- 
    Document   : list
    Created on : Jun 2, 2017, 1:20:17 PM
    Author     : Khakurel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="DatabaseConnection.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Table List</h1>
        <table>
            <tr>
                <th>S.NO</th>
                <th>Title</th>
                <th></th>
            </tr>
             <%
                 int count=0;
                 Statement stmt = con.createStatement();
                 ResultSet rs = stmt.executeQuery("select id,title from gallery");
                while(rs.next()){
             %>  
            <tr>
                <td><%=count++%></td>
                <td><%=rs.getString(2)%></td>
                <td><a href="view.jsp?id=<%=rs.getString(1)%>">View</a></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>

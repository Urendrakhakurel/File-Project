<%-- 
    Document   : index
    Created on : May 31, 2017, 12:34:48 PM
    Author     : Khakurel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <h1>File Upload!</h1>
        <form action="_index.jsp" method="post" enctype="multipart/form-data">
            Title     <input type="text" name="Title"><br>
            File:     <input type="file" name="file"><br>
            Description: <textarea name ="description"></textarea><br>
            <input type="submit" name="submit">
            
        </form>
        <%
        String msg = request.getParameter("msg");
        if(msg!=null){
            {
                out.println(msg);
            }
        }
        %>
        <%
       
        for(int i=0; i<=10; i++)
        {
            out.println("hello");
        }
        %>
    </body>
</html>

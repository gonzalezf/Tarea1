<%-- 
    Document   : logout.jsp
    Created on : Apr 20, 2014, 3:17:56 PM
    Author     : felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String logged_in = null;
    try{
        logged_in = (String)session.getAttribute("LoggedIn");
    }
    catch(Exception e)
    {
        response.setStatus( 403 );
        return;
    }
    if(logged_in == null)
    {
        response.setStatus( 403 );
        return;
    }
    if(logged_in.equals("no"))
    {
        response.setStatus( 403 );
        return;
    }
    session.invalidate();
    response.setHeader("Refresh", "5; login.jsp");
%>
<html>
    <head>
        <title>Logout</title>
    </head>
    <body>
        <h1> Sesión cerrada. Se te redirigira automáticamente en 5 segundos...</h1>
    </body>
</html>

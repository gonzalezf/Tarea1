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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>
    <body>
    <div id="logout_page">
        <h1> Sesión Cerrada /h1>
        <h2> ¡Te esperamos con ansias! </h1>
        <img style="border:5px solid black" src="img/logout.jpg">
    </div>
    </body>
</html>

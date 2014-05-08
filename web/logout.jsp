<%-- 
    Document   : logout.jsp
    Created on : Apr 20, 2014, 3:17:56 PM
    Author     : felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.registro" %>
<!DOCTYPE html>
<%
    if(!registro.IsLoggedIn(session))
    {
        response.sendRedirect("index.jsp");
        return;
    }
    session.invalidate();
    response.setHeader("Refresh", "4; index.jsp");
%>
<html>
    <head>
        <title>Logout</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
        <script type="text/javascript" src="js/script.js"></script>
    </head>
    <body id="body_fade">
    <div class="pagecontent">
        <div id="logout_wrapper">
        <h1> Sesión Cerrada </h1>
        <h2> ¡Te esperamos con ansias! </h1>
        <img id="fademeslowly" style="border:5px solid black;margin-top:30px;border-radius:300px"src="img/logout.jpg">
        </div>
    </div>
    </body>
</html>

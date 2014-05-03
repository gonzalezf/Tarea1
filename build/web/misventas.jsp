<%-- 
    Document   : misventas
    Created on : 20-04-2014, 11:45:16 PM
    Author     : Felipe Gonzalez
--%>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
    //Esto verifica que el usuario haya iniciado sesión
    //y que además tenga los permisos necesarios.
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
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mis Ventas</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
    </head>
    <body>
    <%@include file="sidebar.jsp" %>
    <div class="pagecontent">
        <form action="misventas" method="post" >
           <h1>Mis Ventas!</h1> 
           <h2>Por seguridad , vuelva a loguearse.</h2>
           <p>Ingrese rut:</p>
           <input class="input" type="text" value="" name="rut">
           <p>Ingrese Contraseña:</p>
           <input class="input" type="text" value="" name="contrasenna">

           <input class="submit" type="submit" value="Comprobar Usuario" name="misventas">
        </form>
    </div>
    </body>
</html>

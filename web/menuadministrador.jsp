<%-- 
    Document   : menuadministrador
    Created on : 19-04-2014, 11:26:56 PM
    Author     : Felipe Gonzalez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
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
    if(!session.getAttribute("UserLevel").toString().equals("Administrador"))
    {
        response.setStatus( 403 );
        return;
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Administrador</title>
    </head>
    <body>
        <h1>Menu Administrador</h1>


        <a href="ingresarvendedor.jsp">Ingresar Vendedor</a>
        <a href="url">Ingresar Cliente</a>
        <a href="administrarproductos.jsp">Administrar Productos</a>
        <a href="url">Ingresar Compra</a>
        <a href="url">Ingresar Venta</a>
        <a href="url">Ver Ventas a Cliente</a>
        <br><br>
        <a href="logout.jsp">Logout </a>


    </body>
</html>

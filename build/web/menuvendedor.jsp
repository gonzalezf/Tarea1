<%-- 
    Document   : menuvendedor
    Created on : 19-04-2014, 11:29:22 PM
    Author     : Felipe Gonzalez
--%>

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
    if(!session.getAttribute("UserLevel").toString().equals("Vendedor"))
    {
        response.setStatus( 403 );
        return;
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu vendedor</title>
    </head>
    <body>
        <h1>Menu vendedor</h1>
        <a href="ingresarcliente.jsp">Ingresar Cliente</a>
        <a href="ingresarventa.jsp">Ingresar Venta</a>
        <a href="url">Ver ventas a cliente</a>
        <a href="misventas.jsp" action="login" method="post">Mis ventas</a>




    </body>
</html>

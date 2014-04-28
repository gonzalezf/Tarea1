<%-- 
    Document   : ingresarcompra
    Created on : 20-04-2014, 11:07:41 PM
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
    if(!session.getAttribute("UserLevel").toString().equals("Administrador"))
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
    </head>
    <body>
    <%@include file="sidebar.jsp" %>
    <div class="pagecontent">
        <form id = "submit_form_compra" action="ingresarcompra.jsp" method="post" >
            <h1>Ingresar Compra a la base de Datos</h1>
            <div id="left">
            <p>Producto</p>
            1
            <input class="input" type="text" value="" name="id_producto">
            </div>
            
            <div id="center">
            <p>Ingrese cantidad</p>
            <input class="input" type="text" value="" name="cantidad">
            </div>
            
            <div id="right">
            <p>Ingrese precio</p>
            <input class="input" type="text" value="" name="precio">
            </div>
            <div class="clearfix"></div>
            <input id="submit_button" class="submit" type="submit" value="Ingresar Compra" name="ingresarvendedor">
            <div id="form_reply_message"></div>
        </form>
    </div>
    </body>
</html>

<%-- 
    Document   : ingresarvendedor
    Created on : 20-04-2014, 03:10:57 PM
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
        <title>Ingresar Vendedor</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
    </head>
    <body>
        <%@include file="sidebar.jsp" %>
        <div class="pagecontent">
        <form id = "submit_form" action="ingresarvendedor" method="post" >
            <h1>Ingresar nuevo vendedor</h1>
            <div id="left">
            <p>Ingrese RUT:</p>
            <input id="form_1" class="input" type="text" value="" name="rut">
            </div>
            <div id="right">
            <p>Ingrese nombre:</p>
            <input id="form_2" class="input" type="text" value="" name="nombre">
            </div>
            <div class="clearfix"></div>
            <div id="left">
            <p>Ingrese contraseña:</p>
            <input id="form_3" class="input" type="password" value="" name="contrasenna">
            </div>
            <div id="right">
            <p>Repita contraseña:</p>
            <input id="form_4" class="input" type="password" value="" name="repetircontrasenna">
            </div>
            <div class="clearfix"></div>
            <div id="left">
            <p>Ingrese comisión:</p>
            <input id="form_5" class="input" type="text" value="" name="comision">
            </div>
            <div class="clearfix"></div>
            <input id="submit_button" class="submit" type="submit" value="Ingresar Vendedor" name="ingresarvendedor">
            <div id="form_reply_message"></div>
        </form>
        </div>
    <script type="text/javascript" src="js/script.js"></script>
    </body>
</html>

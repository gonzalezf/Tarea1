<%-- 
    Document   : agregarproducto
    Created on : 20-04-2014, 06:24:06 PM
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
        <title>Agregar producto</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
    </head>
    <body>
        <%@include file="sidebar.jsp" %>
        <div class="pagecontent">
        <h1>Agregar Producto</h1>
        <form id="submit_form" action="agregarproducto" method="post" >
            <div id="left">
            <p>Ingrese Nombre</p>
            <input id="form_1" class=input type="text" value="" name="nombre">
            </div>
            
            <div id="right">
            <p>Ingrese Descripción</p>
            <input id="form_2" class="input" type="text" value="" name="descripcion">
            </div>
            <div class="clearfix"></div>
            
            <div id ="left">
            <p>Ingrese Categoría</p>
            <input id="form_3" class="input" type="text" value="" name="categoria">
            </div>
            
            <div id="right">
            <p>Ingrese Stock Inicial</p>
            <input id="form_4" class="input" type="text" value="" name="stock">
            </div>
            
            <div class="clearfix"></div>
            <div id="left">
            <p>Ingrese Precio</p>
            <input id="form_5" class="input" type="text" value="" name="precio">
            </div>
            
            <div class="clearfix"></div>
            
            <input id="submit_button" class="submit" type="submit" value="Finalizar" name="agregarproducto">
            <input id="edit_volver" class="submit" type="submit" value="Volver">
            <div id = "form_reply_message"></div>
        </form>
        </div>
    </body>
    <script type="text/javascript" src="js/script.js"></script>
</html>

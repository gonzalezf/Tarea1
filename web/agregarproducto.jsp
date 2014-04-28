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
        <title>Ingresar Vendedor</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
    </head>
    <body>
        <%@include file="sidebar.jsp" %>

        <form action="agregarproducto" method="post" >
            <h2> Agregar Producto a la Base de Datos</h2>
            <p>Codigo de producto:</p>
            <p><input type="text" value="" name="id_producto"></p>
            <p>Ingrese Nombre</p>
            <p><input type="text" value="" name="nombre"></p>
            <p>Ingrese Descripción:</p>
            <p><input type="text" value="" name="descripcion"></p>
            <p>Ingrese Categoría</p>
            <p><input type="text" value="" name="categoria"></p>
            <p>Ingrese Stock</p>
            <p><input type="text" value="" name="stock"></p>
            <p>Ingrese Precio</p>
            <p><input type="text" value="" name="precio"></p>

            <p> <input type="submit" value="Finalizar" name="agregarproducto"></p>


        </form>
        
    </body>
</html>

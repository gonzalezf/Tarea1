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
    </head>
    <body>

                 <form action="ingresarvendedor" method="post" >

                <h2>Ingresar Vendedor a la base de Datos</h2>
                <p>Ingrese rut:</p>
                <p><input type="text" value="" name="rut"></p>
                <p>Ingrese contraseña</p>
                <p><input type="text" value="" name="contrasenna"></p>
                <p>Repetir contraseña</p>
                <p><input type="text" value="" name="repetircontrasenna"</p>
                <p>Ingrese Nombre</p>
                <p><input type="text" value="" name="nombre"></p>
                <p>Ingrese comision </p>
                <p><input type="text" value="" name="comision"></p>

                

                <p> <input type="submit" value="Ingresar Vendedor" name="ingresarvendedor"></p>
                 </form>






        
    </body>
</html>

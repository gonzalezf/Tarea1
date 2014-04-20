<%-- 
    Document   : ingresarcliente
    Created on : 20-04-2014, 04:40:32 PM
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
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingresar Cliente</title>
    </head>
    <body>
        <h1>Ingresar Cliente!</h1>

        <form action="ingresarcliente" method="post" >

            
                <h2>Ingresar Cliente a la base de Datos</h2>
                <p>Ingrese rut:</p>
                <p><input type="text" value="" name="rut"></p>
            
                <p>Ingrese Nombre</p>
                <p><input type="text" value="" name="nombre"></p>
              
                <p> <input type="submit" value="Ingresar Cliente" name="ingresarcliente"></p>

            
        </form>
    </body>
</html>

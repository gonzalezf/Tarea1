<%-- 
    Document   : ingresarvendedor
    Created on : 20-04-2014, 03:10:57 PM
    Author     : Felipe Gonzalez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

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
                <p><input type="text" value="" name="repetircontraseña"</p>
                <p>Ingrese Nombre</p>
                <p><input type="text" value="" name="nombre"></p>

                <p> <input type="submit" value="Ingresar Vendedor" name="ingresarvendedor"></p>
                 </form>






        
    </body>
</html>

<%-- 
    Document   : index
    Created on : 17-04-2014, 02:57:42 PM
    Author     : Felipe Gonzalez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingresar usuario</title>
    </head>
    <body>


        <form action="ingresousuario" method="post" >

            <div class="IngresoUsuario">
                <h2>Ingresar Usuario a la base de Datos</h2>
                <p>Ingrese rut:</p>
                <p><input type="text" value="" name="rut"></p>
                <p>Ingrese contraseña</p>
                <p><input type="text" value="" name="contrasenna"></p>
                <p>Ingrese Nombre</p>
                <p><input type="text" value="" name="nombre"></p>
                <p>Ingrese tipo</p>
                <p><input type="text" value="" name="tipo"></p>
                <p>Ingrese comision </p>
                <p><input type="text" value="" name="comision"></p>
                <p> <input type="submit" value="ingresousuario" name="ingresousuario"></p>

            </div>

        </form>
    </body>
</html>

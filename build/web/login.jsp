<%-- 
    Document   : login
    Created on : Apr 20, 2014, 1:08:08 PM
    Author     : felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio sesion</title>
    </head>
    <body>
        <h1>Inicio Sesion</h1>
              <form action="login" method="post" > <!-- se ingresa rut y contrasenna para redirigir a determinada aplicaccion -->
              <p> Ingrese rut </p>
              <p><input type="text" value="" name="rut"></p>
              <p> Ingrese contraseña </p>
              <p><input type="password" value="" name="contrasenna"></p>
              <p> <input type="submit" value="Login" name="login"></p>



                </form>

    </body>
</html>


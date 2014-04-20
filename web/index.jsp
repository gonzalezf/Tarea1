<%-- 
    Document   : index
    Created on : 19-04-2014, 08:44:37 PM
    Author     : Felipe Gonzalez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

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
              <p><input type="text" value="" name="contrasenna"></p>
              <p> <input type="submit" value="Login" name="login"></p>



                </form>

    </body>
</html>

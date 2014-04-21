<%-- 
    Document   : sidebar.jsp
    Created on : Apr 20, 2014, 7:45:30 PM
    Author     : felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id = "sidebar">
<div class="crbox">
    <h1>Información de Sesión</h1>
    <div id="pl">Usuario:</div>
    <div id="pr">Felipe Morales</div>
    <div class = "clearfix"></div>
    <div id="pl">Nivel:</div>
    <div id="pr"><% out.print(session.getAttribute("UserLevel").toString());%> </div>
    <div class = "clearfix"></div>
    <a id="logout" href="logout.jsp">Log out </a>
</div>
<div class = "clearfix"></div>
<div class = "menu">
    <h1>Menu Administrador</h1>
        <a href="ingresarvendedor.jsp">Ingresar Vendedor</a>
        <a href="url">Ingresar Cliente</a>
        <a href="administrarproductos.jsp">Administrar Productos</a>
        <a href="url">Ingresar Compra</a>
        <a href="url">Ingresar Venta</a>
        <a href="url">Ver Ventas a Cliente</a>
        <br><br>
</div>
</div>

<%-- 
    Document   : ingresarcompradone.jsp
    Created on : May 6, 2014, 2:54:13 PM
    Author     : felipe
--%>

<%@page import="modelo.registro"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
    //Esto verifica que el usuario haya iniciado sesión
    //y que además tenga los permisos necesarios.
    if(!registro.IsLoggedIn(session))
    {
        response.sendRedirect("index.jsp");
        return;
    }
    else if(!registro.GetUserLevel(session).equals("Administrador"))
    {
        response.sendRedirect("index.jsp");
        return;
    }
%>  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exito!</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
    </head>
    <body>
    <%@include file="sidebar.jsp" %>
    <div class="pagecontent">
        <h1>Compra Ingresada con exito</h1>
        <h2>Detalles de la compra:</h2>
        <p> ID de compra: %d</p>
        <p>Fecha: here</p>
        <p>Hora: here</p>
        <div class="tablewrapper">
        <table>
        <tr>
            <th id="producto">Producto</th>
            <th id="descripcion">Descripcion del producto</th>
            <th id="precio">Precio</th>
        </tr>
<%
%>
        </table>
        <table class="table_total">
        <tr>
            <th>TOTAL</th>
            <td>3000</td>
        </tr>
        </table>
    </div>         
    </div>
    </body>
    <script src="js/script.js"> </script>
</html>

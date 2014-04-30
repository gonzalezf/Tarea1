<%-- 
    Document   : ingresarcompra
    Created on : 20-04-2014, 11:07:41 PM
    Author     : Felipe Gonzalez
--%>

<%@page import="modelo.registro"%>
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
    String[] items = {"Jugo", "Pan", "Leche"};
    String[] ids = {"4", "5", "6"};
    String selector = "";
    for(int i = 0; i < items.length; i++)
    {
        selector+="<option value=\\\""+ids[i]+"\\\">"+items[i]+"</option>";
    }
%>
<script>
    <% out.print("var select_items = \""+selector+"\";"); %>
</script>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingresar Compra</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
    </head>
    <body>
    <%@include file="sidebar.jsp" %>
    <div class="pagecontent">
        <form id = "submit_form_compra" action="ingresarcompra.jsp" method="post" >
            <h1>Ingresar Compra a la base de Datos</h1>
            <div id="InputAddStart">
            <div id="left">
             <p style="text-align:center;">Producto</p>
            1
            <select class="input" name="id_producto_1">
                <script>
                    document.write(select_items);
                </script>
            </select>
            </div>
            
            <div id="center">
            <p style="text-align:center;">Cantidad</p>
            <input class="input" type="text" value="" name="cantidad_1">
            </div>
            
            <div id="right">
             <p style="text-align:center;">Precio</p>
            <input class="input" type="text" value="" name="precio_1">
            <input id="plus_button" class="submit" type="submit" value="+" name="void">
            </div>
            <div class="clearfix"></div>
            </div>
            <div id="submit_button_wrapper">
            <input id="submit_button_compra" class="submit" type="submit" value="Ingresar Compra" name="ingresarcompra">
            </div>
            <div id="form_reply_message"></div>
        </form>
    </div>
    </body>
    <script src="js/script.js"> </script>
</html>

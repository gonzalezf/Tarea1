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
        <title>Ingresar cliente</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
    </head>
    <body>
        <%@include file="sidebar.jsp" %>
        <div class="pagecontent">
            <form id="submit_form" action="ingresarcliente" method="post" >
                <h1>Ingresar nuevo cliente</h1>

                <h2></h2>
                
                <div id="left">
                <p>Ingrese rut:</p>
                <input id="form_1" class="input" type="text" value="" name="rut">
                </div>
                
                <div id="right">
                <p>Ingrese Nombre:</p>
                <input id="form_2" class="input" type="text" value="" name="nombre">
                </div>
                <div class="clearfix"></div>
                <input id = "submit_button" class="submit" type="submit" value="Ingresar Cliente" name="ingresarcliente">
                <div id = "form_reply_message"></div>
           </form>
         </div>
    </body>
    <script type="text/javascript" src="js/script.js"></script>
</html>

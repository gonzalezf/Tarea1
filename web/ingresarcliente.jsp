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
    
    String data = null;
    try{
        data = (String)session.getAttribute("FormDataAvailable");
    }
    catch(Exception e)
    {
        
    }
    String rut = "";
    String name = "";
    if(data != null)
    {
        if(data.equals("yes"))
        {
            rut = (String)session.getAttribute("FormRut");
            name = (String)session.getAttribute("FormName");
        }
    }
    String message = "";
    String message_type = "";
    try
    {
        message = (String)session.getAttribute("Message");
        message_type = (String)session.getAttribute("MessageType");
    }
    catch(Exception e)
    {
        message = "";
        message_type = "None";
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingresar cliente</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>
    <body>
        <%@include file="sidebar.jsp" %>
        <div class="pagecontent">
            <form class: action="ingresarcliente" method="post" >
                <h1>Ingresar nuevo cliente</h1>

                <h2></h2>
                
                <div id="left">
                <p>Ingrese rut:</p>
                <input class="input" type="text" value="" name="rut">
                </div>
                
                <div id="right">
                <p>Ingrese Nombre:</p>
                <input class="input" type="text" value="" name="nombre">
                </div>
                <div class="clearfix"></div>
<%         
                if(message != null && !message.equals(""))
                {
                    if(message_type.equals("Error"))
                    {
                        out.println("<div id=\"msg_error\">"+message+"</div>");
                    }
                    else if(message_type.equals("Warning"))
                    {
                        out.println("<div id=\"msg_warning\">"+message+"</div>");
                        session.setAttribute("Message", "");
                    }
                    else if(message_type.equals("Assert"))
                    {
                        out.println("<div id=\"msg_assert\">"+message+"</div>");
                        session.setAttribute("Message", "");
                    }
                    else
                    {
                        out.println("<div id=\"msg_hidden\">Las contraseñas no coinciden</div>");
                    }
                }
                else
                {
                    out.println("<div id=\"msg_hidden\">Las contraseñas no coinciden</div>");
                }

%>
                <input class="submit" type="submit" value="Ingresar Cliente" name="ingresarcliente">
           </form>
         </div>
    </body>
</html>

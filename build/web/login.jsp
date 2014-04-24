<%-- 
    Document   : login
    Created on : Apr 20, 2014, 1:08:08 PM
    Author     : felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    //
    String logged_in = null;
    try{
        logged_in = (String)session.getAttribute("LoggedIn");
    }
    catch(Exception e)
    {
    }
    if(logged_in != null && logged_in.equals("yes"))
    {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="jquery-1.11.0.min.js"></script>
        <title>Iniciar sesión</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
    </head>
    <body id="body_fade">
    <div id="login_page">
    <div class ="wrapper">
        <div class ="loginbox">
            <h1>Iniciar sesión</h1>
                <form id="loginform" action="login" method="post" > <!-- se ingresa rut y contrasenna para redirigir a determinada aplicaccion -->

                  <p>RUT:</p>
                  <div id="input_wrapper">
                  <input id = "rut" class = "form_input" type="" value="" name="rut">
                  <div class = "clearfix"></div>
                  </div>
                  <div id="input_wrapper">
                  <p> Contraseña: </p>
                  <input id="password" class = "form_input" type="password" value="" name="contrasenna">
                  <div class = "clearfix"></div>
                  </div>
                  <div class ="buttonholder">
                  <input id="login_button" class="button" type="submit" value="Log in" name="login">
                  <!--alert("probando, esto puede en jsp pero no en .java :(");-->
                  </div>
                </form>
        </div>
        <div class="loginboxerror">Usuario o contraseña incorrecta</div>
    </div>
    </div>
    </body>
    <script type="text/javascript" src="js/script.js"></script>
</html>

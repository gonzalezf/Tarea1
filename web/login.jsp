<%-- 
    Document   : login
    Created on : Apr 20, 2014, 1:08:08 PM
    Author     : felipe
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
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
        <title>Iniciar sesión</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>
    <body>
    <div class ="wrapper">
        <div class ="loginbox">
            <h1>Iniciar sesión</h1>
                <form action="login" method="post" > <!-- se ingresa rut y contrasenna para redirigir a determinada aplicaccion -->

                    <p>RUT:</p>
                  <div id="input_wrapper">
                  <input class = "form_input" type="" value="" name="rut">
                  <div class = "clearfix"></div>
                  </div>
                  <div id="input_wrapper">
                  <p> Contraseña: </p>
                  <input class = "form_input" type="password" value="" name="contrasenna">
                  <div class = "clearfix"></div>
                  </div>
                  <div class ="buttonholder">
                  <input class="button" type="submit" value="Log in" name="login">
                  <!--alert("probando, esto puede en jsp pero no en .java :(");-->
                  </div>
                </form>
        </div>
        <%         
                String wrongPassword = null;
                try{
                    wrongPassword = (String)session.getAttribute("InvalidLoginInfo");
                }
                catch(Exception e)
                {

                }
                if(wrongPassword != null)
                {
                    if(wrongPassword.equals("yes"))
                    {
                     // out.print("<script>alert('ERROR');</script>");
        %> <script>alert("ERROR");</script><%
                    }
                }

%>

    </div>
    </body>
</html>


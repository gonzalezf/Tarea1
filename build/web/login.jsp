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
        <title>Iniciar sesión</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>
    <body>
    <div class ="wrapper">
        <div class ="loginbox">
            <h1>Iniciar sesión</h1>
                <form action="login" method="post" > <!-- se ingresa rut y contrasenna para redirigir a determinada aplicaccion -->
                  <p> Ingrese rut </p>
                  <p><input type="" value="" name="rut"></p>
                  <p> Ingrese contraseña </p>
                  <p><input type="password" value="" name="contrasenna"></p>
                  <p> <input type="submit" value="Login" name="login"></p>
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
                        
                        out.println("<div class=\"loginboxerror\">Rut o contraseña inválidos</div>");
                    }
                }

%>
    </div>
    </body>
</html>


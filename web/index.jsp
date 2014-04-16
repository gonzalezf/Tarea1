<%-- 
    Document   : index
    Created on : 16-04-2014, 02:00:10 PM
    Author     : Felipe Gonzalez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link type="text/css" rel="stylesheet" href="Css/style.css" />
        <title>Iniciar Sesion</title>
    </head>
    <body>
        <h1 text-align:center >Welcome!</h1>

        <div class="login">
            <form method="POST" action="Login/sessionAction.jsp">

            <p>UserName: <input type="text" name="UserName" size="10"></p>
            <p>Password: &nbsp;&nbsp;<input type="Password" name="Password"
size="10"></p>
            <p> <input type="submit" value="Submit" name="submit"><input type=
"reset" value="Reset" name="reset"></p><hr><hr>

            </form>



        </div>




    </body>
</html>

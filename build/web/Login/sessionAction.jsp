<%-- 
    Document   : sessionAction
    Created on : 16-04-2014, 02:35:11 PM
    Author     : Felipe Gonzalez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
     <%@page import="java.util.*" %>
    <%String str = request.getParameter("UserName");

    session.setAttribute("UserName", request.getParameter("UserName"));%>
    <% if (session.getAttribute("UserName").equals("")){%> <%-- si no ingreso nada.. --%>
    <p>Debes ingresar un nombre de usuario!</p>
    <a href="http://localhost:8084/Tarea1/"><b>Login </b></a><%-- arreglar esto, hay una forma de setear la ruta --%>

    <%}
    else{%>
    Welcome <%= session.getAttribute( "UserName" ) %>

    <a href="logout.jsp"><b>Logout</b></a>
    <%}
    %>
    </body>
</html>

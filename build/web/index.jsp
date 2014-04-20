<%-- 
    Document   : index
    Created on : 19-04-2014, 08:44:37 PM
    Author     : Felipe Gonzalez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
    if(session.isNew())
    {
        session.setAttribute("LoggedIn", "no");
        response.sendRedirect("login.jsp");
        return;
    }
    String logged_in = null;
    try
    {
        logged_in = (String)session.getAttribute("LoggedIn");
    }
    catch(Exception e)
    {
        response.sendRedirect("login.jsp");
        return;
    }
    if(logged_in == null || logged_in.equals("no"))
    {
        response.sendRedirect("login.jsp");
        return;
    }
    else
    {
        if(session.getAttribute("UserLevel").equals("Vendedor"))
            response.sendRedirect("menuvendedor.jsp");
        else if(session.getAttribute("UserLevel").equals("Administrador"))
            response.sendRedirect("menuadministrador.jsp");
    }
        
%>
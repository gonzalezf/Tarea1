<%-- 
    Document   : administrarproductos
    Created on : 20-04-2014, 06:14:58 PM
    Author     : Felipe Gonzalez
--%>

<%@ page import="java.sql.*" %>

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
        <title>Administrar Productos</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>
    <body>
    <%@include file="sidebar.jsp" %>
    <div class="pagecontent">
        <h1>Administrar Productos</h1>

        <a href="agregarproducto.jsp">Agregar Producto</a>

        <table>

            <form action="editarproductobusqueda" method="post" >
             <h2>Busqueda: </h2>
             <p><input type='text' value='Ingrese nombre producto' name='clavebusqueda'></p>
            
            <p> <input type="submit" value="OK" name="editarproductobusqueda"></p>

            
            </form>

            <tr>
                <td>ID PRODUCTO</td>
                <td>NOMBRE </td>
                <td>STOCK</td>
            </tr>

      <%
            String classfor="oracle.jdbc.driver.OracleDriver";
            String url="jdbc:oracle:thin:@localhost:1521:XE";
            String usuario="admin";
            String clave="pelife18";

            Connection con=null;
            PreparedStatement pr=null;
            Statement consulta = null;
            ResultSet rs=null;

            try
            {
                Class.forName(classfor);
                con=DriverManager.getConnection(url, usuario, clave);

            }
            catch (ClassNotFoundException e)
            {
                System.out.println(e.toString());
            }
            try
            {  
                //Agregar name
                String sql= "SELECT ID_PRODUCTO, STOCK FROM PRODUCTO WHERE ROWNUM > 0 AND ROWNUM <= 10";
                pr = con.prepareStatement(sql);


                rs = pr.executeQuery();
                //aqui debe ir el if!
                out.print("<BR>LE WOW1<BR>");
                while(rs.next())
                {
                    out.print("<BR>LE WOW<BR>");
                    out.println("<TR>");
                    out.println("<TD>"+rs.getString(0)+"</TD>");
                    out.println("<TD>"+rs.getString(1)+"</TD>");

                    out.print("<TD><a href='editarproducto.jsp?id_producto="+rs.getString(0)+"'> Editar Producto </a></TD>");
                    out.println("</TR>");
                }
                rs.close();
                pr.close();
                con.close();
            } //fin del try
            catch (SQLException e)
            {
                out.print("<BR>LE ERROR<BR>");
            }
            %>

        </TABLE>

        <!-- Diseñar vista -->


    </div>
    </body>
</html>

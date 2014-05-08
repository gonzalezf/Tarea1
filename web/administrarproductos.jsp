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
            <form id="search_form" action="" method="post" >
             <h2>Buscar: </h2>
             <input placeholder="Ingrese nombre producto" type='text' value='' name='search'>
             <input id="search_button" type="submit" value="OK" name="">
            </form>
        <br>
        <a href="agregarproducto.jsp">Agregar Producto</a>
            <div class="tablewrapper_adminprod">
            <table>
            <tr>
                <th>Id Producto</th>
                <th>Nombre </th>
                <th>Stock</th>
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
            
            String search_name = null;
            try
            {
                search_name = request.getParameter("search");
            }
            catch(Exception e)
            {
                search_name = null;
            }
            try
            { 
                String sql;
                CallableStatement cs;
                if(search_name != null)
                {
                    sql= "SELECT ID_PRODUCTO, NOMBRE, STOCK FROM PRODUCTO WHERE NOMBRE LIKE ?";
                    cs = con.prepareCall(sql);
                    cs.setString(1, search_name);
                }
                else
                {
                    sql= "SELECT ID_PRODUCTO, NOMBRE, STOCK FROM PRODUCTO";
                    cs = con.prepareCall(sql);
                }
                
                rs = cs.executeQuery();
                //aqui debe ir el if!
                while(rs.next())
                {
                    out.println("<TR>");
                    out.println("<TD>"+rs.getString(1)+"</TD>");
                    out.println("<TD>"+rs.getString(2)+"</TD>");
                    out.println("<TD>"+rs.getString(3)+"</TD>");

                    out.print("<TD><a href='editarproducto.jsp?id_producto="+rs.getString(1)+"'> Editar</a></TD>");
                    out.println("</TR>");
                }
                rs.close();
                cs.close();
                con.close();
            } //fin del try
            catch (SQLException e)
            {
                out.print(e.toString());
            }
            %>

        </table>
        </div>
    </div>
    </body>
    <script type="text/javascript" src="js/script.js"></script>
</html>

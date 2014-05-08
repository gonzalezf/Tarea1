<%-- 
    Document   : verventas.jsp
    Created on : Apr 22, 2014, 7:34:04 PM
    Author     : felipe
--%>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    
     String search_id = null;
     try
     {
        search_id = request.getParameter("cliente");
     }
     catch(Exception e)
     {
        search_id = null;
     }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver Ventas a Cliente</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>
    <body>
        <%@include file="sidebar.jsp" %>
        <div class="pagecontent">
            <h1>Ventas a Cliente </h1>
<%
     if(search_id == null)
     {
%>
                <form id="verventas_form" action="" method="post" >
                <h2>Selecione Cliente</h2> 
                <br>
                <%
                    String classfor="oracle.jdbc.driver.OracleDriver";
                    String url="jdbc:oracle:thin:@localhost:1521:XE";
                    String usuario="admin";
                    String clave="pelife18";

                    Connection con=null;
                    PreparedStatement pr=null;
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
                    
                        String sql= "select rut, nombre from cliente";
                        pr = con.prepareStatement(sql);


                        rs = pr.executeQuery();
                        //aqui debe ir el if!


                        out.println("<select name='cliente'>");
                         while(rs.next())
                         {
                            out.println("<option id='cliente' value = '"+rs.getString(1)+"'>"+rs.getString(2)+"</option>");
                         }
                        out.println("</select>");
                        rs.close();
                        pr.close();
                        con.close();

                        } //fin del try
                        catch (SQLException e)
                        {
                        }
%>              
<br><br>
                <input id="verventas_button" class="submit_small" type="submit" value="Ver" name="">
        </form>
<%
    }
    else
    {
        String classfor="oracle.jdbc.driver.OracleDriver";
        String url="jdbc:oracle:thin:@localhost:1521:XE";
        String usuario="admin";
        String clave="pelife18";

        Connection con=null;
        PreparedStatement pr=null;
        PreparedStatement pr1 = null;
        Statement consulta = null;
        Statement consulta1 = null;
        ResultSet rs=null;
        ResultSet rs1 = null;

        try
        {
            Class.forName(classfor);
            con = DriverManager.getConnection(url, usuario, clave);


        }
        catch(ClassNotFoundException e)
        {
            System.out.println(e.toString());
        }
        
        String nombre_usuario = "Unknown";
        try
        {
            String query = "select NOMBRE FROM CLIENTE WHERE RUT = ?";
            CallableStatement cs = con.prepareCall(query);
            cs.setString(1, search_id);
            rs = cs.executeQuery();
            if(rs.next())
            {
                nombre_usuario = rs.getString(1);
            }
        }
        catch(SQLException e)
        {
            nombre_usuario = e.toString();
        }

%>
    <h2>Ventas para el usuario: <% out.print(nombre_usuario+" ("+search_id+")"); %></h2>
    <div class="tablewrapper_verventas">
    <table id="verventas_table">
        <tr>
        <th>ID Venta</th>
        <th>Vendedor</th>
        <th>Monto Total</th>
        <th>Fecha</th>
        <th>Hora</th>
        </tr>
<%
        try
        {
            String query = "select v.id_venta, u.nombre, v.monto_total, v.fecha, v.time from venta v, (SELECT RUT, NOMBRE FROM USUARIO us) u where id_cliente = ? AND u.RUT = v.ID_USUARIO";
            CallableStatement cs = con.prepareCall(query);
            cs.setString(1, search_id);
            rs = cs.executeQuery();
            while(rs.next())
            {
                out.println("<TR>");
                out.println("<TD>"+rs.getString(1)+"</TD>");
                out.println("<TD>"+rs.getString(2)+"</TD>");
                out.println("<TD>"+rs.getString(3)+"</TD>");
                out.println("<TD>"+rs.getString(4)+"</TD>");
                out.println("<TD>"+rs.getString(5)+"</TD>");
                out.println("</TR>");
            }
        }
        catch (SQLException e)
        {
        }           
    }
%>
    </table>
    </div>
    <form>
        <input id="verventas_volver" class="submit_small" type="submit" value="Volver">
    </form>
        </div>
    </body>
<script type="text/javascript" src="js/script.js"></script>
</html>
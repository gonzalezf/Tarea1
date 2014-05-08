<%-- 
    Document   : misventas
    Created on : 20-04-2014, 11:45:16 PM
    Author     : Felipe Gonzalez
--%>
<%@ page import="java.sql.*" %>
<%@ page import="modelo.registro" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    //Esto verifica que el usuario haya iniciado sesión
    //y que además tenga los permisos necesarios.
    if(!registro.IsLoggedIn(session))
    {
        response.sendRedirect("index.jsp");
        return;
    }
    
     String search_id = null;
     try
     {
        search_id = (String) session.getAttribute("UserRUT");
     }
     catch(Exception e)
     {
        search_id = null;
     }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mis Ventas</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>
    <body>
        <%@include file="sidebar.jsp" %>
        <div class="pagecontent">
            <h1>Mis Ventas </h1>
<%  if(search_id != null)
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

%>
    <h2>Todas las ventas hechas por usted</h2>
    <div class="tablewrapper_verventas">
    <table id="verventas_table">
        <tr>
        <th>ID Venta</th>
        <th>Cliente</th>
        <th>Monto Total</th>
        <th>Fecha</th>
        <th>Hora</th>
        </tr>
<%
            CallableStatement cs = null;
            try
            {
                String query = "select v.id_venta, c.nombre, v.monto_total, v.fecha, v.time from venta v, (SELECT RUT, NOMBRE FROM CLIENTE cl) c where v.id_usuario = ? AND c.RUT = v.ID_CLIENTE";
                cs = con.prepareCall(query);
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
            finally
            {
                cs.close();
                rs.close();
            }
        }
        catch(ClassNotFoundException e)
        {
            System.out.println(e.toString());
        }
        finally
        {
            con.close();
        }
    }
%>
    </table>
        </div>
        </div>
    </body>
<script type="text/javascript" src="js/script.js"></script>
</html>
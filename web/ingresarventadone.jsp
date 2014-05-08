<%-- 
    Document   : ingresarventadone.jsp
    Created on : May 7, 2014, 9:48:47 PM
    Author     : felipe
--%>

<%@page import="modelo.registro"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
    //Esto verifica que el usuario haya iniciado sesión
    //y que además tenga los permisos necesarios.
    if(!registro.IsLoggedIn(session))
    {
        response.sendRedirect("index.jsp");
        return;
    }
    else if(!registro.GetUserLevel(session).equals("Administrador"))
    {
        response.sendRedirect("index.jsp");
        return;
    }
    
    String classfor="oracle.jdbc.driver.OracleDriver";
    String url="jdbc:oracle:thin:@localhost:1521:XE";
    String usuario="admin";
    String clave="pelife18";

    Connection con=null;
    PreparedStatement pr = null;
    Statement consulta = null;
    ResultSet rs=null;
    String id_venta = null;
    try
    {
        id_venta = request.getParameter("venta");
    }
    catch(Exception e)
    {
        response.sendRedirect("index.jsp");
        return;
    }
    
    if(id_venta == null)
    {
        response.sendRedirect("index.jsp");
        return;
    }

    try
    {
        Class.forName(classfor);
        con=DriverManager.getConnection(url, usuario, clave);

    }
    catch (ClassNotFoundException e)
    {
        System.out.println(e.toString());
    }
    //Lista de lista
    String[] info;
    ArrayList<String[]> items = new ArrayList<String[]>();
    String cliente = "nadie", vendedor = "nadie", fecha = "Unknown", hora = "Unknown", total_compra = "???";
    try
    {
        String sql= "SELECT c.NOMBE, u.NOMBRE, v.MONTO_TOTAL, v.FECHA, v.TIME FROM VENTA v,(SELECT cl.RUT, cl.NOMBE FROM CLIENTE cl) c,(SELECT us.RUT, us.NOMBRE FROM USUARIO us) u WHERE v.ID_VENTA = ? AND v.ID_CLIENTE = c.RUT AND v.ID_USUARIO = u.RUT";
        CallableStatement cs = con.prepareCall(sql);
        cs.setString(1, id_venta);
        rs = cs.executeQuery();
        if(rs.next())
        {
            cliente = rs.getString(1);
            vendedor = rs.getString(2);
            total_compra = rs.getString(3);
            fecha = rs.getString(4);
            hora = rs.getString(5);
        }
        sql = "SELECT v.NOMBRE, v.DESCRIPCION, d.CANTIDAD, v.PRECIO FROM DETALLE_VENTA d, (SELECT p.ID_PRODUCTO, p.NOMBRE, p.DESCRIPCION, p.PRECIO FROM PRODUCTO p) v WHERE d.ID_VENTA = ? AND d.ID_PRODUCTO = v.ID_PRODUCTO";
        cs = con.prepareCall(sql);
        cs.setString(1, id_venta);
        rs = cs.executeQuery();
        while(rs.next())
        {
            info = new String[4];
            info[0] = rs.getString(1);
            info[1] = rs.getString(2);
            info[2] = rs.getString(3);
            info[3] = rs.getString(4);
            items.add(info);
        }
    }
    catch(Exception e)
    {
        info = new String[4];
        info[0] = e.toString();
        info[1] = e.toString();
        info[2] = e.toString();
        items.add(info);
    }
%>  
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exito!</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
    </head>
    <body>
    <%@include file="sidebar.jsp" %>
    <div id="body_fade" class="pagecontent">
        <h1>Venta Realizada con exito</h1>
        <h2>Detalles de la venta:</h2>
        <br>
        <p>ID de Venta: <% out.println(id_venta); %></p>
        <p>Cliente: <% out.println(cliente); %></p>
        <p>Vendedor: <% out.println(vendedor); %></p>
        <p>Fecha: <% out.println(fecha); %></p>
        <p>Hora: <% out.println(hora); %></p>
        <div class="tablewrapper">
        <table>
        <tr>
            <th id="producto">Producto</th>
            <th id="descripcion">Descripcion del producto</th>
            <th id="precio">Cantidad</th>
            <th>Precio Unitario</th>
        </tr>
<%
        for(String[] i: items)
        {
            int price;
            try
            {
                price = Integer.parseInt(i[3]) * Integer.parseInt(i[2]);
            }
            catch(NumberFormatException e)
            {
                price = 0;
            }
            out.println("<tr><td>"+i[0]+"</td><td>"+i[1]+"</td><td>"+i[2]+"</td><td>"+price+"</td></tr>");
        }
%>
        </table>
        <table class="table_total">
        <tr>
            <th>TOTAL</th>
            <th><% out.println(total_compra); %></th>
        </tr>
        </table>
    </div>         
    </div>
    </body>
    <script type="text/javascript" src="js/script.js"></script>
</html>


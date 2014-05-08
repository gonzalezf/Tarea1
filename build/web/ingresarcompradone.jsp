<%-- 
    Document   : ingresarcompradone.jsp
    Created on : May 6, 2014, 2:54:13 PM
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
    String id_compra = null;
    try
    {
        id_compra = request.getParameter("compra");
    }
    catch(Exception e)
    {
        response.sendRedirect("index.jsp");
        return;
    }
    
    if(id_compra == null)
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
    String fecha = "Unknown", hora = "Unknown", total_compra = "???";
    try
    {
        String sql= "SELECT MONTO_TOTAL, FECHA, HORA FROM COMPRA WHERE ID_COMPRA = ?";
        CallableStatement cs = con.prepareCall(sql);
        cs.setString(1, id_compra);
        rs = cs.executeQuery();
        if(rs.next())
        {
            total_compra = rs.getString(1);
            fecha = rs.getString(2);
            hora = rs.getString(3);
        }
        sql = "SELECT v.NOMBRE, v.DESCRIPCION, d.CANTIDAD, d.PRECIO, v.NOMBRE FROM DETALLE_COMPRA d, (SELECT p.ID_PRODUCTO, p.NOMBRE, p.DESCRIPCION FROM PRODUCTO p) v WHERE d.ID_COMPRA = ? AND d.ID_PRODUCTO = v.ID_PRODUCTO";
        cs = con.prepareCall(sql);
        cs.setString(1, id_compra);
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
        <h1>Compra Ingresada con exito</h1>
        <h2>Detalles de la compra:</h2>
        <br>
        <p> ID de compra: <% out.println(id_compra); %></p>
        <p>Fecha: <% out.println(fecha); %></p>
        <p>Hora: <% out.println(hora); %></p>
        <div class="tablewrapper">
        <table>
        <tr>
            <th id="producto">Producto</th>
            <th id="descripcion">Descripcion del producto</th>
            <th id="precio">Cantidad</th>
            <th>Precio</th>
        </tr>
<%
        for(String[] i: items)
        {
            out.println("<tr><td>"+i[0]+"</td><td>"+i[1]+"</td><td>"+i[2]+"</td><td>"+i[3]+"</td></tr>");
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

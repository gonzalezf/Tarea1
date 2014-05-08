<%-- 
    Document   : ingresarcompra
    Created on : 20-04-2014, 11:07:41 PM
    Author     : Felipe Gonzalez
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

    try
    {
        Class.forName(classfor);
        con=DriverManager.getConnection(url, usuario, clave);

    }
    catch (ClassNotFoundException e)
    {
        System.out.println(e.toString());
    }
    ArrayList<String[]> items = new ArrayList<String[]>();
    ArrayList<String[]> clientes = new ArrayList<String[]>();
    try
    {
        String sql= "SELECT id_producto, nombre FROM producto";
        pr = con.prepareStatement(sql);
        rs = pr.executeQuery();
        while(rs.next())
        {
            String[] info = {"", ""};
            info[0] = rs.getString(1);
            info[1] = rs.getString(2);
            items.add(info);
        }
        
        sql= "SELECT RUT, NOMBE FROM CLIENTE";
        pr = con.prepareStatement(sql);
        rs = pr.executeQuery();
        while(rs.next())
        {
            String[] info = {"", ""};
            info[0] = rs.getString(1);
            info[1] = rs.getString(2);
            clientes.add(info);
        }
    }
    catch(Exception e)
    {
    }
    String selector = "";
    String selector_clientes = "";
    for(String[] item : items)
    {
        selector+="<option value=\\\""+item[0]+"\\\">"+item[1]+"</option>";
    }
    for(String[] client : clientes)
    {
        selector_clientes += "<option value=\\\""+client[0]+"\\\">"+client[1]+"</option>";
    }
%>
<script>
    <% out.print("var select_items = \""+selector+"\";"); %>
    <% out.print("var lista_clientes = \""+selector_clientes+"\";"); %>
</script>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingresar Venta</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
    </head>
    <body>
    <%@include file="sidebar.jsp" %>
    <div class="pagecontent">
        <form id = "submit_form_venta" action="ingresarventa" method="post" >
            <h1>Ingrese datos de la venta:</h1>
            <p>Seleccione un cliente:</p>
            <select id="form_1" class="input" name="client">
                <script>
                    document.write(lista_clientes);
                </script>
            </select>
            <br><br>
            <div id="InputAddStart">
            <div id="left">
            <p style="text-align:center;">Producto</p>
            1
            <select id="form_2" class="input" name="id_producto_1">
                <script>
                    document.write(select_items);
                </script>
            </select>
            </div>
            
            <div id="right">
            <p style="text-align:center;">Cantidad</p>
            <input id="form_3" class="input" type="text" value="" name="cantidad_1">
            <input id="plus_button_venta" class="submit" type="submit" value="+" name="void">
            </div>
            <div class="clearfix"></div>
            </div>
            <div id="submit_button_wrapper">
            <input id="submit_button_venta" class="submit" type="submit" value="Ingresar Venta" name="ingresarventa">
            </div>
            <div id="form_reply_message"></div>
        </form>
    </div>
    <div class = "clearfix"></div>
    </body>
    <script src="js/script.js"> </script>
</html>

<%@page import="modelo.registro"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar producto</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
    </head>
    <body>
    <%@include file="sidebar.jsp" %>
    <div class="pagecontent">
        <h1>Editar Producto</h1>

                <form id="submit_form" action="editarproducto" method="post" >

                 <% String id_producto=request.getParameter("id_producto");
                   // out.print(id_producto);
                    String classfor="oracle.jdbc.driver.OracleDriver";
                    String url="jdbc:oracle:thin:@localhost:1521:XE";
                    String usuario="admin";
                    String clave="pelife18";

                    Connection con=null;
                    PreparedStatement pr=null;
                    Statement consulta = null;
                    ResultSet rs=null;
                    

                    ArrayList<String> str=new ArrayList<String>();
                    try
                    {
                        
                        Class.forName(classfor);
                        con=DriverManager.getConnection(url, usuario, clave);
                        try
                        {
                            String sql = "select nombre,descripcion, categoria,stock, precio from producto where id_producto = ?";

                            pr = con.prepareStatement(sql);
                            pr.setString(1, id_producto);


                            rs = pr.executeQuery();
                            //aqui debe ir el if!
                            if(rs.next())
                            {

                                str.add(rs.getString(1)); //nombre
                                str.add(rs.getString(2)); //descripcion
                                str.add(rs.getString(3)); //categoria
                                str.add(rs.getString(4)); //stock
                                str.add(rs.getString(5)); //precio

                            }
                            else
                            {
                                str.add("rs.ERROR - Codigo 2");
                            }
                        }
                        finally
                        {
                            pr.close();
                            rs.close();
                        }
                    }//fin del try
                    catch(Exception e)
                    {
                        System.out.println(e.getMessage());
                        str.add("ERROR!");
                    } //fin de catch
                    finally
                    {
                        con.close();
                    }

                %>

                <div id="left">
                <p>Codigo de producto:</p>
            <!--    <p><input type="text" value="" name="id_producto"></p>-->
                <% out.print("<input id=\"form_1\" class=\"input\" type='text' value="+id_producto+" name='id_producto' disabled>");   %>
                </div>
                <div id="right">
                <p>Nombre</p>
                <!--<p><input type="text" value="" name="nombre"></p>-->
                <% out.print("<input id=\"form_2\" class=\"input\" type='text' value=\""+str.get(0)+"\" name='nombre' disabled>");   %>
                </div>
                <div class="clearfix"></div>
                <div id="left">
                <p>Descripción:</p>
                <!--<p><input type="text" value="" name="descripcion"></p>-->
                <% out.print("<input id=\"form_3\"class=\"input\" type='text' value=\""+str.get(1).trim()+"\" name='descripcion'>");   %>
                </div>
                <div id="right">
                <p>Categoría</p>
                <!--<p><input type="text" value="" name="categoria"></p>-->
                <% out.print("<input id=\"form_4\"class=\"input\" type='text' value=\""+str.get(2)+"\" name='categoria'>");   %>
                </div>
                <div class="clearfix"></div>
                <div id="left">
                <p>Stock</p>
                <!--<p><input type="text" value="" name="stock"></p>-->
                <% out.print("<input id=\"form_5\" class=\"input\" type='text' value=\""+str.get(3)+"\" name='stock' disabled>");   %>
                </div>
                <div id="right">
                <p>Precio</p>
                <!--<p><input type="text" value="" name="precio"></p>-->
                <% out.print("<input id=\"form_6\" class=\"input\" type='text' value=\""+str.get(4)+"\" name='precio'>");   %>
                </div>
                <div class="clearfix"></div>
                <input id="submit_button_edit" class="submit" type="submit" value="Guardar Cambios" name="editarproducto">
                <input id="edit_volver" class="submit" type="submit" value="Volver">
                <div id = "form_reply_message"></div>

                </form>


    </div>
    </body>
    <script type="text/javascript" src="js/script.js"></script>
</html>

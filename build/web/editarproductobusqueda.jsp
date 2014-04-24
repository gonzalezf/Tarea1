<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Editar Producto</h1>
                <form action="editarproducto" method="post" >

                 <% String clavebusqueda=request.getParameter("clavebusqueda");
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
                    try{
                    Class.forName(classfor);
                    con=DriverManager.getConnection(url, usuario, clave);
                    String sql = "select id_producto,descripcion, categoria,stock, precio from producto where nombre = ?";

                    pr = con.prepareStatement(sql);
                    pr.setString(1, clavebusqueda);


                    rs = pr.executeQuery();
                    //aqui debe ir el if!
                    if(rs.next()){

                        str.add(rs.getString(1)); //id_producto
                        str.add(rs.getString(2)); //descripcion
                        str.add(rs.getString(3)); //categoria
                        str.add(rs.getString(4)); //stock
                        str.add(rs.getString(5)); //precio

                    }
                    else{
                        str.add("rs.ERROR - Codigo 2");

                    }
                }//fin del try
                catch(Exception e){
                    System.out.println(e.getMessage());
                    str.add("ERROR!");


                } //fin de catch

                %>


                <h2> Agregar Producto a la Base de Datos</h2>

                <p>Codigo de producto:</p>
            <!--    <p><input type="text" value="" name="id_producto"></p>-->
                <% out.print("<p><input type='text' value="+rs.getString(1)+" name='id_producto'></p>");   %>

                <p>Ingrese Nombre</p>
                <!--<p><input type="text" value="" name="nombre"></p>-->
                <% out.print("<p><input type='text' value="+clavebusqueda+" name='nombre'></p>");   %>
                <p>Ingrese Descripción:</p>
                <!--<p><input type="text" value="" name="descripcion"></p>-->
                <% out.print("<p><input type='text' value="+rs.getString(2)+" name='descripcion'></p>");   %>
                <p>Ingrese Categoría</p>
                <!--<p><input type="text" value="" name="categoria"></p>-->
                <% out.print("<p><input type='text' value="+rs.getString(3)+" name='categoria'></p>");   %>
                <p>Ingrese Stock</p>
                <!--<p><input type="text" value="" name="stock"></p>-->
                <% out.print("<p><input type='text' value="+rs.getString(4)+" name='stock'></p>");   %>
                <p>Ingrese Precio</p>
                <!--<p><input type="text" value="" name="precio"></p>-->
                <% out.print("<p><input type='text' value="+rs.getString(5)+" name='precio'></p>");   %>

                <p> <input type="submit" value="Guardar Cambios" name="editarproducto"></p>


                </form>


    </body>
</html>

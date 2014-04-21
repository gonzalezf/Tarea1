<%-- 
    Document   : administrarproductos
    Created on : 20-04-2014, 06:14:58 PM
    Author     : Felipe Gonzalez
--%>

<%@ page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrar Productos</title>
    </head>
    <body>
        <h1>Administrar Productos</h1>

          <a href="agregarproducto.jsp">Agregar Producto</a>
        <a href="">Editar Producto</a>

        <TABLE>
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

            try{
            Class.forName(classfor);

            con=DriverManager.getConnection(url, usuario, clave);

            } catch (ClassNotFoundException e) {
                 System.out.println(e.toString());
              }
             try{
            String sql= "select id_producto, nombre, stock from producto";
            pr = con.prepareStatement(sql);


            rs = pr.executeQuery();
            //aqui debe ir el if!


            while(rs.next()){
                    out.println("<TR>");
                    out.println("<TD>"+rs.getString(1)+"</TD>");
                    out.println("<TD>"+rs.getString(2)+"</TD>");
                    out.println("<TD>"+rs.getString(3)+"</TD>");

                    out.println("</TR>");



            }
            rs.close();
            pr.close();
            con.close();

            } //fin del try
            catch (SQLException e) {
              }



            %>

        </TABLE>

        <!-- Diseñar vista -->


        
    </body>
</html>

<%-- 
    Document   : menuAdmin
    Created on : 16-04-2014, 03:07:16 PM
    Author     : Felipe Gonzalez

OJO!!! Este codigo sirve para añadir informacion a una tabla con oracle conn = javadb.ConnectDb();

        try{
            String sql = "insert into addbook (id, title, isbn, author) values(?,?,?,?)";
            pst = (OraclePreparedStatement) conn.prepareStatement(sql);

            pst.setString(1,'NULL');
            pst.setString(2, title.getText());
            pst.setString(3, isbn.getText());
            pst.setString(4, author.getText());
            rs = (OracleResultSet) pst.executeUpdate(sql);

        }catch(SQLException | HeadlessException e){
        JOptionPane.showMessageDialog(null, e);
        }
    }
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrador</title>
    </head>
    <body>
        <h1>Bievenido <--insertarnombre --></h1>
        <div class="optionsAdmin">
        <a href="ingresarVendedor.jsp">Ingresar vendedor</a>
        <a href="ingresarCliente.jsp">Ingresar Cliente </a>
        <a href="administrarProductos.jsp">Administrar Productos</a>
        <a href="ingresarCompra.jsp">Ingresar Compra </a>
        <a href="ingresar Venta.jsp">Ingresar Venta </a>
        <a href="ventasCliente.jsp">Ver Ventas A Cliente</a>
        
        </div>

    </body>
</html>

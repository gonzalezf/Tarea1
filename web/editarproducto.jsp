<%-- 
    Document   : editarproducto
    Created on : 20-04-2014, 09:21:43 PM
    Author     : Felipe Gonzalez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Producto</title>
    </head>
    <body>
        <h1>Editar Producto</h1>

                <form action="editarproducto" method="post" >


                <h2> Agregar Producto a la Base de Datos</h2>
                <p>Codigo de producto:</p>
                <p><input type="text" value="" name="id_producto"></p>
                <p>Ingrese Nombre</p>
                <p><input type="text" value="" name="nombre"></p>
                <p>Ingrese Descripción:</p>
                <p><input type="text" value="" name="descripcion"></p>
                <p>Ingrese Categoría</p>
                <p><input type="text" value="" name="categoria"></p>
                <p>Ingrese Stock</p>
                <p><input type="text" value="" name="stock"></p>
                <p>Ingrese Precio</p>
                <p><input type="text" value="" name="precio"></p>

                <p> <input type="submit" value="Guardar Cambios" name="editarproducto"></p>


                </form>



    </body>
</html>

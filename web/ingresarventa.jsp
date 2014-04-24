<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <script src="jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingresar Venta</title>
    </head>
    <body>
        <h1>Ingresar Venta</h1>

          <form action="ingresarventa" method="post" >


                    <h2>Ingresar Venta a la base de Datos</h2>
                    <p>Escoja cliente:</p>
                    <p><input type="text" value="" name="cliente"></p>
                    <p>Ingrese Producto</p>
                    <p><input type="text" value="" name="producto"></p>
                    <p>Ingrese Cantidad</p>
                    <p><input type="text" value="" name="cantidad"></p>
                    <p> <input type="submit" value="Finalizar" name="ingresarventa"></p>
                    </form>
                    <h2><a href="#" id="addScnt">Add Another Input Box</a></h2>

                    <div id="p_scents">
                        <p>
                            <label for="p_scnts"><input type="text" id="p_scnt" size="20" name="p_scnt" value="" placeholder="Input Value" /></label>
                        </p>
                    </div>

                        $(function() {
                        var scntDiv = $('#p_scents');
                        var i = $('#p_scents p').size() + 1;

                        $('#addScnt').live('click', function() {
                                $('<p><label for="p_scnts"><input type="text" id="p_scnt" size="20" name="p_scnt_' + i +'" value="" placeholder="Input Value" /></label> <a href="#" id="remScnt">Remove</a></p>').appendTo(scntDiv);
                                i++;
                                return false;
                        });

                        $('#remScnt').live('click', function() {
                                if( i > 2 ) {
                                        $(this).parents('p').remove();
                                        i--;
                                }
                                return false;
                        });
                });

  
 
    </body>
</html>

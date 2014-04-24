<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <script src="./libs/jquery/1.10.1/jquery.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script src="http://code.jquery.com/jquery-1.11.0.js"></script>



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
                    <h2> probando! </h2>
                    $(document).ready(function() {

                    var MaxInputs       = 8; //maximum input boxes allowed
                    var InputsWrapper   = $("#InputsWrapper"); //Input boxes wrapper ID
                    var AddButton       = $("#AddMoreFileBox"); //Add button ID

                    var x = InputsWrapper.length; //initlal text box count
                    var FieldCount=1; //to keep track of text box added

                    $(AddButton).click(function (e)  //on add input button click
                    {
                            if(x <= MaxInputs) //max input box allowed
                            {
                                FieldCount++; //text box added increment
                                //add input box
                     <!--           $(InputsWrapper).append('<div><input type="text" name="mytext[]" id="field_'+FieldCount+'" value="Text '+FieldCount +'"/><a href="#" class="removeclass">&times;</a></div>');
                          -->      x++; //text box increment
                            }
                    return false;
                    });

                    $("body").on("click",".removeclass", function(e){ //user click on remove text
                            if( x > 1 ) {
                                    $(this).parent('div').remove(); //remove text box
                                    x--; //decrement textbox
                            }
                    return false;
                    })

                    });

  
 
    </body>
</html>

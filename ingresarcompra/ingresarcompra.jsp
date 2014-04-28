<%-- 
    Document   : ingresarcompra
    Created on : 20-04-2014, 11:07:41 PM
    Author     : Felipe Gonzalez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
    //Esto verifica que el usuario haya iniciado sesión
    //y que además tenga los permisos necesarios.
    String logged_in = null;
    try{
        logged_in = (String)session.getAttribute("LoggedIn");
    }
    catch(Exception e)
    {
        response.setStatus( 403 );
        return;
    }
    if(logged_in == null)
    {
        response.setStatus( 403 );
        return;
    }
    if(logged_in.equals("no"))
    {
        response.setStatus( 403 );
        return;
    }
    if(!session.getAttribute("UserLevel").toString().equals("Administrador"))
    {
        response.setStatus( 403 );
        return;
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>

        <title>Mis Ventas</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>
    <body>
    <%@include file="sidebar.jsp" %>
    <div class="pagecontent">
        <form id = "submit_form_compra" action="ingresarcompra" method="post" >
            <h1>Ingresar Compra a la base de Datos</h1>
            <!--<div id="left">
            <p>Producto</p>
            1
            <input class="input" type="text" value="" name="id_producto">
            </div>
            
            <div id="center">
            <p>Ingrese cantidad</p>
            <input class="input" type="text" value="" name="cantidad">
            </div>
            
            <div id="right">
            <p>Ingrese precio</p>
            <input class="input" type="text" value="" name="precio">
            </div>
            <div class="clearfix"></div>-->
         <!--   <div id="form_reply_message"></div>-->

        <div id="AddMoreFileBox"> Ingresar  (Boton)!</div>
        <div id="InputsWrapper">



        </div>






         <script>


            $(document).ready(function() {

            var MaxInputs       = 10; //maximum input boxes allowed
            var InputsWrapper   = $("#InputsWrapper"); //Input boxes wrapper ID
            var AddButton       = $("#AddMoreFileBox"); //Add button ID

            var x = InputsWrapper.length; //initlal text box count
            //var FieldCount=1; //to keep track of text box added
            var FieldCount = 0;
            $(AddButton).click(function (e)  //on add input button click
            {
                    if(x <= MaxInputs) //max input box allowed
                    {
                        FieldCount++; //text box added increment
                        //add input box
//                        $(InputsWrapper).append('<div><p><input type="text" value="" name="cliente'+FieldCount+'" id="cliente_'+FieldCount+'" value="Ingrese Cliente"><a href="#" class="removeclass">&times;</a></p</div>');

                    $(InputsWrapper).append('<p><input type="text" name="id_compra'+FieldCount+'"  value="id_compra'+FieldCount+'"/></p><p><input type="text" name="cantidad'+FieldCount+'" value="Ingrese cantidad"/></p><p><input type="text" name="precio'+FieldCount+'"  value="Ingrese precio"/> </p> <a href="#" class="removeclass">&times;</a></p></div>');
                        x++; //text box increment
                         document.getElementById('contador').value=FieldCount ;
                    }

            return false;

            });
                        (InputsWrapper).append('<p><input type="text" name="contador" id="contador" </p>');

                       
                            

            $("body").on("click",".removeclass", function(e){ //user click on remove text
                    if( x > 1 ) {
                            $(this).parent('div').remove(); //remove text box
                            x--; //decrement textbox
                    }
            return false;
            })

               });


        </script>
        <script>
                (InputsWrapper).append('<p><input type="text" name="contador" id="'+FieldCount+'" value="'+FieldCount+'"</p>');


        </script>
            <input id="submit_button" class="submit" type="submit" value="Ingresar Compra" name="ingresarcompra">

       





        </form>
    </div>
    </body>
</html>

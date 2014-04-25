<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
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
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
    </head>
    <body>
        <h1>Ingresar Venta</h1>
        
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
                </form>
    -->
     
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
            String sql= "select nombre from cliente";
            pr = con.prepareStatement(sql);


            rs = pr.executeQuery();
            //aqui debe ir el if!
            %>


  
      
            <%

           out.println("<select name='escogercliente'>");
            while(rs.next()){
                  out.println("<option id='cliente'>"+rs.getString(1)+"</option>");
            }
           out.println("</select>"); %>

        <div id="InputsWrapper">

              <div id="AddMoreFileBox"> Ingresar Cliente (Boton)!</div>

        </div>
      <form action="ingresarventa" method="post" >
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

                    $(InputsWrapper).append('<div class="removeclass"><p><input type="text" name="cliente'+FieldCount+'" id="cliente_'+FieldCount+'" value="Ingrese Cliente"/><a href="#" class="removeclass">&times;</a></p><p><input type="text" name="producto'+FieldCount+'" id="producto_'+FieldCount+'" value="Ingrese Producto"/></p><p><input type="text" name="cantidad'+FieldCount+'" id="cantidad_'+FieldCount+'" value="Ingrese Cantidad"/></p></div>');
                        x++; //text box increment
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


        </script>
      
           <p> <input type="submit" value="Finalizar" name="ingresarventa"></p>
    </form>
     <%
            rs.close();
            pr.close();
            con.close();

            } //fin del try
            catch (SQLException e) {
              }

        %>



    </body>
</html>
>>>>>>> 2f281c24a24de2551b8edad5abcebe9c134ffbb1

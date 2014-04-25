<%-- 
    Document   : probando
    Created on : 24-04-2014, 05:22:04 PM
    Author     : Felipe Gonzalez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
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
                                $(InputsWrapper).append('<div><input type="text" name="mytext[]" id="field_'+FieldCount+'" value="Text '+FieldCount +'"/><a href="#" class="removeclass">&times;</a></div>');
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
    </body>
</html>
<<<<<<< HEAD
=======

        <h2><a href="#" id="addScnt">Add Another Input Box</a></h2>

                    <div id="p_scents">
                        <p>
                            <label for="p_scnts"><input type="text" id="p_scnt" size="20" name="p_scnt" value="" placeholder="Input Value" /></label>
                        </p>
                    </div>
         <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js">
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
  <script>

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
                                $(InputsWrapper).append('<div><input type="text" name="mytext[]" id="field_'+FieldCount+'" value="Text '+FieldCount +'"/><a href="#" class="removeclass">&times;</a></div>');
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
>>>>>>> 2f281c24a24de2551b8edad5abcebe9c134ffbb1

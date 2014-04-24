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

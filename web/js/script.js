/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//Todo esto se ejecuta al principio de la pagina.
var dynamic_input_count = 1;
$(document).ready(function() 
{
    //Fade en cuanto carga la pagina, usado por el logo de la vaca
    $("#fademeslowly").fadeOut(3000);
    
    //Esconder el loginbox y el error
    $("div.loginbox").hide();
    $("div.loginboxerror").hide();
    $("#body_fade").hide().fadeIn(600);
    $("#form_reply_message").hide();
    
    //Preguntar la contraseña sin necesidad de refrescar
    $("#logout").click(function(e)
    {
        $("#logout").prop('disabled', true);
        $("#sidebar").fadeOut(600);
        
        setTimeout(function(){
            window.location.replace("logout.jsp");
        }, 600);
        e.preventDefault();
    });
    setTimeout(function()
    {
       $("div.loginbox").fadeIn(750);
    }, 600);
    
    //Para las formas en general
    $(".input").focus(function(e){
        $(this).css('background-color', '#ffffff');
    });
    
    $("#submit_button_compra").click(function(e)
    {
        var resetAllFormElements = function()
        {
            for(var i = 1; i <= $(".input").length; i++)
            {
                $("#form_"+i.toString()).css('background-color', '#ffffff');
            }
        };
        var resetAllFormElementsValue = function()
        {
            for(var i = 1; i <= $(".input").length; i++)
            {
                $("#form_"+i.toString()).val('');
            }
        };
        var checkResponse = function(response)
        {
            var result = response.toString();  
            alert(result);
            if(result.indexOf(':') !== -1)
            {
                var arr = result.split(':', 3);
                if(arr[0].toString() === "SUCCESS")
                {
                    resetAllFormElements();
                    resetAllFormElementsValue();
                    $("#form_reply_message").css('color', 'green');
                    $("#form_reply_message").html(arr[1]);
                    $("#form_reply_message").hide().fadeIn(500);
                    setTimeout(function(){
                        $("#form_reply_message").fadeOut(5000);
                    }, 3000);
                    window.location.replace("ingresarcompradone.jsp?compra="+arr[2]);
                }
                else if(arr[0].toString() === "ERROR")
                {
                    resetAllFormElements();
                    $("#form_reply_message").css('color', 'red');
                    $("#form_reply_message").html(arr[1]);
                    $("#form_reply_message").hide().fadeIn(500);
                    $(arr[2].toString()).css('background-color', 'rgba(255, 13, 0, 0.4)');
                }
            }
            else
            {
                resetAllFormElements();
                $("#form_reply_message").css('color', 'red');
                $("#form_reply_message").html("Ocurrió un error cŕitico en el servidor");
                $("#form_reply_message").hide().fadeIn(500);
            }
                
        };
        $("#submit_button").prop('disabled', true);
        $("#form_reply_message").hide();
        var frm = "total="+dynamic_input_count+"&"+$('#submit_form_compra').serialize();
        $.ajax
        ({
            url: $("#submit_button_compra").attr("name"),
            type: "post",
            data: frm,
            success: function(response)
            {
                checkResponse(response);
            },
            error: function ()
            {
               resetAllFormElements();
                $("#form_reply_message").css('color', 'red');
                $("#form_reply_message").html("Ocurrió un error cŕitico en el servidor");
                $("#form_reply_message").hide().fadeIn(500);
            },
            complete: function()
            {
               $("#submit_button").prop('disabled', false);
           }
        });
        e.preventDefault();
    });
    
    $("#submit_button").click(function(e)
    {
        var resetAllFormElements = function()
        {
            for(var i = 1; i <= $(".input").length; i++)
            {
                $("#form_"+i.toString()).css('background-color', '#ffffff');
            }
        };
        var resetAllFormElementsValue = function()
        {
            for(var i = 1; i <= $(".input").length; i++)
            {
                $("#form_"+i.toString()).val('');
            }
        };
        var checkResponse = function(response)
        {
            var result = response.toString();  
            if(result.indexOf(':') !== -1)
            {
                var arr = result.split(':', 3);
                if(arr[0].toString() === "SUCCESS")
                {
                    resetAllFormElements();
                    resetAllFormElementsValue();
                    $("#form_reply_message").css('color', 'green');
                    $("#form_reply_message").html(arr[1]);
                    $("#form_reply_message").hide().fadeIn(500);
                    setTimeout(function(){
                        $("#form_reply_message").fadeOut(5000);
                    }, 3000);
                }
                else if(arr[0].toString() === "ERROR")
                {
                    resetAllFormElements();
                    $("#form_reply_message").css('color', 'red');
                    $("#form_reply_message").html(arr[1]);
                    $("#form_reply_message").hide().fadeIn(500);
                    $(arr[2].toString()).css('background-color', 'rgba(255, 13, 0, 0.4)');
                }
            }
            else
            {
                resetAllFormElements();
                $("#form_reply_message").css('color', 'red');
                $("#form_reply_message").html("Ocurrió un error cŕitico en el servidor");
                $("#form_reply_message").hide().fadeIn(500);
            }
                
        };
        $("#submit_button").prop('disabled', true);
        $("#form_reply_message").hide();
        var frm = $('#submit_form').serialize();
        $.ajax
        ({
            url: $("#submit_button").attr("name"),
            type: "post",
            data: frm,
            success: function(response)
            {
                checkResponse(response);
            },
            error: function ()
            {
               resetAllFormElements();
                $("#form_reply_message").css('color', 'red');
                $("#form_reply_message").html("Ocurrió un error cŕitico en el servidor");
                $("#form_reply_message").hide().fadeIn(500);
            },
            complete: function()
            {
               $("#submit_button").prop('disabled', false);
           }
        });
        e.preventDefault();
    });
    $("#login_button").click(function(e)
    {
        var onCriticalError = function(response)
        {
            $("div.loginboxerror").html("Error en el servidor");
            $("div.loginboxerror").hide().fadeIn(600);
        };
        var checkResponse = function(response)
        {
            if(response.toString() === "SUCCESS")
            {
                $("#login_button").prop('disabled', true);
                $("body").fadeOut(800);
                setTimeout(function(){
                    window.location.replace("home.jsp");
                }, 900);
            }
            else
            {
                $("div.loginboxerror").hide().fadeIn(500);
            }
        };
        $("#login_button").prop('disabled', true);
        $("div.loginboxerror").hide();
        var frm = $('#loginform').serialize();
        $.ajax
        ({
            url: "login",
            type: "post",
            data: frm,
            success: function(response)
            {
                checkResponse(response);
            },
            error: function (response)
            {
               onCriticalError(response);
            },
            complete: function()
            {
               $("#login_button").prop('disabled', false);
           }
        });
        event.preventDefault();
    });
});


$(document).on('click', '#plus_button' ,function(e)
{
    dynamic_input_count++;
    $("#plus_button").css('visibility','hidden');
    $("#plus_button").attr('id', 'plus_button_ignore');
    $("#InputAddStart").append("<div id=\"left\">"+dynamic_input_count+" <select id = \"form_"+((dynamic_input_count-1)*3+1)+"\" class=\"input\" name=\"id_producto_"+dynamic_input_count+"\">"+select_items+"</select></div><div id=\"center\"><input id = \"form_"+((dynamic_input_count-1)*3+2)+"\" class=\"input\" type=\"text\" value=\"\" name=\"cantidad_"+dynamic_input_count+"\"></div><div id=\"right\"><input id = \"form_"+((dynamic_input_count-1)*3+3)+"\" class=\"input\" type=\"text\" value=\"\" name=\"precio_"+dynamic_input_count+"\"><input id=\"plus_button\" class=\"submit\" type=\"submit\" value=\"+\" name=\"nothing\"></div><div class=\"clearfix\"></div>");
    e.preventDefault();
});

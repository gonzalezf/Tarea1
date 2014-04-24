/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//Todo esto se ejecuta al principio de la pagina.
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
    $("#login_button").click(function(e){
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
        var frm = $('#submitform').serialize();
        $.ajax
        ({
            url: "login",
            type: "post",
            data: frm,
            success: function(response)
            {
                checkResponse(response);
            },
            error: function ()
            {
               $("div.loginboxerror").hide().fadeIn(600);
            },
            complete: function()
            {
               $("#login_button").prop('disabled', false);
           }
        });
        event.preventDefault();
    });
});

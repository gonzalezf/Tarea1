/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function() 
{
    $("#fademeslowly").fadeOut(3000);
    $("div.loginbox").hide();
    $("div.loginboxerror").hide();
    $("#body_fade").hide().fadeIn(600);
    $("#logout").click(function(e){
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
     $("#login_button").click(function(e){
     var checkResponse = function(response){

         if(response.responseText === "ERROR")
         {
             $("div.loginboxerror").hide().fadeIn(500);
         }
         else
         {
             $("#login_button").prop('disabled', true);
             $("body").fadeOut(800);
             setTimeout(function(){
                 window.location.replace("home.jsp");
             }, 900);
         }
     };
     $("#login_button").prop('disabled', true);
     $("div.loginboxerror").hide();
     var frm = $('#loginform').serialize();
     $.ajax({
         url: "login",
         type: "post",
         data: frm,
         success: function(response){
             checkResponse(response);
        },
        error: function (){
            $("div.loginboxerror").hide().fadeIn(600);
        },
        complete: function(){
            $("#login_button").prop('disabled', false);
        }

        });
     event.preventDefault();
    });

});

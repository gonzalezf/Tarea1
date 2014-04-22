/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function deselect() {
    $(".pop").slideFadeToggle(function() { 
        $("#contact").removeClass("selected");
    });    
}

$(function() {
    $("#contact").live('click', function() {
        if($(this).hasClass("selected")) {
            deselect();               
        } else {
            $(this).addClass("selected");
            $(".pop").slideFadeToggle(function() { 
                $("#email").focus();
            });
        }
        return false;
    });

    $(".close").live('click', function() {
        deselect();
        return false;
    });
});

$.fn.slideFadeToggle = function(easing, callback) {
    return this.animate({ opacity: 'toggle', height: 'toggle' }, "fast", easing, callback);
}



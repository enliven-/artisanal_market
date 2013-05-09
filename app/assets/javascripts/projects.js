console.log("loading projects.js");


$(document).ready(function() {

    var count = 1;
    var user  = "Customer";

    $(".attr").draggable({
        helper: "clone"
    });


    $("img").css({ 'opacity' : 0.7 })
            .css( "zIndex", 10 );


    $("img").data({
        'originalLeft': $("img").css('left'),
        'origionalTop': $("img").css('top')
    });



    $("#canvas").dblclick(event, function() {
        
        add_new_pin(count);
        add_new_comment_box(count);
        count+=1;

    });



    $("#canvas_container").on("click", ".close", function(event) {
        var div = $(event.target).closest(".comment-box");
        var id = div.attr("id");
        var pin = $("#"+id);
        pin.remove();
        div.remove();
        count-=1;
    });

    $("#canvas_container").on("keypress", "textarea", function(event) {        
        var code = event.keyCode ? event.keyCode : event.which;
        if (code==13) {
            event.preventDefault();
            var comment_history = $(this).parent().find('.comment-history');
            var comment = $(this).val();

            if (comment.trim()!="") {
                comment_history.append(user + ": " + comment + "<br />");
            }
            $(this).val("").focus();
        }
    });

    $("#canvas_container").on("click", ".minimize", function(event) {
        minimize_obj($(this));
    });


    $("#canvas_container").on("click", ".maximize", function(event) {
        maximize_obj($(this));
    });

    
    $("#canvas_container").on("click", ".pin", function(event) {
        $(".selected-pin").removeClass("selected-pin");
        var pin = $(event.target);
        pin.addClass("selected-pin");
        pin_id = pin.attr("id");

        var commentboxes = $(".minimize");
        $.each(commentboxes, function(index, commentbox) {
            var commentbox_id = $(commentbox).closest(".comment-box").attr("id");
            if (commentbox_id == pin_id) {
                maximize_obj($(commentbox));
            } else {
                minimize_obj($(commentbox));
            }
            $("textarea").focus();
        });
    });


    $("#canvas_container").droppable({
        drop: function(event, ui) {
            console.log("droping");
            var image = clone_attr_image($(ui.helper));
            $(this).append(image);
        }
    });




// ------------------------------------------------------------------------------------------------------



    var add_new_pin = function(count) {
        
        var pin = $('<img/>', {'src': "/defaultpin.png", 'class': "pin", "id": count, "title": count, "data-toggle": "tooltip", "data-placement": "right"} );
        
        pin .css("position", "absolute")
            .css("top",  event.y)
            .css("left", event.x);
        
        pin.draggable({ 
            containment: $("#canvas_container"),
            stop: function(event, ui) {
                $(ui.helper).click();
            }
        });

        $("#canvas_container").append(pin);

    }



    var add_new_comment_box = function(count) {

        var minimize = "<span class=minimize>-</span>";
        var maximize = "<span class=maximize>+</span>";
        var close = "<span class=close id=" + count + ">X</span>";
        var textbox = $("<div class=comment-box id=" + count + "><span class=comment-box-header>Comments for Pin " + count + "</span><div class=comment-history></div><textarea class=txt></textarea>"+ minimize + close + "</div>");
        
        $(textbox).css("position", "absolute")
                  .css("bottom", 40)
                  .css("right", "60px");

        $("#canvas_container").append(textbox);

    }



    var minimize_obj = function(obj) {
        var div = obj.closest(".comment-box");
        $(div).hide();
    };


    var maximize_obj = function(obj) {
        var div = obj.closest(".comment-box");
        $(div).show();
    };




    var clone_attr_image = function(obj) {

        if (obj.hasClass("dropped-attr")) {
            return obj;
        }

        var image = obj.clone().removeClass("attr").addClass("dropped-attr");
        image.draggable({
            containment: $("#canvas_container")
        });

        return image;
    }


});
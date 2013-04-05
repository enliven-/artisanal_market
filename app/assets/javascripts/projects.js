
$(function() {
    console.log("----");

    $(".attr").draggable({
        helper: "clone"
    });

    $("img").css({ 'opacity' : 0.7 })
            .css( "zIndex", 10 );
    $("img").data({
        'originalLeft': $("img").css('left'),
        'origionalTop': $("img").css('top')
    });

    $("#reset").click(function() {
        $(".pin").remove();
        $(".dropped").remove();
        $(".txt-border").remove();
    });



    var txtboxid = 1;
    var count = 1;


    $("#canvas").dblclick(event, function() {
        event.preventDefault();
        var pin = $('<img/>', {'src': "/defaultpin.png", 'class': "pin", "id": count, "title": count, "data-toggle": "tooltip", "data-placement": "right"} );
        $("#canvas_container").append(pin);
        $(pin).css("position", "absolute")
                .css("top", event.y)
                .css("left", event.x);
        $(pin).draggable({ 
            containment: $("#canvas_container"),
            stop: function(event, ui) {
                $(ui.helper).click();
            }
        });



        var minimize = "<span class=minimize>-</span>";
        var maximize = "<span class=maximize>+</span>";
        var close = "<span class=close id=" + txtboxid + ">X</span>";
        var textbox = $("<div class=txt-border id=" + count + "><span class=comment-box-header>Comments for Pin " + count + "</span><div class=comment-history></div><textarea class=txt></textarea>"+ minimize + close + "</div>");
        

        $("#canvas_container").append(textbox);
        $(textbox).css("position", "absolute")
                  .css("bottom", 40)
                  .css("right", "60px");
        $("#canvas_container").append(textbox);

        $(textbox).click(function() {
            $("textarea").focus();
            var id = $(textbox).attr("id");
            $(".selected-pin").removeClass("selected-pin");
            $("#" + id).fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100).addClass("selected-pin");;

        });

        count+= 1;

        var commentboxes = $(".minimize");
        $.each(commentboxes, function(index, commentbox) {
            // console.log($(commentbox).closest(".txt-border"));
            var commentbox_id = $(commentbox).closest(".txt-border").attr("id");
            if (commentbox_id == count-1) {
                maximize_obj($(commentbox));
            } else {
                minimize_obj($(commentbox));
            };
        });

        $("textarea").focus();


    });

    $("#canvas_container").bind("click", ".pin", function(event) {
        $(".selected-pin").removeClass("selected-pin");

        var $pin = $(event.target);
        $pin.addClass("selected-pin");
        pin_id = $pin.attr("id");

        var commentboxes = $(".minimize");
        $.each(commentboxes, function(index, commentbox) {
            var commentbox_id = $(commentbox).closest(".txt-border").attr("id");
            if (commentbox_id == pin_id) {
                maximize_obj($(commentbox));
            } else {
                minimize_obj($(commentbox));
            }
            $("textarea").focus();
        });
    });







    $("#canvas_container").on("click", ".close", function(event) {
        var div = $(event.target).closest(".txt-border");
        var id = div.attr("id");
        div.remove();
        var pin = $("#"+id);
        $(pin).remove();
        count-=1;
    });

    var minimize_obj = function(obj) {
        var div = obj.closest(".txt-border");
        var area = obj.parent().find(".txt");
        $(area).addClass("minimized");
        $(div).hide();
    };


    var maximize_obj = function(obj) {
        var div = obj.closest(".txt-border");
        var area = obj.parent().find(".txt");
        $(area).removeClass("minimized");
        $(div).show();
    };

    $(".minimize").bind("click", function() {
        console.log("here");
        minimize_obj($(this));
    });


    $(".maximize").bind("click", function() {
        maximize_obj($(this));
    });
    


    var usr=1;
    var user = "<span class=customer>Customer: </span>";

    $("#switch").click(function() {
        console.log("toggle user");
        if (usr==1) {
            usr=2;
            user = "<span class=artisan>Artisan: </span>";
        } else {
            usr=1;
            user="<span class=customer>Customer: </span>"; 
        }
    });


    $('textarea').bind("keypress", function(event) {
        var code = event.keyCode ? event.keyCode : event.which;
        if (code==13) {
            event.preventDefault();
            console.log($(this).parent());
            var comment_history = $(this).parent().find('.comment-history');
            var comment = $(this).val();
            $(this).val("");
            $(this).focus();
            if (comment.trim()=="") {

            } else {
                comment_history.append(user + comment + "<br />");
            }

        }

    });


    $("#show-all").click(function() {
        var commentboxes = $(".minimize");
        $.each(commentboxes, function(index, obj) {
            var area = $(obj).parent().find(".txt");
            area.hide();
            maximize_obj($(obj));
        });
    });

    $("#minimize-all").click(function() {
        var commentboxes = $(".minimize");
        $.each(commentboxes, function(index, obj) {
            minimize_obj($(obj));
        });
    });

    // $("#choice1").hide();
    $("#choice2").hide();
    $("#choice3").hide();
    $("#choice4").hide();

    $("#attr-select").on("change", function() {
        var choice = this.value;

        if (choice==1) {
            $("#choice1").show();
            $("#choice2").hide();
            $("#choice3").hide();
            $("#choice4").hide();
        } else if (choice==2) {
            $("#choice1").hide();
            $("#choice2").show();
            $("#choice3").hide();
            $("#choice4").hide();
        } else if (choice==3) {
            $("#choice1").hide();
            $("#choice2").hide();
            $("#choice3").show();
            $("#choice4").hide();
        } else if (choice==4) {
            $("#choice1").hide();
            $("#choice2").hide();
            $("#choice3").hide();
            $("#choice4").show();
        }

    });

    $(".attr").dblclick(event, function() {
        console.log(this);
    });





    $( "#canvas_container" ).droppable({
        drop: function( event, ui ) {
                $(ui.helper).addClass("dropped");
                var result = $(ui.helper).hasClass("attr");
                $(ui.helper).removeClass("ui-draggable-dragging");

                var zoom = false;

                if (result) {
                    var image = $(ui.helper).clone().removeClass("attr").draggable({
                                    start: function( event, ui ) {
                                        if (zoom) { return false; }
                                        $("#selected-img").removeAttr("id");
                                        $("#selected-img").animate({ "height": "90px", "width": "90px"}, "fast");
                                    },
                                    drag:   function( event, ui ) { 

                                                $("#selected-img").removeAttr("id");
                                            }
                                })
                                    .click(function() {
                                        if ( $(this).is('.ui-draggable-dragging') ) {
                                              return;
                                        }
                                        $(this).attr("id", "selected-img");
                                    })
                                    .dblclick(function() {
                                        if ( $(this).is('.ui-draggable-dragging') ) {
                                              return;
                                        }
                                        zoom = true;
                                        $("#selected-img").animate({ "height": "250px", "width": "250px"}, "slow");
                                    })
                                    .mouseleave(
                                        function() {
                                            // $("#selected-img").removeAttr("id");
                                            $(this).animate({ "height": "90px", "width": "90px"}, "slow");
                                            zoom = false;
                                        }
                                    );

                    $(this).append($(image));
                }
        }
    });

    $("#remove-img").click(function() {
        $("#selected-img").remove();
    });

    $("#canvas_container :not(img)").click(function() {
        $("#selected-img").removeAttr("id");
    });


});
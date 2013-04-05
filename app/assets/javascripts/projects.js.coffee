# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $(".attr").draggable helper: "clone"
  
  # .draggable({ zIndex: 100 });
  # $("#canvas img").draggable({ containment: $("#canvas") });
  
  # $("img").draggable({
  #     revert: "invalid"
  # });
  $("img").css(opacity: 0.7).css "zIndex", 10
  $("img").data
    originalLeft: $("img").css("left")
    origionalTop: $("img").css("top")

  $("#reset").click ->
    
    # $("img").css({
    #     'left': $("img").data('originalLeft'),
    #     'top': $("img").data('origionalTop')
    # });
    $(".pin").remove()
    $(".dropped").remove()
    $(".txt-border").remove()

  txtboxid = 1
  
  # $("#canvas_container").dblclick(event, function () {
  #     event.preventDefault();
  #     console.log(event.x);
  #     console.log(event.y);
  #     var close = "<span class=close id=" + txtboxid + ">X</span>";
  #     var minimize = "<span class=minimize>-</span>";
  #     var maximize = "<span class=maximize>+</span>";
  
  #     var textbox = $("<div class=txt-border><textarea class=txt></textarea>"+ close + minimize + maximize + "</div>");
  #     $(textbox).css("position", "absolute")
  #               .css("top", event.y)
  #               .css("left", event.x);
  #     $("#canvas_container").append(textbox);
  #     $(".txt-border").draggable();
  # });
  count = 1
  $("#canvas").dblclick event, ->
    event.preventDefault()
    pin = $("<img/>",
      src: "defaultpin.png"
      class: "pin"
      id: count
      title: count
      "data-toggle": "tooltip"
      "data-placement": "right"
    )
    $("#canvas_container").append pin
    $(pin).css("position", "absolute").css("top", event.y).css "left", event.x
    $(pin).draggable
      containment: $("#canvas_container")
      stop: (event, ui) ->
        
        # $(".selected-pin").removeClass("selected-pin");
        # $(ui.helper).addClass("selected-pin");
        $(ui.helper).click()

    
    # <a href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Tooltip on top">Tooltip on top</a>
    
    # var close = "<span class=close id=" + txtboxid + ">X</span>";
    minimize = "<span class=minimize>-</span>"
    maximize = "<span class=maximize>+</span>"
    close = "<span class=close id=" + txtboxid + ">X</span>"
    textbox = $("<div class=txt-border id=" + count + "><span class=comment-box-header>Comments for Pin " + count + "</span><div class=comment-history></div><textarea class=txt></textarea>" + minimize + close + "</div>")
    $("#canvas_container").append textbox
    $(textbox).css("position", "absolute").css("bottom", 40).css "right", "60px"
    $("#canvas_container").append textbox
    $(textbox).click ->
      $("textarea").focus()
      id = $(textbox).attr("id")
      $(".selected-pin").removeClass "selected-pin"
      $("#" + id).fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100).addClass "selected-pin"

    count += 1
    commentboxes = $(".minimize")
    $.each commentboxes, (index, commentbox) ->
      
      # console.log($(commentbox).closest(".txt-border"));
      commentbox_id = $(commentbox).closest(".txt-border").attr("id")
      if commentbox_id is count - 1
        maximize_obj $(commentbox)
      else
        minimize_obj $(commentbox)

    $("textarea").focus()

  $(".pin").bind "click", ->
    
    # console.log(this);
    $(".selected-pin").removeClass "selected-pin"
    $(this).addClass "selected-pin"
    pin_id = $(this).attr("id")
    
    # console.log($(".txt-border #"+id));
    # var linked = $(".txt-border #"+id);
    commentboxes = $(".minimize")
    $.each commentboxes, (index, commentbox) ->
      
      # console.log($(commentbox).closest(".txt-border"));
      commentbox_id = $(commentbox).closest(".txt-border").attr("id")
      if commentbox_id is pin_id
        maximize_obj $(commentbox)
      else
        minimize_obj $(commentbox)
      $("textarea").focus()


  $(".close").bind "click", ->
    div = $(this).closest(".txt-border")
    id = div.attr("id")
    console.log id
    div.remove()
    pin = $("#" + id)
    console.log pin
    $(pin).remove()
    count -= 1

  minimize_obj = (obj) ->
    
    # console.log(obj);
    div = obj.closest(".txt-border")
    area = obj.parent().find(".txt")
    
    # console.log(area);
    # $(div).animate({height: "15px", width: "255px"}, "500");
    $(area).addClass "minimized"
    $(div).hide()

  maximize_obj = (obj) ->
    
    # console.log(obj);
    div = obj.closest(".txt-border")
    area = obj.parent().find(".txt")
    
    # console.log(area);
    # $(div).animate({height: "60px"}, "500");
    $(area).removeClass "minimized"
    $(div).show()

  $(".minimize").bind "click", ->
    console.log "here"
    
    # var div = $(this).closest(".txt-border");
    # var area = $(this).parent().find(".txt");
    
    # console.log(area);
    # $(div).animate({height: "15px"}, "500");
    # $(area).addClass("minimized");
    minimize_obj $(this)

  $(".maximize").bind "click", ->
    
    # console.log("here");
    # var div = $(this).closest(".txt-border");
    # var area = $(this).parent().find(".txt");
    
    # console.log(area);
    # $(div).animate({height: "60px"}, "500");
    # $(area).removeClass("minimized");
    maximize_obj $(this)

  
  # $('#canvas_container').dropPin({
  #     fixedHeight:495,
  #     fixedWidth:700
  # });
  # $(function() {
  #     $('#canvas').sketch({defaultColor: "#ff0"});
  # });
  usr = 1
  user = "<span class=customer>Customer: </span>"
  $("#switch").click ->
    console.log "toggle user"
    if usr is 1
      usr = 2
      user = "<span class=artisan>Artisan: </span>"
    else
      usr = 1
      user = "<span class=customer>Customer: </span>"

  $("textarea").bind "keypress", (event) ->
    code = (if event.keyCode then event.keyCode else event.which)
    if code is 13
      event.preventDefault()
      console.log $(this).parent()
      comment_history = $(this).parent().find(".comment-history")
      comment = $(this).val()
      $(this).val ""
      $(this).focus()
      comment_history.append user + comment + "<br />"  unless comment.trim() is ""

  $("#show-all").click ->
    commentboxes = $(".minimize")
    $.each commentboxes, (index, obj) ->
      area = $(obj).parent().find(".txt")
      area.hide()
      maximize_obj $(obj)


  $("#minimize-all").click ->
    commentboxes = $(".minimize")
    $.each commentboxes, (index, obj) ->
      minimize_obj $(obj)


  
  # $("#choice1").hide();
  $("#choice2").hide()
  $("#choice3").hide()
  $("#choice4").hide()
  $("#attr-select").on "change", ->
    choice = @value
    if choice is 1
      $("#choice1").show()
      $("#choice2").hide()
      $("#choice3").hide()
      $("#choice4").hide()
    else if choice is 2
      $("#choice1").hide()
      $("#choice2").show()
      $("#choice3").hide()
      $("#choice4").hide()
    else if choice is 3
      $("#choice1").hide()
      $("#choice2").hide()
      $("#choice3").show()
      $("#choice4").hide()
    else if choice is 4
      $("#choice1").hide()
      $("#choice2").hide()
      $("#choice3").hide()
      $("#choice4").show()

  $(".attr").dblclick event, ->
    console.log this

  $("#canvas_container").droppable drop: (event, ui) ->
    $(ui.helper).addClass "dropped"
    result = $(ui.helper).hasClass("attr")
    $(ui.helper).removeClass "ui-draggable-dragging"
    zoom = false
    if result
      image = $(ui.helper).clone().removeClass("attr").draggable(
        start: (event, ui) ->
          return false  if zoom
          $("#selected-img").removeAttr "id"
          $("#selected-img").animate
            height: "90px"
            width: "90px"
          , "fast"

        drag: (event, ui) ->
          $("#selected-img").removeAttr "id"
      ).click(->
        return  if $(this).is(".ui-draggable-dragging")
        $(this).attr "id", "selected-img"
      ).dblclick(->
        return  if $(this).is(".ui-draggable-dragging")
        zoom = true
        $("#selected-img").animate
          height: "250px"
          width: "250px"
        , "slow"
      ).mouseleave(->
        
        # $("#selected-img").removeAttr("id");
        $(this).animate
          height: "90px"
          width: "90px"
        , "slow"
        zoom = false
      )
      $(this).append $(image)

  $("#remove-img").click ->
    $("#selected-img").remove()

  
  # $("img").bind("mouseup", function() {
  #   if(dragCheck == false){
  #     console.log($(this));
  #     console.log("--");
  #   }
  
  # });
  
  # $("#selected-img")
  
  # .hover(
  #     function() {
  #         console.log($(this));
  #         $(this).animate({ "height": "200px", "width": "200px"}, "slow");
  #     },
  #     function() {
  #         console.log($(this));
  
  #         $(this).animate({ "height": "90px", "width": "90px"}, "slow");
  #     }
  # );
  
  # $("#zoomin").click(function () {
  #     $("#selected-img").animate({ "height": "200px", "width": "200px"}, "slow");
  # });
  
  # $("#zoomout").click(function () {
  #     $("#selected-img").animate({ "height": "90px", "width": "90px"}, "slow");
  # });
  $("#canvas_container :not(img)").click ->
    $("#selected-img").removeAttr "id"



# $("#selected-img").hover({ "height": "200px", "width": "200px"}, "slow");
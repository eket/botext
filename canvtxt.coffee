shit = ["minden nagyon", "legjobb lesz ha", "megnézném", "irány", "nincs","lesz"]
words = ["word", "word", "word", "word","dsdfs"];

for s, i in shit
    $('#verbs').append("<div class='button' onclick='init(" +i+")'>" + s + "</div>");

for w, i in words
    $('#words').append("<div class='button' onclick='init("+i+")'>" + w + "</div>");

$ ->
    $("#page").mCustomScrollbar
        scrollInertia:0
        mouseWheelPixels: '12'
        autoDraggerLength: true
        autoHideScrollbar: true
        theme:'dark-thin'
    
init = (i) ->
    $('#story').html($('#story').html()+"<br>megnyomtad a "+shit[i]+" gombot")

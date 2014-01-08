var shit = ["minden nagyon", "legjobb lesz ha", "megnézném", "irány", "nincs","lesz"]
var words = ["word", "word", "word", "word","dsdfs"];

for(var i=0; i<shit.length; i++){
    $('#verbs').append("<div class='button' onclick='init(" +i+")'>" + shit[i] + "</div>");
}

for(var i=0; i<words.length; i++){
    $('#words').append("<div class='button' onclick='init("+i+")'>" + words[i] + "</div>");
}

$(window).load(function(){
    $("#page").mCustomScrollbar({
        scrollInertia:0,
        mouseWheelPixels:"12",
        autoDraggerLength:true,
        autoHideScrollbar:true,
        theme:"dark-thin"
    });
});
    

init = function(i){
    $('#story').html($('#story').html()+"<br>megnyomtad a "+shit[i]+" gombot")
}

var shit = ["minden nagyon", "legjobb lesz ha", "megnézném", "irány", "nincs","lesz"]
var words = ["word", "word", "word", "word","dsdfs"];
var wid = window.innerWidth;
var hei = window.innerHeight;

window.addEventListener('resize', handle_resize)
function handle_resize() {
    hei = window.innerHeight;
    wid = window.innerWidth;
    $('#main').width(wid-1);
    $('#page').width(wid-12);
    $('#menu').width(wid-8);
    //$()
    $('#page').height(Math.floor(hei*0.618)-30);    
    $('#menu').height(hei-$('#page').height()-10);
    $('p').width(wid/2-5);
    $('.button').width($('p').width()-6);

}



for(var i=0; i<shit.length; i++){
    console.log(shit[i]);
    $('#verbs').append("<p><input class='button' type='button' onclick='init(" +i+")' value='" + shit[i] + "'></p>");
}

for(var i=0; i<words.length; i++){
    console.log(shit[i]);
    $('#words').html($('#words').html() + "<p><input class='button' type='button' onclick='init("+i+")' value='" + words[i] + "'></p>");
    $('.button').width(wid/2-2);
    $('p').width(wid/2-2);
}
    $('p').height()
$(window).load(function(){
   // $('#page').html("jksbskdbvksjdbvjksdbvs");
   $("#page").mCustomScrollbar({
        scrollInertia:0,
        mouseWheelPixels:"12",
        autoDraggerLength:true,
        autoHideScrollbar:true,
        theme:"dark-thin"
    }
);
handle_resize();
    

});
    




init = function(i){
    $('#story').html($('#story').html()+"<br>megnyomtad a "+shit[i]+" gombot")

}

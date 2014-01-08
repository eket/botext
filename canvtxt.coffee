shit = ["minden nagyon", "legjobb lesz ha", "megnézném", "irány", "nincs","lesz"]
words = ["word", "word", "word", "word","dsdfs"];

for s, i in shit
    $('#verbs').append "<div class='button' onmouseup='init(#{i})'>#{s}</div>"

for w, i in words
    $('#words').append "<div class='button' onmouseup='init(#{i})'>#{s}</div>"

init = (i) ->
    $('#page').append "<br>megnyomtad a #{shit[i]} gombot"
    $('#page').scrollTop $('#page')[0].scrollHeight

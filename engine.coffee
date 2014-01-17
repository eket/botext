__ = -> console.log arguments...; arguments[0]

Map = window.Map


states =
  scene: (scene, node) ->
    render_page node
    render_hub_scene scene,
      click_verb : (verb) -> states.verb scene, verb

  verb: (scene, verb) ->
    render_hub_verb scene, verb,
      click_back: -> states.scene scene
      click_word: (word) ->
        __ scene, verb, word
        node = Map[scene][verb][word]

        for sk, sv of node.set
          Map[sk] ?= sv
          for vk, vv of sv
            Map[sk][vk] ?= vv
            for wk, wv of vv
              Map[sk][vk][wk] = wv

        if node.del?
          for sk, sv of Map
            for vk, vv of sv
              for wk, wv of vv when wk in node.del
                delete vv[wk]
              if vk in node.del or _.isEmpty sv[vk]
                delete sv[vk]

        try delete Map[scene][verb][word]
        
        if node.del is [] or _.isEmpty _.keys Map[scene][verb]
          delete Map[scene][verb]

        states.scene (node.scene or scene), node


render_hub_scene = (scene, {click_verb}) ->  
  $('#verbs').empty()
  $('#words').empty()

  for v in _.keys Map[scene]
    el= $ "<div class='left button'>#{v}</div>"
    el.on 'mouseup', do (v) -> -> click_verb v
    $('#verbs').append el


render_hub_verb = (scene, verb, {click_word, click_back}) ->
  node = Map[scene][verb]

  $('#verbs').empty()
  $('#words').empty()
  ce= $ "<div class='selected left button'>#{verb}</div>"
  ce.on 'mouseup', click_back
  $('#verbs').append ce

  for w in _.keys Map[scene][verb]
    el= $ "<div class='right button'>#{w}</div>"
    el.on 'mouseup', do (w) -> -> click_word w
    el.on 'mouseenter', do (el) -> -> $('.selected.button').css
      top: (el.position().top)+'px'
    $('#words').append el


render_page = (node) ->
  return unless node?

  if node.scene?
    $('#page').append "<pre class='inter'>***"

  if node.img?
    $('#page').append "<pre class='inter'><img src='img/#{node.img}'></pre>"

  if node.bg?
    $('body').css({background:"url(img/#{node.bg})";})

  $('#page').append "<pre>    #{node.t or node}"
  $('#page').scrollTop $('#page')[0].scrollHeight
  


$('#page').append "<pre class='inter title'>#{Map.opening.title}"
$('#page').append "<pre>    #{Map.opening.t}"

states.scene 'street'

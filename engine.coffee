__ = -> console.log arguments...; arguments[0]

map = window.Map

state = scene: 'street'

render_scene = (scene) ->
  $('#verbs').empty()
  $('#words').empty()

  for v in _.keys map[scene]
    el= $ "<div class='left button'>#{v}</div>"
    el.on 'mouseup', do (v) -> -> render_verb v
    $('#verbs').append el

render_verb = (verb) ->
  node = map[state.scene][state.verb]

  $('#verbs').empty()
  $('#words').empty()
  state.verb = verb
  ce= $ "<div class='selected left button'>#{verb}</div>"
  $('#verbs').fadeIn(100)
  ce.on 'mouseup', -> render_scene(state.scene)
  $('#verbs').append ce

  for w in _.keys map[state.scene][verb]
    el= $ "<div class='right button'>#{w}</div>"
    el.on 'mouseup', do (w) -> -> render_word w
    el.on 'mouseenter', 
      do (el) -> -> $('.selected.button').css top: (el.position().top)+'px'
    $('#words').append el

render_word = (word) ->
  node =map[state.scene][state.verb][word]


  if node.t?

    if node.scene?
      $('#page').append "<pre class='inter'>***"

    if node.img?
      $('#page').append "<pre class='inter'><img src='img/#{node.i}'></pre>"

    $('#page').append "<pre>    #{node.t}"
    $('#page').scrollTop $('#page')[0].scrollHeight


    for sk, sv of node.set
      map[sk] ?= sv
      for vk, vv of sv
        map[sk][vk] ?= vv
        for wk, wv of vv
          map[sk][vk][wk] = wv

    for sk, sv of map
      for vk, vv of sv
        for wk, wv of vv when wk in node.del
          delete vv[wk]
        if vk in node.del or _.isEmpty sv[vk]
          delete sv[vk]

    if _.isEmpty node.del
      map[state.scene][state.verb] = {}

  else
    $('#page').append "<pre>    #{map[state.scene][state.verb][word]}"
    $('#page').scrollTop $('#page')[0].scrollHeight
  
  a = state
  try delete map[state.scene][state.verb][word]
  if _.isEmpty _.keys map[state.scene][state.verb]
    delete map[state.scene][state.verb]

  if node.scene?
    state = scene: node.scene


  if node.one?
    delete map[state.scene][state.verb]

  if node.bg?
    $('body').css({background:"url(img/#{node.bg})";})

  if node.answ?
    $('#page').append "- #{node.answ}"


  render_scene state.scene

state.scene = map.opening.sc
render_scene state.scene
$('#page').append "<pre class='inter title'>#{map.opening.title}"
$('#page').append "<pre>    #{map.opening.t}"
$('#page').scrollTop $('#page')[0].scrollHeight

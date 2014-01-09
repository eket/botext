__ = -> console.log arguments...; arguments[0]

map = window.Map

state = scene: 'street'

render_scene = (scene) ->
  $('#verbs').empty()
  $('#words').empty() 
  for v in _.keys map[scene]
    el= $ "<div class='button'>#{v}</div>"
    el.on 'mouseup', do (v) -> -> render_verb v
    $('#verbs').append el

render_verb = (verb) ->
  $('#verbs').empty()
  $('#words').empty()
  state.verb = verb
  ce= $ "<div class='selected button'>#{verb}</div>"
  ce.on 'mouseup', -> render_scene(state.scene)
  $('#verbs').append ce
  for w in _.keys map[state.scene][verb]
    el= $ "<div class='button'>#{w}</div>"
    el.on 'mouseup', do (w) -> -> render_word w
    el.on 'mouseenter', do (el) -> -> $('.selected.button').css top: (el.position().top)+'px'
    $('#words').append el


render_word = (word) ->
  node =map[state.scene][state.verb][word]
  if node.t?
    $('#page').append "<br>#{node.t}"
    $('#page').scrollTop $('#page')[0].scrollHeight

    for sk, sv of node.set
      map[sk] ?= sv
      for vk, vv of sv
        map[sk][vk] ?= vv
        for wk, wv of vv
          map[sk][vk][wk] = wv

    for sk, sv of node.del
      for vk, vv of sv
        delete map[sk][vk][vv]
      if _.isEmpty map[sk][vk]
        delete map[sk]

  else
    $('#page').append "<br>#{map[state.scene][state.verb][word]}"
    $('#page').scrollTop $('#page')[0].scrollHeight
  
  a = state
  delete map[state.scene][state.verb][word]
  if _.isEmpty _.keys map[state.scene][state.verb]
    delete map[state.scene][state.verb]

  if node.scene?
    state = scene: node.scene

  render_scene state.scene


render_scene 'street'
$('#page').scrollTop $('#page')[0].scrollHeight

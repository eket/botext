__ = -> console.log arguments...; arguments[0]

map = {
    street:
        go:
            'to work': 'i dont really need that'
            'to a friends house': 'i cant go there, its too soon.'
            'home': 'i guess im already there'
        'don\'t': 
            'go anywhere and wait': 'finally a good idea!',
            'do nothing': 'nothing so painful' 
        'download': 
            'some shit': 
                t: 'i get some acid playing in my ears in a minute',
                c: [ 111, 'street', 'go', 'acid party' ] 
            'the link': 'i type my password in, and after a second im looking at my stats'
}

    


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
    if (t = map[state.scene][state.verb][word].t)?
        $('#page').append "<br>#{t}"
        ###switch map[state.scene][state.verb][word].c
            when 111
###

    else
        $('#page').append "<br>#{map[state.scene][state.verb][word]}"
        $('#page').scrollTop $('#page')[0].scrollHeight
    delete map[state.scene][state.verb][word]
    if _.isEmpty _.keys map[state.scene][state.verb]
        delete map[state.scene][state.verb]
        render_scene state.scene
    else 
        render_verb state.verb


state = scene:'street'
render_scene state.scene

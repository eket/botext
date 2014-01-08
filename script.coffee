__ = -> console.log arguments...; arguments[0]

$ ->
    Map =
        street:
            go:
                'to work': 'i dont really need that'
                'to a friends house': 'i cant go there, its too soon.'
                'home': 'i guess im already there'
                'to acid party': 'this is a good party'
            'don\'t': 
                'go anywhere and wait': 'finally a good idea!',
                'do nothing': 'nothing so painful' 
            'download': 
                'some shit': 
                    t: 'i get some acid playing in my ears in a minute',
                    c: [ 111, 'street', 'go', 'acid party' ] 
                'the link': 'i type my password in, and after a second im looking at my stats'
    
    
    choices = (current, input) ->
        k for k,v of current when (k.indexOf input) == 0

    init = ->
        path: []
        current: Map.street
        input: ''

    update = ({path, current, input}, {enter, back, val}) ->
        if val then input = val
        cs = choices current, input
        if back and current != init().current
            path: path[...-1]
            current: (node=init().current; for p in path[...-1] then node = node[p]; node)
            input: ''
        else
            if cs.length == 1
                if _.isString current[cs[0]]
                    if enter
                        _.extend init(), log: "<p2>#{current[cs[0]]}</p>"
                    else
                        {path, current, input}
                else
                    path: path.concat [cs[0]]
                    current: current[cs[0]]
                    input: ''
            else
                {path, current, input}
            
    render = ({path, current, input, log}) ->
        ($ '.choices').html (choices current, input).map (s) -> "<p>#{s}</p>"
        ($ '.preinput').html path.join ' '
        $('#input').val input
        if log then ($ '.log').append log
       
       
    render state = init()
    ($ '#input').keyup (e) ->
        if e.keyCode == 13
            render state = update state, enter: yes
        else
            render state = update state, val: ($ '#input').val()

    ($ '#input').keydown (e) ->
        if e.keyCode == 8 and ($ '#input').val() == ''
            render state = update state, back: yes
        

window.Map = 
  opening:
    sc:'street'
    t:'    I felt quite lucky this morning. But now Im just a doll sitting on this rotten bus for hours. I may as well leave now, the bus isnt gonna go anywhere in the near future. I think the driver is asleep, but its possible that he isnt even on the bus.'
  
  gabba: 
    dance:
      'to music':'4/4/4/4/4'
      'to waves':'whoohoooo'
      'till sunrise': 'you dance till the sun comes up and your eyes cant bear the rise'
    go:
      'find some shit': 'I walk around for hours but everybody seems to be so sober I cant even understand what they are saying to me.'
      'home by bus':
        t: 'I leave as fast as I can and an hour later, Im sitting on a driverless bus.'
        scene: 'street'
  
  street:
    
    'look at': 
      'the bus driver': '   Finally a good idea! I get up and go to the bus driver. Closer I can see that he`s no longer in the driver cabin. Theres only a photograph of an ugly child next to buttons and switches of the bus.',
      'my face': 'Nothing so scary as seeing your face melting away. I`m lucky to be so solid now. I almost feel human.' 
    
    do:
      'amazing background change': 
        t:'there you go!'
        bg:'btselected.gif'
      'sparkles': 
        t:'     I play around with a box of match, and after a while I manage to set my seat on fire.'
        set: 
          'street':
            'make fire stop':
              'with my coat': 'Are you kidding with me? I`m not gonna fuck up my clothing beacause of some silly fire'
              'with bare hands':'   I try to tap away the fire, but it keeps getting bigger.'
      'something with myself': '    I punch my head to the window of the bus, and start screaming around like I`m a mad man.'
    
    'check the web': 
      'for some shit': 
        t: '    I find a gabber party nearby, maybe I should check that out. There`s a good chance I can get some shit over there.'
        set:  
          street:
            go: 
              'gabba': 
                t:'I arrive to the'
                scene: 'gabba'
      'just to spend time': 'I dont have much time to spend.'

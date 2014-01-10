window.Map = 
  opening:
    sc:'street'
    t:'    I felt quite lucky this morning. But now Im just a doll sitting on this rotten bus for hours. I may as well leave now, the bus isnt gonna go anywhere in the near future. I think the driver is asleep, but its possible that he isnt even on the bus.'
  
  street:
    
    'look at': 
      'the bus driver': '   Finally a good idea! I get up and go to the bus driver. Closer I can see that he`s no longer in the driver cabin. Theres only a photograph of an ugly child next to buttons and switches of the bus.',
      'my face': 'Nothing so scary as seeing your face melting away. I`m lucky to be so solid now. I almost feel human.' 
    
    do:
      'amazing background change': 
        t:'there you go!'
        bg:'btselected.gif'
      'sparkles': 
        t:'   I play around with a box of match, and after a while I manage to set my seat on fire.'
        set: 
          'street':
            'make fire stop':
              'with my coat': 'Are you kidding with me? I`m not gonna fuck up my clothing beacause of some silly fire.'
              'with bare hands':
                t: '   I try to tap away the fire, but it keeps getting bigger. So big that it might hurt whats in my bag. I got to protect the content at all costs.'
                set:
                  'street':
                    'escape':
                      'from the bus': 
                        t:'Jumping off the bus feels like I`m in an action movie. A minute later I see explosions. <br>   It was an amazing adventure, and I`m glad to be behind another day. Thank you for playing'
                        scene:'end'
      'something with myself': '    I punch my head to the window of the bus, and start screaming around like I`m a mad man.'
    
    'check the web': 
      'for some shit': 
        t: '    I find a gabber party nearby, maybe I should check that out. There`s a good chance I can get some shit over there.'
        set:  
          street:
            go: 
              'gabba': 
                t:'   I arrive to the dancefloor around midnight.'
                scene: 'gabba'
      'just to spend time': 'I dont have much time to spend.'
  
  gabba: 
    dance:
      'to music':'4/4/4/4/4'
      'to waves':'whoohoooo'
      'till sunrise': 'I dance till the sun comes up and my eyes cant bear the rises.'
    go:
      'find some shit': 'I walk around for hours but everybody seems to be so sober I cant even understand what they are saying to me.'
      'home by bus':
        t: 'I leave as fast as I can and an hour later, Im sitting on a driverless bus.'
        scene: 'street'

  end:
    credits:
      'code brainrape':''
      'text css almsk':''

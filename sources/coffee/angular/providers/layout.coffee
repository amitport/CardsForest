gameModule.service 'layout', ['viewport', (viewport) ->
  @calculate = ({W: W, H: H, w: vw, h: vh, min: vmin}) ->
    if W() < H()
    #crude portrait detector
      @sections = 
        [
          modifiers: 'spaced'
          style:
            width:  '100%'
          cells: 
            [
              cards: ['']
            ,
              cards: ['']
            ,  
              cards: ['']
            , 
              cards: ['']
            ]
          cellStyle:
            padding: vmin(1)
            height: vmin(12)
            width: vmin(12)
          cardStyle:
            height: vmin(10)
            'line-height': vmin(10)
            width: vmin(10)
            'font-size': vmin(4)
        ,
          modifiers: 'spaced'
          style:
            top:  vmin(16)
            width: '100%'
          cells: 
            [
              cards: ['']
            ,
              cards: ['']
            ,  
              cards: ['']
            , 
              cards: ['']
            ]
          cellStyle:
            padding: vmin(1)
            height: vmin(12)
            width: vmin(12)
          cardStyle:
            height: vmin(10)
            'line-height': vmin(10)
            width: vmin(10)
            'font-size': vmin(4)
        ,
          modifiers: 'spaced stretched vertical'
          style:
            top:  vmin(30)
            height: vh(79)
            width: '100%'
          cells: 
            [
              cards: [1..4]
            ,
              cards: [1..4]
            ,  
              cards: [1..4]
            , 
              cards: [1..4]
            ,
              cards: [1..4]
            ,
              cards: [1..4]
            ,  
              cards: [1..4]
            , 
              cards: [1..4]
            ]
          cellStyle:
            height: vmin(10)
            padding: 0
          cardStyle:
            height: vmin(10)
            'line-height': vmin(10)
            width: vmin(10)
            'font-size': vmin(4)
        ]
    else 
      @sections = 
        [
          modifiers: 'spaced'
          style:
            width:  '48%'
            'height': '16%'
          cells: 
            [
              cards: ['']
            ,
              cards: ['']
            ,  
              cards: ['']
            , 
              cards: ['']
            ]
          cellStyle:
            padding: vmin(1)
            height: vmin(12)
            width: vmin(12)
          cardStyle:
            height: vmin(10)
            'line-height': vmin(10)
            width: vmin(10)
            'font-size': vmin(4)
        ,
          modifiers: 'spaced'
          style:
            left:  '52%'
            width:  '48%'
            'height': '16%'
          cells: 
            [
              cards: ['']
            ,
              cards: ['']
            ,  
              cards: ['']
            , 
              cards: ['']
            ]
          cellStyle:
            padding: vmin(1)
            height: vmin(12)
            width: vmin(12)
          cardStyle:
            height: vmin(10)
            'line-height': vmin(10)
            width: vmin(10)
            'font-size': vmin(4)
        ,
          modifiers: 'spaced stretched'
          style:
            top:  '18%'
            height: '79%'
            'max-height': '79%'
            width: '100%'
          cells: 
            [
              cards: [1..8]
            ,
              cards: [1..4]
            ,  
              cards: [1..4]
            , 
              cards: [1..4]
            ,
              cards: [1..4]
            ,
              cards: [1..4]
            ,  
              cards: [1..4]
            , 
              cards: [1..4]
            ]
          cellStyle:
            padding: vmin(1)
            width: vmin(14)
          cardStyle:
            height: vmin(12)
            'line-height': vmin(12)
            width: vmin(12)
            'font-size': vmin(5)

        ]
  
  @calculate(viewport)
  viewport.setLayout(@)
]
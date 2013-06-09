gameRepository = 
  spider: 
    numberOfPlayers: 1
    components:
      stock: -> new CardList(['1C', '2C', '3C', '4C', '5C', '6C', '7C', '8C', '9C', 'TC','JC', 'QC', 'KC',
                  '1D', '2D', '3D', '4D', '5D', '6D', '7D', '8D', '9D', 'TD','JD', 'QD', 'KD',
                  '1H', '2H', '3H', '4H', '5H', '6H', '7H', '8H', '9H', 'TH','JH', 'QH', 'KH',
                  '1S', '2S', '3S', '4S', '5S', '6S', '7S', '8S', '9S', 'TS','JS', 'QS', 'KS',
                  '1C', '2C', '3C', '4C', '5C', '6C', '7C', '8C', '9C', 'TC','JC', 'QC', 'KC',
                  '1D', '2D', '3D', '4D', '5D', '6D', '7D', '8D', '9D', 'TD','JD', 'QD', 'KD',
                  '1H', '2H', '3H', '4H', '5H', '6H', '7H', '8H', '9H', 'TH','JH', 'QH', 'KH',
                  '1S', '2S', '3S', '4S', '5S', '6S', '7S', '8S', '9S', 'TS','JS', 'QS', 'KS']).shuffle()
      cascades: -> new CardListList size: 10
      foundations: -> new CardListList size: 8
    play: ->
      deal
        numberOfCards: 44
        from: @stock
        to: @cascades
        startAt: 0
      deal
        numberOfCards: 10
        from: @stock
        to: @cascades
        startAt: 4
      
      decendingRankOrder =  ['K', 'Q', 'J', '10', '9', '8', '7', '6', '5', '4', '3', '2', 'A']
      
      while @foundations.some((x) -> x.isEmpty())
        await @waitForAction defer(),
            x: new MoveCards(
              sourceConstraint: 1,
              from: 2,
              targetConstraint: 3,
              to: 4,
              after: 5)
            toString: -> "action is 3"
          ,
            allows: (action) -> action is 2 
            toString: -> "action is 2"
        
      @cascades.print()
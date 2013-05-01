
class DeckFactory
  @create: (isFacingUp = true, Format = Standard52) -> 
    deck = []
    deck[k] = v for k, v of arrayExtensions
    
    deck.push new Card(isFacingUp, format) for format in Format.values
    return deck

  arrayExtensions = 
    shuffle: ->
      for i in [@length-1..1]
        j = Math.floor Math.random() * (i + 1)
        [@[i], @[j]] = [@[j], @[i]]
      @
    
    

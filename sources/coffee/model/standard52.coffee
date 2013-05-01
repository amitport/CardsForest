class Standard52  
  constructor: (@rank, @suit) ->
    @color = @suit.color
    @symbol = "#{@rank.symbol}#{@suit.symbol}"
    @name = "#{@rank.name} of #{@suit.name}"
    @constructor["#{@rank.name}_#{@suit.name}".toUpperCase()] = @
    
  toString: -> "<#{@name}>"

  # Format static
  @values = []
  for s in Suit.values
    for r in Rank.values
      @values.push new @(r, s)


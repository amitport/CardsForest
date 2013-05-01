class Format  
  constructor: (@rank, @suit) ->
    @color = @suit.color
    @symbol = "#{@rank.symbol}#{@suit.symbol}"
    @name = "#{@rank.name} of #{@suit.name}"
    @constructor["#{@rank.name}_#{@suit.name}".toUpperCase()] = @
    
  toString: -> "<#{@name}>"

  # Format static
  @formats = []
  for s in Suit.suits
    for r in Rank.ranks
      @formats.push new @(r, s)


console.log name

class Rank
  # @param name {String}
  # @param symbol {String}
  constructor: (@name, @symbol) ->
    @constructor[@name.toUpperCase()] = @
    
  toString: -> "<#{@name}>"
    
console.log name

# Rank static
new Rank 'Ace',   'A'
new Rank 'Two',   '2'
new Rank 'Three', '3'
new Rank 'Four',  '4'
new Rank 'Five',  '5'
new Rank 'Six',   '6'
new Rank 'Seven', '7'
new Rank 'Eight', '8'
new Rank 'Nine',  '9'
new Rank 'Ten',  '10'
new Rank 'Jack',  'J'
new Rank 'Queen', 'Q'
new Rank 'King',  'K'

for key, {symbol} of Rank
  console.log symbol

console.log "end"

class Suit
  # @param name {String}
  # @param symbol {String}
  # @param color {String}
  constructor: (@name, @symbol, @color) ->
    @constructor[@name.toUpperCase()] = @

  toString: -> "<#{@name}>"
  
  # Suit static
  @values = [
    new Suit('Clubs', '♣', 'black'),
    new Suit('Diamonds', '♦', 'red'),
    new Suit('Hearts', '♥', 'red'),
    new Suit('Spades', '♠', 'black')
  ]
  
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

class Card
  constructor: (@isFacingUp = true, format) ->
    @[prop] = format[prop] for own prop of format
  
  toString: -> "#{@symbol}#{if @isFacingUp then '↑' else '↓'}"
  

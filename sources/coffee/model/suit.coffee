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
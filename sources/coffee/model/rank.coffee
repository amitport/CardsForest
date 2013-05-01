class Rank
  # @param name {String}
  # @param symbol {String}
  constructor: (@name, @symbol) ->
    @constructor[@name.toUpperCase()] = @
    
  toString: -> "<#{@name}>"
    
  # Rank static
  @ranks = [
    new Rank('Ace', 'A'),
    new Rank('Two', '2'),
    new Rank('Three', '3'),
    new Rank('Four', '4'),
    new Rank('Five', '5'),
    new Rank('Six', '6'),
    new Rank('Seven', '7'),
    new Rank('Eight', '8'),
    new Rank('Nine', '9'),
    new Rank('Ten', 'T'),
    new Rank('Jack', 'J'),
    new Rank('Queen', 'Q'),
    new Rank('King', 'K')
  ]
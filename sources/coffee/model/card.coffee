class Card
  constructor: (@isFacingUp = true, format) ->
    @[prop] = format[prop] for own prop of format
  
  toString: -> "#{@symbol}#{if @isFacingUp then '↑' else '↓'}"
  

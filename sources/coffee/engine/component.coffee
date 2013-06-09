class Component
  getPlayerCopy: (playerId) ->

class CardComponent extends Component
  constructor: (@format, @visibility) ->
  getPlayerCopy: (playerId) ->
   if @visibility is "facing-up" or (@visibility is "player-only" and playerId is playerId)
     Card[@format]
   else CardFacingDown
  
CardFacingDown = 
  isFacingUp: false
  
class Card
  constructor: (@format) ->
  isFacingUp: true

Card.ACE_HEARTS = new Card("ACE_HEARTS")


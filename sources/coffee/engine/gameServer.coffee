localGameServer = 
  play: (gameClient, gameId) ->
    @gameInstance = new GameInstance(@gameRepository[gameId])

gameServerProxy = 
  gameClient: gameClient
  gameServer: localGameServer
  
  play: (gameId) ->
    @gameInstanceProxy = @gameServer.play(@gameRepository[gameId])
    
   

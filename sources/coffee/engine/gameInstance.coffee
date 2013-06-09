class GameInstance
  constructor: ({@numberOfPlayers, components, @play}) ->
    #initialize components
    for key, component of components
      do (key) =>
        @[key] = component()
        @[key].toString = () -> key
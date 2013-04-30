
gameModule.controller 'game', ['$scope', 'layout', ($scope, layout) ->
  $scope.st = 
    width: '100%'
    height: '100%'
    'background-color': 'red'
    
  $scope.layout = layout   
]



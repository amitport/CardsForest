gameModule.directive 'spreadCards', ->
  return (scope, element, attrs) ->
    h = 20
    offsetTop = offestLeft = parseFloat(scope.section.cellStyle.padding)
    cardSize = parseFloat(scope.section.cardStyle.height)
    console.log offsetTop
    if /vertical/.test(scope.section.modifiers)
      offestLeft = offestLeft + (scope.$index  * cardSize * 0.8)
    else
      offsetTop = offsetTop + (scope.$index *  cardSize * 0.7)
    
    element.css('left', offestLeft + "px")
    element.css('top', offsetTop + "px")

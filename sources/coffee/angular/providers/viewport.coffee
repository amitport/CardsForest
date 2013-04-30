#a robust service for viewport size detection
#adapted from the verge utility (http://verge.airve.com/), MIT license, Copyright (C) 2012 by Ryan Van Etten
gameModule.factory 'viewport', ['$window', '$document', '$rootScope', ($window, $document, $rootScope) ->
  matchMedia = $window['matchMedia'] || $window['msMatchMedia']
  mq = if matchMedia? then (q) -> !!matchMedia.call($window, q).matches else () -> false
  docE = $document[0].documentElement
  
  makeViewportGetter = (dim, inner, client) ->
    if docE[client] < $window[inner] and mq('(min-' + dim + ':' + $window[inner] + 'px)')
      return -> $window[inner]
    else
      return -> docE[client]

  viewport = {}
  viewport.W = makeViewportGetter 'width', 'innerWidth', 'clientWidth'
  viewport.H = makeViewportGetter 'height', 'innerHeight', 'clientHeight'
 
  #set viewport unit to be a precentage of viewport dimensions
  viewport.update = ->
    _w = @W() / 100  
    @w = (val) -> (val * _w) + 'px'
    
    _h = @H() / 100
    @h = (val) -> (val * _h) + 'px'
    
    _min = Math.min _w, _h
    @min = (val) -> (val * _min) + 'px'
  #initial assignment
  viewport.update()
  viewport.setLayout = (layout) ->
    @layout = layout
  
  #update viewport units on window resize
  angular.element($window).bind 'resize', ->
    $rootScope.$apply ->
      viewport.update()
      viewport.layout.calculate(viewport)
    
  return viewport
]
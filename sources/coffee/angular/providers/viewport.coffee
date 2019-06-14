#a robust service for viewport size detection
#adapted from the verge utility (http://verge.airve.com/), MIT license, Copyright (C) 2012 by Ryan Van Etten
initViewport = (module) -> module.factory 'viewport', ['$window', '$document', '$rootScope', ($window, $document, $rootScope) ->
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

  viewport.w = (val) -> (val * viewport.W())/100 + 'px'
  viewport.h = (val) -> (val * viewport.H())/100 + 'px'
  viewport.min = (val) -> (val * Math.min viewport.W(), viewport.H())/100 + 'px'

  viewport.setLayout = (layout) ->
    @layout = layout

  #update viewport units on window resize
  angular.element($window).bind 'resize', ->
    if viewport.layout?
      $rootScope.$apply -> viewport.layout.calculate(viewport)
    else
      $rootScope.$digest()

  return viewport
]

initViewport(gameModule)

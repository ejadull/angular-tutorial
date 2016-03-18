angular.module('shared').factory('VideoResource', (Restangular) ->

  this.videos = ->
    Restangular.all('Videos')

  return this
)
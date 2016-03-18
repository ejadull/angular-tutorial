angular.module('shared').factory('VideoResource', (Restangular) ->

  this.videos = ->
    Restangular.all('Videos')

  this.myVideos = ->
    Restangular.one('Videos').one('myVideos')

  return this
)
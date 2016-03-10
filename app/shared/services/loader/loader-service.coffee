angular.module('shared').service('LoaderService', ->

  class Loader
    constructor: ->
      @keys = []

    start: (loading_key) ->
      @keys = _.union(@keys, [loading_key])

    stop: (loading_key) ->
      @keys = _.reject(@keys, (k) -> k == loading_key)

    isLoading: (loading_key) ->
      _.includes(@keys, loading_key)

  #Return an instance of a spinner object
  return new Loader()
)
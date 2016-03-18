angular.module('shared').service('VideoService', ($q, $log, VideoResource) ->

  this.list = (params) ->
    deferred = $q.defer() #Create a deferred object

    onGetVideosSuccess = (data) ->
      $log.info "Videos retrieved successfully"
      deferred.resolve(data) #Fulfill the promise

    onGetVideosError = (reason) ->
      $log.error "Error while retrieving the videos"
      deferred.reject(reason) #Reject the promise

    VideoResource.videos().getList(params).then(onGetVideosSuccess, onGetVideosError)
    deferred.promise #return the promise

  this.listMyVideos = ->
    deferred = $q.defer() #Create a deferred object

    onGetMyVideosSuccess = (data) ->
      $log.info "My videos retrieved successfully"
      deferred.resolve(data) #Fulfill the promise

    onGetMyVideosError = (reason) ->
      $log.error "Error while retrieving my videos"
      deferred.reject(reason) #Reject the promise

    VideoResource.myVideos().get().then(onGetMyVideosSuccess, onGetMyVideosError)
    deferred.promise #return the promise

  return this
)
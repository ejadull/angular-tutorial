angular.module('videos').controller('TopRatedVideosController', ($scope, $rootScope, VideoService) ->

  LOADING_KEY = "top-rated-videos"

  $scope.getYoutubeUrl = (videoId, embedded) ->
    baseUrl = if embedded then "https://www.youtube.com/embed/" else "https://www.youtube.com/watch?v="
    baseUrl+videoId

  getVideos = -> #Simulate to retrieve the videos from BE
    $rootScope.spinner.start(LOADING_KEY)

    onSuccess = (data) ->
      $scope.topRatedVideos = data.plain() #Plan method removes the Restangular properties

    VideoService.list()
      .then(onSuccess)
      .finally(-> $rootScope.spinner.stop(LOADING_KEY))

  # Init the page
  getVideos()
)
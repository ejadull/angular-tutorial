angular.module('videos').controller('MostViewedVideosController', ($scope, $rootScope, VideoService) ->

  LOADING_KEY = "most-viewed-videos"

  $scope.getYoutubeUrl = (videoId, embedded) ->
    baseUrl = if embedded then "https://www.youtube.com/embed/" else "https://www.youtube.com/watch?v="
    baseUrl+videoId

  getVideos = -> #Simulate to retrieve the videos from BE
    $rootScope.spinner.start(LOADING_KEY)

    onSuccess = (data) ->
      $scope.mostViewedVideos = data.plain() #Plan method removes the Restangular properties

    VideoService.list()
      .then(onSuccess)
      .finally(-> $rootScope.spinner.stop(LOADING_KEY))

  # Init the page
  getVideos()
)
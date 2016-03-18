angular.module('videos').controller('MyVideosController', ($scope, $rootScope, VideoService) ->

  LOADING_KEY = "my-videos"

  $scope.getYoutubeUrl = (videoId, embedded) ->
    baseUrl = if embedded then "https://www.youtube.com/embed/" else "https://www.youtube.com/watch?v="
    baseUrl+videoId

  getVideos = -> #Simulate to retrieve the videos from BE
    $rootScope.spinner.start(LOADING_KEY)

    onSuccess = (data) ->
      $scope.myVideos = data.myVideos

    VideoService.listMyVideos()
      .then(onSuccess)
      .finally(-> $rootScope.spinner.stop(LOADING_KEY))

  # Init the page
  getVideos()
)
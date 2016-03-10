angular.module('videos').controller('TrendingVideosController', ($scope, $log, $rootScope, $timeout) ->

  LOADING_KEY = "trending-videos"

  delayedSpinnerStop = ->
    $timeout(->
      $rootScope.spinner.stop(LOADING_KEY)
    , 3000)

  getVideos = -> #Simulate to retrieve the videos from BE
    $rootScope.spinner.start(LOADING_KEY)
    $scope.trendingVideos = [{embeddedUrl: "https://www.youtube.com/embed/_aDolsvdM4o", title: "I am the highway", views: 15238, likes: 272, dislikes: 3, description: "Chris Cornell Song", youtubeUrl: "https://www.youtube.com/watch?v=_aDolsvdM4o"},
                             {embeddedUrl: "https://www.youtube.com/embed/_aDolsvdM4o", title: "I am the highway", views: 15238, likes: 272, dislikes: 3, description: "Chris Cornell Song", youtubeUrl: "https://www.youtube.com/watch?v=_aDolsvdM4o"},
                             {embeddedUrl: "https://www.youtube.com/embed/_aDolsvdM4o", title: "I am the highway", views: 15238, likes: 272, dislikes: 3, description: "Chris Cornell Song", youtubeUrl: "https://www.youtube.com/watch?v=_aDolsvdM4o"},
                             {embeddedUrl: "https://www.youtube.com/embed/_aDolsvdM4o", title: "I am the highway", views: 15238, likes: 272, dislikes: 3, description: "Chris Cornell Song", youtubeUrl: "https://www.youtube.com/watch?v=_aDolsvdM4o"},
                             {embeddedUrl: "https://www.youtube.com/embed/_aDolsvdM4o", title: "I am the highway", views: 15238, likes: 272, dislikes: 3, description: "Chris Cornell Song", youtubeUrl: "https://www.youtube.com/watch?v=_aDolsvdM4o"},
                             {embeddedUrl: "https://www.youtube.com/embed/_aDolsvdM4o", title: "I am the highway", views: 15238, likes: 272, dislikes: 3, description: "Chris Cornell Song", youtubeUrl: "https://www.youtube.com/watch?v=_aDolsvdM4o"}]

    delayedSpinnerStop()

  # Init the page
  getVideos()
)
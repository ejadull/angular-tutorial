angular.module('videos').controller('MostViewedVideosController', ($scope, $log, $rootScope, $timeout) ->

  LOADING_KEY = "most-viewed-videos"

  delayedSpinnerStop = ->
    $timeout(->
      $rootScope.spinner.stop(LOADING_KEY)
    , 3000)

  getVideos = -> #Simulate to retrieve the videos from BE
    $rootScope.spinner.start(LOADING_KEY)
    $scope.mostViewedVideos = [
      {embeddedUrl: "https://www.youtube.com/embed/MjiaJYaVS-U", title: "Hombre en U", views: 218507, likes: 344, dislikes: 1, description: "Published on Aug 21, 2012. Encuentro en el Estudio - Canal Encuentro - Ministerio de Educación de la Nación", youtubeUrl: "https://www.youtube.com/watch?v=MjiaJYaVS-U"},
      {embeddedUrl: "https://www.youtube.com/embed/MjiaJYaVS-U", title: "Hombre en U", views: 218507, likes: 344, dislikes: 1, description: "Published on Aug 21, 2012. Encuentro en el Estudio - Canal Encuentro - Ministerio de Educación de la Nación", youtubeUrl: "https://www.youtube.com/watch?v=MjiaJYaVS-U"},
      {embeddedUrl: "https://www.youtube.com/embed/MjiaJYaVS-U", title: "Hombre en U", views: 218507, likes: 344, dislikes: 1, description: "Published on Aug 21, 2012. Encuentro en el Estudio - Canal Encuentro - Ministerio de Educación de la Nación", youtubeUrl: "https://www.youtube.com/watch?v=MjiaJYaVS-U"},
      {embeddedUrl: "https://www.youtube.com/embed/MjiaJYaVS-U", title: "Hombre en U", views: 218507, likes: 344, dislikes: 1, description: "Published on Aug 21, 2012. Encuentro en el Estudio - Canal Encuentro - Ministerio de Educación de la Nación", youtubeUrl: "https://www.youtube.com/watch?v=MjiaJYaVS-U"},
      {embeddedUrl: "https://www.youtube.com/embed/MjiaJYaVS-U", title: "Hombre en U", views: 218507, likes: 344, dislikes: 1, description: "Published on Aug 21, 2012. Encuentro en el Estudio - Canal Encuentro - Ministerio de Educación de la Nación", youtubeUrl: "https://www.youtube.com/watch?v=MjiaJYaVS-U"},
      {embeddedUrl: "https://www.youtube.com/embed/MjiaJYaVS-U", title: "Hombre en U", views: 218507, likes: 344, dislikes: 1, description: "Published on Aug 21, 2012. Encuentro en el Estudio - Canal Encuentro - Ministerio de Educación de la Nación", youtubeUrl: "https://www.youtube.com/watch?v=MjiaJYaVS-U"},
      {embeddedUrl: "https://www.youtube.com/embed/MjiaJYaVS-U", title: "Hombre en U", views: 218507, likes: 344, dislikes: 1, description: "Published on Aug 21, 2012. Encuentro en el Estudio - Canal Encuentro - Ministerio de Educación de la Nación", youtubeUrl: "https://www.youtube.com/watch?v=MjiaJYaVS-U"},
      {embeddedUrl: "https://www.youtube.com/embed/MjiaJYaVS-U", title: "Hombre en U", views: 218507, likes: 344, dislikes: 1, description: "Published on Aug 21, 2012. Encuentro en el Estudio - Canal Encuentro - Ministerio de Educación de la Nación", youtubeUrl: "https://www.youtube.com/watch?v=MjiaJYaVS-U"}
    ]

    delayedSpinnerStop()

  # Init the page
  getVideos()
)
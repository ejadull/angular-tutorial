angular.module('videos').controller('MyVideosController', ($scope, $log, $rootScope, $timeout) ->

  LOADING_KEY = "my-videos"

  delayedSpinnerStop = ->
    $timeout(->
      $rootScope.spinner.stop(LOADING_KEY)
    , 3000)

  getVideos = -> #Simulate to retrieve the videos from BE
    $rootScope.spinner.start(LOADING_KEY)
    $scope.myVideos = [
      {embeddedUrl: "https://www.youtube.com/embed/CSvFpBOe8eY", title: "System Of A Down - Chop Suey!", views: 134444090, likes: 584095, dislikes: 16527, description: "Uploaded on Oct 2, 2009. System of a Down's official music video for 'Chop Suey!'. Click to listen to System of a Down on Spotify: http://smarturl.it/SystemSpotify?IQid... As featured on Toxicity. Click to buy the track or album via", youtubeUrl: "https://www.youtube.com/watch?v=CSvFpBOe8eY"},
      {embeddedUrl: "https://www.youtube.com/embed/CSvFpBOe8eY", title: "System Of A Down - Chop Suey!", views: 134444090, likes: 584095, dislikes: 16527, description: "Uploaded on Oct 2, 2009. System of a Down's official music video for 'Chop Suey!'. Click to listen to System of a Down on Spotify: http://smarturl.it/SystemSpotify?IQid... As featured on Toxicity. Click to buy the track or album via", youtubeUrl: "https://www.youtube.com/watch?v=CSvFpBOe8eY"},
      {embeddedUrl: "https://www.youtube.com/embed/CSvFpBOe8eY", title: "System Of A Down - Chop Suey!", views: 134444090, likes: 584095, dislikes: 16527, description: "Uploaded on Oct 2, 2009. System of a Down's official music video for 'Chop Suey!'. Click to listen to System of a Down on Spotify: http://smarturl.it/SystemSpotify?IQid... As featured on Toxicity. Click to buy the track or album via", youtubeUrl: "https://www.youtube.com/watch?v=CSvFpBOe8eY"},
      {embeddedUrl: "https://www.youtube.com/embed/CSvFpBOe8eY", title: "System Of A Down - Chop Suey!", views: 134444090, likes: 584095, dislikes: 16527, description: "Uploaded on Oct 2, 2009. System of a Down's official music video for 'Chop Suey!'. Click to listen to System of a Down on Spotify: http://smarturl.it/SystemSpotify?IQid... As featured on Toxicity. Click to buy the track or album via", youtubeUrl: "https://www.youtube.com/watch?v=CSvFpBOe8eY"},
      {embeddedUrl: "https://www.youtube.com/embed/CSvFpBOe8eY", title: "System Of A Down - Chop Suey!", views: 134444090, likes: 584095, dislikes: 16527, description: "Uploaded on Oct 2, 2009. System of a Down's official music video for 'Chop Suey!'. Click to listen to System of a Down on Spotify: http://smarturl.it/SystemSpotify?IQid... As featured on Toxicity. Click to buy the track or album via", youtubeUrl: "https://www.youtube.com/watch?v=CSvFpBOe8eY"},
      {embeddedUrl: "https://www.youtube.com/embed/CSvFpBOe8eY", title: "System Of A Down - Chop Suey!", views: 134444090, likes: 584095, dislikes: 16527, description: "Uploaded on Oct 2, 2009. System of a Down's official music video for 'Chop Suey!'. Click to listen to System of a Down on Spotify: http://smarturl.it/SystemSpotify?IQid... As featured on Toxicity. Click to buy the track or album via", youtubeUrl: "https://www.youtube.com/watch?v=CSvFpBOe8eY"},
      {embeddedUrl: "https://www.youtube.com/embed/CSvFpBOe8eY", title: "System Of A Down - Chop Suey!", views: 134444090, likes: 584095, dislikes: 16527, description: "Uploaded on Oct 2, 2009. System of a Down's official music video for 'Chop Suey!'. Click to listen to System of a Down on Spotify: http://smarturl.it/SystemSpotify?IQid... As featured on Toxicity. Click to buy the track or album via", youtubeUrl: "https://www.youtube.com/watch?v=CSvFpBOe8eY"},
      {embeddedUrl: "https://www.youtube.com/embed/CSvFpBOe8eY", title: "System Of A Down - Chop Suey!", views: 134444090, likes: 584095, dislikes: 16527, description: "Uploaded on Oct 2, 2009. System of a Down's official music video for 'Chop Suey!'. Click to listen to System of a Down on Spotify: http://smarturl.it/SystemSpotify?IQid... As featured on Toxicity. Click to buy the track or album via", youtubeUrl: "https://www.youtube.com/watch?v=CSvFpBOe8eY"},
      {embeddedUrl: "https://www.youtube.com/embed/CSvFpBOe8eY", title: "System Of A Down - Chop Suey!", views: 134444090, likes: 584095, dislikes: 16527, description: "Uploaded on Oct 2, 2009. System of a Down's official music video for 'Chop Suey!'. Click to listen to System of a Down on Spotify: http://smarturl.it/SystemSpotify?IQid... As featured on Toxicity. Click to buy the track or album via", youtubeUrl: "https://www.youtube.com/watch?v=CSvFpBOe8eY"}
    ]

    delayedSpinnerStop()

  # Init the page
  getVideos()
)
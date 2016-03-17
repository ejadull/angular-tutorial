angular.module('videos').controller('TopRatedVideosController', ($scope, $log, $rootScope, $timeout) ->

  LOADING_KEY = "top-rated-videos"

  delayedSpinnerStop = ->
    $timeout(->
      $rootScope.spinner.stop(LOADING_KEY)
    , 3000)

  getVideos = -> #Simulate to retrieve the videos from BE
    $rootScope.spinner.start(LOADING_KEY)
    $scope.topRatedVideos = [
      {embeddedUrl: "https://www.youtube.com/embed/Mlahvvymkxc", title: "Metallica - The Day That Never Comes[Video Premiere]", views: 21182703, likes: 97383, dislikes: 2453, description: "Uploaded on Sep 2, 2008. It's midnight here at HQ and we are incredibly proud to present you with the debut of 'The Day That Never Comes' ...not so much the standard video fare, but what we like to think of as a short film.", youtubeUrl: "https://www.youtube.com/watch?v=Mlahvvymkxc"},
      {embeddedUrl: "https://www.youtube.com/embed/Mlahvvymkxc", title: "Metallica - The Day That Never Comes[Video Premiere]", views: 21182703, likes: 97383, dislikes: 2453, description: "Uploaded on Sep 2, 2008. It's midnight here at HQ and we are incredibly proud to present you with the debut of 'The Day That Never Comes' ...not so much the standard video fare, but what we like to think of as a short film.", youtubeUrl: "https://www.youtube.com/watch?v=Mlahvvymkxc"},
      {embeddedUrl: "https://www.youtube.com/embed/Mlahvvymkxc", title: "Metallica - The Day That Never Comes[Video Premiere]", views: 21182703, likes: 97383, dislikes: 2453, description: "Uploaded on Sep 2, 2008. It's midnight here at HQ and we are incredibly proud to present you with the debut of 'The Day That Never Comes' ...not so much the standard video fare, but what we like to think of as a short film.", youtubeUrl: "https://www.youtube.com/watch?v=Mlahvvymkxc"},
      {embeddedUrl: "https://www.youtube.com/embed/Mlahvvymkxc", title: "Metallica - The Day That Never Comes[Video Premiere]", views: 21182703, likes: 97383, dislikes: 2453, description: "Uploaded on Sep 2, 2008. It's midnight here at HQ and we are incredibly proud to present you with the debut of 'The Day That Never Comes' ...not so much the standard video fare, but what we like to think of as a short film.", youtubeUrl: "https://www.youtube.com/watch?v=Mlahvvymkxc"},
      {embeddedUrl: "https://www.youtube.com/embed/Mlahvvymkxc", title: "Metallica - The Day That Never Comes[Video Premiere]", views: 21182703, likes: 97383, dislikes: 2453, description: "Uploaded on Sep 2, 2008. It's midnight here at HQ and we are incredibly proud to present you with the debut of 'The Day That Never Comes' ...not so much the standard video fare, but what we like to think of as a short film.", youtubeUrl: "https://www.youtube.com/watch?v=Mlahvvymkxc"},
      {embeddedUrl: "https://www.youtube.com/embed/Mlahvvymkxc", title: "Metallica - The Day That Never Comes[Video Premiere]", views: 21182703, likes: 97383, dislikes: 2453, description: "Uploaded on Sep 2, 2008. It's midnight here at HQ and we are incredibly proud to present you with the debut of 'The Day That Never Comes' ...not so much the standard video fare, but what we like to think of as a short film.", youtubeUrl: "https://www.youtube.com/watch?v=Mlahvvymkxc"}
    ]

    delayedSpinnerStop()

  # Init the page
  getVideos()
)
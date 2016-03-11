angular.module('videos', ['ui.router']) #Create the videos module. It will include all the logic for the videos views.
                                        #Add ui.router module as a dependency to use ui-router functionality.

.config(($stateProvider) ->
  $stateProvider            #Configuration of the video routes:
    .state('videos', {        #Define an abstract parent state called 'videos' whose layout will be inherited by its children states
        url: '/videos'        #It is abstract because it cannot be referenced
        abstract: true
        templateUrl: '/app/components/videos/videos-layout.html'
    })
    .state('videos.trending', { #Videos child state (not abstract because it can be referenced). It inherits its father's layout
        url: '/trending'
        templateUrl: '/app/components/videos/trending/trending-videos.html'
        controller: 'TrendingVideosController'
    })
    .state('videos.most-viewed', { #Videos child state (not abstract because it can be referenced). It inherits its father's layout
      url: '/most-viewed'
      templateUrl: '/app/components/videos/most-viewed/most-viewed-videos.html'
      controller: 'MostViewedVideosController'
    })
    .state('videos.top-rated', { #Videos child state (not abstract because it can be referenced). It inherits its father's layout
      url: '/top-rated'
      templateUrl: '/app/components/videos/top-rated/top-rated-videos.html'
      controller: 'TopRatedVideosController'
    })
    .state('videos.my-videos', { #Videos child state (not abstract because it can be referenced). It inherits its father's layout
      url: '/my-videos'
      templateUrl: '/app/components/videos/my-videos/my-videos.html'
      controller: 'MyVideosController'
    })
)

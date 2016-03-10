angular.module('videos', ['ui.router']) #Create the videos module. It will include all the logic for the videos views.
                                        #Add ui.router module as a dependency to use ui-router functionality.

.config(($stateProvider) ->
  $stateProvider            #Configuration of the video routes:
    .state('videos', {        #Define an abstract parent state called 'videos' whose layout will be inherited by its children states
        url: '/videos'        #It is abstract because it cannot be referenced
        abstract: true
        templateUrl: '/app/components/videos/videos-layout.html'
    })
)

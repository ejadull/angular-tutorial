angular.module('tutorial', ['ui.router']) #Create the tutorial module. It will include all the logic for the tutorial view.
                                          #Add ui.router module as a dependency to use ui-router functionality.

.config(($stateProvider) ->
  $stateProvider            #Configuration of the video routes:
    .state('tutorial', {        #Define an abstract parent state called 'videos' whose layout will be inherited by its children states
        url: '/tutorial'        #It is abstract because it cannot be referenced
        abstract: true
        templateUrl: '/app/components/tutorial/tutorial-layout.html'
    })
    .state('tutorial.steps', { #Videos child state (not abstract because it can be referenced). It inherits its father's layout
        url: '/steps'
        templateUrl: '/app/components/tutorial/steps/tutorial-steps.html'
        controller: 'TrendingVideosController'
    })
)

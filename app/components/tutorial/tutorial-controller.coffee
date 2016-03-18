angular.module('tutorial').controller('TutorialController', ($scope, $rootScope, $timeout) ->

  LOADING_KEY = "tutorial-steps"

  delayedSpinnerStop = ->
    $timeout(->
      $rootScope.spinner.stop(LOADING_KEY)
    , 3000)

  # Init the page
  $rootScope.spinner.start(LOADING_KEY)
  delayedSpinnerStop()
)
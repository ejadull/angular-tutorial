angular.module('contact').controller('ContactController', ($scope, $rootScope, $timeout) ->

  LOADING_KEY = "contact"

  delayedSpinnerStop = ->
    $timeout(->
      $rootScope.spinner.stop(LOADING_KEY)
    , 3000)

  # Init the page
  $rootScope.spinner.start(LOADING_KEY)
  delayedSpinnerStop()
)
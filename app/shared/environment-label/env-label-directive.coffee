angular.module('shared').directive('envLabel', ->
  return {
    restrict: 'E'
    scope: {
      environment: '='
    }
    templateUrl: '/app/shared/environment-label/env-label.html'
  }
)
angular.module('shared').directive('envLabel', ->
  return {
    restrict: 'E'
    scope: {
      environment: '='
    }
    templateUrl: '/app/shared/artifacts/environment-label/env-label.html'
  }
)
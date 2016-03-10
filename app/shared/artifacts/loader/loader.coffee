angular.module('shared').directive('loader', ->
  return {
    restrict: 'E'
    transclude: true
    scope: {
      loading: "="
    }
    templateUrl: "/app/shared/artifacts/loader/loader.html"
  }
)
angular.module('contact', ['ui.router'])

.config(($stateProvider) ->
  $stateProvider
    .state('contact', {
        url: '/contact'
        templateUrl: '/app/components/contact/contact.html'
        controller: 'ContactController'
    })
)
angular.module('videoApp', ['videos', 'tutorial', 'contact', 'shared']) #Add recently created videos & shared module as a dependency of the root module

.config(($urlRouterProvider, $sceDelegateProvider) ->
  ################### Routing configs #################
  $urlRouterProvider.otherwise("/videos/trending")

  #Allow resources from other urls
  $sceDelegateProvider.resourceUrlWhitelist([
    #Allow same origin resource loads.
    'self',
    #Allow loading from youtube.
    'https://www.youtube.com/**'
  ]);
)

.run(($rootScope, EnvironmentConfig, LoaderService, Restangular) ->
  ################### Restangular configs #################
  Restangular.setBaseUrl(EnvironmentConfig.api)
  Restangular.setDefaultHeaders({'Content-Type': 'application/json'})

  #Configurations in the running stage
  $rootScope.currentEnvironment = EnvironmentConfig.env_name #Save in the global namespace the name of the current environment
  $rootScope.spinner = LoaderService
)

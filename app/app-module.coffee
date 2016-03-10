angular.module('videoApp', ['videos', 'shared']) #Add recently created videos & shared module as a dependency of the root module

.config(() ->
  #Configurations in the config stage
)

.run(($rootScope, EnvironmentConfig) ->
  #Configurations in the running stage
  $rootScope.currentEnvironment = EnvironmentConfig.env_name #Save in the global namespace the name of the current environment
)

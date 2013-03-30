# app/app.coffee
#
# Main entry point for the application

'use strict'

angular = require 'angular'
require 'angular-cookies'
require 'angular-resource'

routes = require './routes.coffee'

appController = require './controllers/app_controller.coffee'
firstController = require './controllers/first_controller.coffee'
secondController = require './controllers/second_controller.coffee'

versionDirective = require './directives/version.coffee'

versionService = require './services/version.coffee'

interpolateFilter = require './filters/version.coffee'

# Initialization of angular.js when the document is ready
angular.element(document).ready ->
  angular.bootstrap(document, ['app'])


# Declare app level module which depends on filters, and services
App = angular.module('app', [
  'ngCookies'
  'ngResource'
  'app.controllers'
  'app.directives'
  'app.filters'
  'app.services'
])

# Setup routes
App.config routes

# Initialize controllers
angular.module('app.controllers', ['ngResource'])
  .controller('AppController', appController)
  .controller('FirstController', firstController)
  .controller('SecondController', secondController)

# Initialize directives
angular.module('app.directives', ['app.services'])
  .directive('appVersion', versionDirective)

# Initialize services
angular.module('app.services', [])
  .factory('version', versionService)

# Initialize filters
angular.module('app.filters', [])
  .filter('interpolate', interpolateFilter)
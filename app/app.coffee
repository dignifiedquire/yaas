# app/app.coffee
#
# Main entry point for the application


# Initialization of angular.js when the document is ready
angular.element(document).ready ->
  angular.bootstrap(document, ['app'])
  
  

'use strict'

# Declare app level module which depends on filters, and services
window.App = angular.module('app', [
  'ngCookies'
  'ngResource'
  'app.directives'
  'app.filters'
  'app.services'
])

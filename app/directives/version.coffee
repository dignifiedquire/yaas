# app/directives/version.coffee

'use strict'

angular.module('app.directives', [
  'app.services'
])

.directive 'appVersion', [
  'version'
  
  (version) ->
    (scope, elm, attrs) -> elm.text(version)
]
# app/controllers/first_controller.coffee

'use strict'

angular.module('app.controllers').controller 'FirstController', [
  '$scope'
  '$rootScope'  
  ($scope, $rootScope) ->
    $scope.name = 'first controller'
    $rootScope.pageTitle = 'YAAS - View1'
]
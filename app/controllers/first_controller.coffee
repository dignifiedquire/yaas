# app/controllers/first_controller.coffee

'use strict'

angular.module('app').controller 'FirstController', [
  '$scope'
  '$rootScope'  
  ($scope, $rootScope) ->
    $scope.test = 'OK'
    $rootScope.pageTitle = "yaas - view1"
]
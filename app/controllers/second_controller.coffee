# app/controllers/second_controller.coffee

'use strict'

angular.module('app.controllers').controller 'SecondController', [
  '$scope'
  '$rootScope'
  ($scope, $rootScope) ->
    $scope.name = 'second controller'
    $rootScope.pageTitle = 'YAAS - View2'

]

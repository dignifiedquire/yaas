# app/controllers/second_controller.coffee

'use strict'

angular.module('app.controllers').controller 'SecondController', [
  '$scope'
  '$rootScope'
  ($scope, $rootScope) ->
    $rootScope.pageTitle = "yaas - view2"    

]

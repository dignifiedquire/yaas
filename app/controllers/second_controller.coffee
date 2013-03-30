# app/controllers/second_controller.coffee
module.exports = [
  '$scope'
  '$rootScope'
  ($scope, $rootScope) ->
    $scope.name = 'second controller'
    $rootScope.pageTitle = 'YAAS - View2'

]

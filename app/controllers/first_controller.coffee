# app/controllers/first_controller.coffee
module.exports = [
  '$scope'
  '$rootScope'
  ($scope, $rootScope) ->
    $scope.name = 'first controller'
    $rootScope.pageTitle = 'YAAS - View1'
]
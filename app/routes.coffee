# app/routes.coffee
#
# All needed routes get defined in this file

App.config [
  '$routeProvider'
  '$locationProvider'

  ($routeProvider, $locationProvider, config) ->

    $routeProvider

      .when('/view1', 
        templateUrl: '/partials/first.html'
        controller: 'FirstController'      
      )
      .when('/view2', 
        templateUrl: '/partials/second.html'
        controller: 'SecondController'
      )

      # Catch all
      .otherwise({redirectTo: '/view1'})

    # Without serve side support html5 must be disabled.
    $locationProvider.html5Mode(false)
]
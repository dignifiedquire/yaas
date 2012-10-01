(function() {

  angular.element(document).ready(function() {
    return angular.bootstrap(document, ['app']);
  });

  'use strict';


  window.App = angular.module('app', ['ngCookies', 'ngResource', 'app.controllers', 'app.directives', 'app.filters', 'app.services']);

}).call(this);

(function() {

  App.config([
    '$routeProvider', '$locationProvider', function($routeProvider, $locationProvider, config) {
      $routeProvider.when('/view1', {
        templateUrl: '/partials/first.html',
        controller: 'FirstController'
      }).when('/view2', {
        templateUrl: '/partials/second.html',
        controller: 'SecondController'
      }).otherwise({
        redirectTo: '/view1'
      });
      return $locationProvider.html5Mode(false);
    }
  ]);

}).call(this);

(function() {
  'use strict';

  angular.module('app.controllers', ['ngResource']).controller('AppController', [
    '$scope', '$location', '$resource', '$rootScope', function($scope, $location, $resource, $rootScope) {
      $scope.$location = $location;
      $scope.$watch('$location.path()', function(path) {
        return $scope.activeNavId = path || '/';
      });
      $scope.getClass = function(id) {
        if ($scope.activeNavId.substring(0, id.length) === id) {
          return 'active';
        } else {
          return '';
        }
      };
      return $scope.pageTitle = "test";
    }
  ]);

}).call(this);

(function() {
  'use strict';

  angular.module('app.controllers').controller('FirstController', [
    '$scope', '$rootScope', function($scope, $rootScope) {
      $scope.test = 'OK';
      return $rootScope.pageTitle = "yaas - view1";
    }
  ]);

}).call(this);

(function() {
  'use strict';

  angular.module('app.controllers').controller('SecondController', [
    '$scope', '$rootScope', function($scope, $rootScope) {
      return $rootScope.pageTitle = "yaas - view2";
    }
  ]);

}).call(this);

(function() {
  'use strict';

  angular.module('app.directives', ['app.services']).directive('appVersion', [
    'version', function(version) {
      return function(scope, elm, attrs) {
        return elm.text(version);
      };
    }
  ]);

}).call(this);

(function() {
  'use strict';

  angular.module('app.filters', []).filter('interpolate', [
    'version', function(version) {
      return function(text) {
        return String(text).replace(/\%VERSION\%/mg, version);
      };
    }
  ]);

}).call(this);

(function() {
  'use strict';

  angular.module('app.services', []).factory('version', function() {
    return "0.1";
  });

}).call(this);

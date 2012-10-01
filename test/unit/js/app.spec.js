(function() {
  'use strict';

  var expect;

  expect = chai.expect;

  describe("app controller", function() {
    var AppController;
    AppController = void 0;
    beforeEach(function() {
      module('app.controllers');
      return inject(function($rootScope, $controller) {
        var scope;
        scope = $rootScope.$new();
        return AppController = $controller('AppController', {
          $scope: scope
        });
      });
    });
    return it("should be constructable", function() {
      return expect(!!AppController).to.be["true"];
    });
  });

}).call(this);

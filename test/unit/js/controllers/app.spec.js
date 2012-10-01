(function() {
  'use strict';

  var expect;

  expect = chai.expect;

  describe('app controller', function() {
    var AppController, scope;
    AppController = scope = null;
    beforeEach(function() {
      module('app.controllers');
      return inject(function($rootScope, $controller) {
        scope = $rootScope.$new();
        return AppController = $controller('AppController', {
          $scope: scope
        });
      });
    });
    it('should be constructable', function() {
      return expect(!!AppController).to.be["true"];
    });
    return it('should have the correct name', function() {
      return expect(scope.name).to.be.equal('app controller');
    });
  });

}).call(this);

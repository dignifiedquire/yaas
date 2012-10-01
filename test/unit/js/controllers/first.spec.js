(function() {
  'use strict';

  var expect;

  expect = chai.expect;

  describe('first controller', function() {
    var FirstController, scope;
    FirstController = scope = null;
    beforeEach(function() {
      module('app.controllers');
      return inject(function($rootScope, $controller) {
        scope = $rootScope.$new();
        return FirstController = $controller('FirstController', {
          $scope: scope
        });
      });
    });
    it('should be constructable', function() {
      return expect(!!FirstController).to.be["true"];
    });
    it('should have the correct name', function() {
      return expect(scope.name).to.be.equal('first controller');
    });
    return it('should set the page title', function() {
      return expect(scope.pageTitle).to.be.equal('YAAS - View1');
    });
  });

}).call(this);

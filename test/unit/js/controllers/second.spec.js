(function() {
  'use strict';

  var expect;

  expect = chai.expect;

  describe('second controller', function() {
    var SecondController, scope;
    SecondController = scope = null;
    beforeEach(function() {
      module('app.controllers');
      return inject(function($rootScope, $controller) {
        scope = $rootScope.$new();
        return SecondController = $controller('SecondController', {
          $scope: scope
        });
      });
    });
    it('should be constructable', function() {
      return expect(!!SecondController).to.be["true"];
    });
    it('should have the correct name', function() {
      return expect(scope.name).to.be.equal('second controller');
    });
    return it('should set the page title', function() {
      return expect(scope.pageTitle).to.be.equal('YAAS - View2');
    });
  });

}).call(this);

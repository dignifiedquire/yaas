(function() {
  'use strict';

  var expect;

  expect = chai.expect;

  describe('version directive', function() {
    beforeEach(function() {
      return module('app.directives');
    });
    return it('prints the current version', function() {
      module(function($provide) {
        $provide.value("version", "TEST_VER");
      });
      return inject(function($rootScope, $compile) {
        var element, scope;
        scope = $rootScope.$new();
        element = $compile("<span app-version></span>")(scope);
        return expect(element.text()).to.be.equal("TEST_VER");
      });
    });
  });

}).call(this);

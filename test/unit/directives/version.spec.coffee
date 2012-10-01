'use strict'

# mocha specs for the version directive goes here

# load chai expect
expect = chai.expect


describe 'directive:version', ->
  
  beforeEach ->
    module('app.directives')
      
      
  it 'prints the current version', ->
    module ($provide) ->
      $provide.value "version", "TEST_VER"
      return
      
    inject ($rootScope, $compile) ->
      scope = $rootScope.$new()
      
      element = $compile("<span app-version></span>")(scope)
      expect(element.text()).to.be.equal "TEST_VER"

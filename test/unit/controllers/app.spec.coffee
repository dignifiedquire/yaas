'use strict'

# mocha specs for the app controller goes here

# load chai assert
expect = chai.expect


describe 'controller:app', ->
  # initialize variables
  AppController = scope = null
  
  beforeEach ->
    module('app.controllers')
    inject ($rootScope, $controller) ->
      scope = $rootScope.$new()
      AppController = $controller('AppController', $scope: scope)
      
  it 'should be constructable', ->
    expect(!!AppController).to.be.true


  it 'should have the correct name', ->
    expect(scope.name).to.be.equal 'app controller'
'use strict'

# mocha specs for the app controller goes here

# load chai assert
expect = chai.expect

# TODO figure out how to test Controllers that use modules

describe "app controller", ->
  AppController = undefined
  
  beforeEach ->
    module('app.controllers')
    inject ($rootScope, $controller) ->
      scope = $rootScope.$new()
      AppController = $controller('AppController', $scope: scope)
      
  it "should be constructable", ->
    expect(!!AppController).to.be.true



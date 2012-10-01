'use strict'

# mocha specs for the second controller goes here

# load chai assert
expect = chai.expect


describe 'controller:second', ->
  # initialize variables
  SecondController = scope = null
  
  beforeEach ->
    module('app.controllers')
    inject ($rootScope, $controller) ->
      scope = $rootScope.$new()
      SecondController = $controller('SecondController', $scope: scope)
      
  it 'should be constructable', ->
    expect(!!SecondController).to.be.true


  it 'should have the correct name', ->
    expect(scope.name).to.be.equal 'second controller'

  it 'should set the page title', ->
    expect(scope.pageTitle).to.be.equal 'YAAS - View2'
    
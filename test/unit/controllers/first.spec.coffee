'use strict'

# mocha specs for the first controller goes here

# load chai assert
expect = chai.expect


describe 'controller:first', ->
  # initialize variables
  FirstController = scope = null
  
  beforeEach ->
    module('app.controllers')
    inject ($rootScope, $controller) ->
      scope = $rootScope.$new()
      FirstController = $controller('FirstController', $scope: scope)
      
  it 'should be constructable', ->
    expect(!!FirstController).to.be.true


  it 'should have the correct name', ->
    expect(scope.name).to.be.equal 'first controller'

  it 'should set the page title', ->
    expect(scope.pageTitle).to.be.equal 'YAAS - View1'
  
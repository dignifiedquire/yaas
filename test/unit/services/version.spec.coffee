'use strict'

# mocha specs for the version service goes here

# load chai expect
expect = chai.expect


describe 'service:version', ->
  beforeEach ->
    module 'app.services'

  it 'should replace VERSION', ->
    inject (version) ->
      expect(version).to.be.equal '0.1'
    

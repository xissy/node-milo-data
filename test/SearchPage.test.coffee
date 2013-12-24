should = require 'should'

SearchPage = require '../lib/SearchPage'


describe 'SearchPage', ->
  it 'should be done', (done) ->
    searchPage = new SearchPage '047406117918', (err, products) ->
      should.not.exist err
      should.exist products
      products.length.should.be.above 0

      done()

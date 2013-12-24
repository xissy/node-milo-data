should = require 'should'

searchByUpc = require '../lib/searchByUpc'


describe 'searchByUpc(...)', ->
  it 'should be done', (done) ->
    searchByUpc '047406117918', '34.0395449', '-118.442003', (err, results) ->
      should.not.exist err
      should.exist results
      results.length.should.be.above 0

      done()

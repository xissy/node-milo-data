should = require 'should'

AvailabilityPage = require '../lib/AvailabilityPage'


describe 'AvailabilityPage', ->
  it 'should be done', (done) ->
    searchPage = new AvailabilityPage '35200214', '34.0395449', '-118.442003', (err, results) ->
      should.not.exist err
      should.exist results
      results.length.should.be.above 0

      done()

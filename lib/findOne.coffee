SearchPage = require './SearchPage'
AvailabilityPage = require './AvailabilityPage'


module.exports = (searchKeyword, latitude, longitude, callback) ->
  searchPage = new SearchPage searchKeyword, (err, products) ->
    return callback err  if err?
    return callback []  if products.length is 0

    product = products[0]
    productId = product.id
    
    availabilityPage = new AvailabilityPage productId, latitude, longitude, callback

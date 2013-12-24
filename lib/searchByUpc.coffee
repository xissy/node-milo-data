SearchPage = require './SearchPage'
AvailabilityPage = require './AvailabilityPage'


module.exports = (upc, latitude, longitude, callback) ->
  searchPage = new SearchPage upc, (err, products) ->
    return callback err  if err?
    return callback []  if products.length is 0

    product = products[0]
    productId = product.id
    
    availabilityPage = new AvailabilityPage productId, latitude, longitude, callback

request = require 'request'
cheerio = require 'cheerio'
urlModule = require 'url'


class SearchPage
  constructor: (searchKeyword, callback) ->
    url = "http://milo.com/search?q=#{searchKeyword}&near=Map+Location"

    request
      url: url
    ,
      (err, res, body) ->
        return callback err  if err?

        $ = cheerio.load body
        products = $('.product')
        productIds = []
        products.each (index, element) ->
          productIds.push
            id: @.attr 'data-pid'
            url: urlModule.resolve url, @.attr 'href'

        callback null, productIds



module.exports = SearchPage

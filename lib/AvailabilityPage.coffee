request = require 'request'
cheerio = require 'cheerio'
urlModule = require 'url'


class AvailabilityPage
  constructor: (productId, latitude, longitude, callback) ->
    callbackName = "top.MILO.SDK.AvailabilityAPI._cb#{productId}"
    url = "http://milo.com/availability?product_id=#{productId}&latitude=#{latitude}&longitude=#{longitude}&callback=#{callbackName}"

    request
      url: url
    ,
      (err, res, body) ->
        return callback err  if err?

        $ = cheerio.load body

        merchantMap = {}
        locationMap = {}
        results = []

        try
          $('script').each (index, elements) ->
            script = @.text().replace(callbackName, '')[1...-1]
            jsonObject = JSON.parse script
            
            key = null
            value = null
            for k, v of jsonObject
              key = k
              value = v
              break

            switch key
              when 'merchant'
                merchantMap[value.id] = value
              when 'location'
                locationMap[value.id] = value
              when 'result'
                results.push value

        catch err
          return callback err

        for k, v of locationMap
          v.merchant = merchantMap[v.merchant_id]

        for result in results
          result.location = locationMap[result.location_id]

        callback null, results



module.exports = AvailabilityPage

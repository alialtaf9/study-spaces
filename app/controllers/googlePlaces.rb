require 'open-uri'
require 'json'

class GooglePlaces

	@@locations

	def createHash(lat, long, radius)
		baseurl = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?'
		lat = lat
		long = long
		radius = radius
		type = 'food'
		sensor = 'true'

		key = 'AIzaSyCIODFIE0k1M1kqGr-udwkp63SxnQE02gw'

		combine = baseurl + 'location=' + lat + ',' + long + '&radius=' + radius + '&types=' + type + '&sensor=' + sensor + '&key=' + key

		@@locations = Hash.new 

		result = open(combine) do |file|
			json = JSON.parse(file.read)
			json["results"].each do |location|

				name, lat, lng, isOpen, number, address = ''

				detailsBaseUrl = 'https://maps.googleapis.com/maps/api/place/details/json?'
				reference = location["reference"]
				url = detailsBaseUrl + '&reference=' + reference + '&sensor=' + sensor + '&key=' + key
				details = open(url) do |f|
					detailsJson = JSON.parse(f.read)
					name = detailsJson['result']['name']
					lat = detailsJson['result']['geometry']['location']['lat']
					lng = detailsJson['result']['geometry']['location']['lng']
					if detailsJson['result']['opening_hours']
						isOpen = detailsJson['result']['opening_hours']['open_now']
					end 
					if detailsJson['result']['formatted_phone_number']
						number = detailsJson['result']['formatted_phone_number']
					end
					if detailsJson['result']['formatted_address']
						address = detailsJson['result']['formatted_address']
					end
				end

				featuresArr = [lat, lng, isOpen, number, address]
				@@locations[name] = featuresArr
			end
		end

		return @@locations

	end

end

#Test
#places = GooglePlaces.new
#hash = places.createHash('39.952558', '-75.193575', '100')
#puts hash





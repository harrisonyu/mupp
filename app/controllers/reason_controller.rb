class ReasonController < ApplicationController

	http_basic_authenticate_with name: "muppghs", password: "hackfest"

    def new
		@reason = Reason.new
	end

	def create
		@id = params[:id]
		@reason = Reason.new
		@reason.artistID = params["artistID"].to_i
		@reason.locationID = params["locationID"].to_i
		@reason.relationship = params["relationship"]
		@reason.save
		redirect_to home_path and return
	end

	def lastfmscrape
		artists = Artist.all
		threads = []
		array = []

		artists.each do |artist|
			name = artist.artistName.gsub(' ', '+')
			threads << Thread.new do
				result = Net::HTTP.get(URI.parse("http://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist=#{name}&api_key=219013a75ea68365ea1396ab616923fb&format=json"))	
				artist_json = JSON::parse(result)
				location = artist_json["artist"]["bio"]["placeformed"]
				geoLocation = Geocoder.search(location)[0].address
				artistId = artist.id
				locationId = Location.find_by_locationName(geoLocation).id
				array << [artistId, locationId] if location
			end
		end

		# Wait until threads are done.
		threads.each { |aThread|  aThread.join }

		array.each do |x|
			newEntry = Reason.new
			newEntry.artistID = x[0]
			newEntry.locationID = x[1]
			newEntry.save
		end
		redirect_to home_path and return
	end

	def updateform
	end
	
	def update
		@id = params[:id]
		@relationship = params["relationship"]
		Reason.update(@id, :relationship => @relationship)
		redirect_to home_path and return
	end

	def delete
		@id = params[:id]
		@reason = Reason.find_by_id(@id)
		@reason.destroy
		redirect_to home_path and return
	end
end

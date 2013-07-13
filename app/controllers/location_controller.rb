class LocationController < ActionController::Base
  	def new
		@location = Location.new
	end

	def create
		@id = params[:id]
		@form = params[:location]
		@location = Location.new
		@nameOfLocation = @form[:locationName]
		@location.locationName = Geocoder.search(@nameOfLocation)[0].address
		@location.longitude = Geocoder.search(@nameOfLocation)[0].longitude
		@location.latitude = Geocoder.search(@nameOfLocation)[0].latitude
		@location.save
		redirect_to home_path and return
	end

	def lastfmscrape
		artists = Artist.all
		threads = []
		locations = []

		artists.each_with_index do |artist, index|
			name = artist.artistName.gsub(' ', '+')
			threads << Thread.new do
				result = Net::HTTP.get(URI.parse("http://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist=#{name}&api_key=219013a75ea68365ea1396ab616923fb&format=json"))	
				artist_json = JSON::parse(result)
				location = artist_json["artist"]["bio"]["placeformed"]
				locations << location if location
			end
		end

		# Wait until threads are done.
		threads.each { |aThread|  aThread.join }
	
		locations.each do |x|
			puts Geocoder.search(x)
		end

		#locations.each do |x|
		# 	x = locations[0]
		# 	newEntry = Location.new
		# 	newEntry.locationName = Geocoder.search(x)[0].address
		# 	newEntry.longitude = Geocoder.search(x)[0].longitude
		# 	newEntry.latitude = Geocoder.search(x)[0].latitude
		# 	newEntry.save
		# #end
		redirect_to home_path and return
	end

	def delete
		@id = params[:id]
		@location = Location.find_by_id(@id)
		@location.destroy
		redirect_to home_path and return
	end
end

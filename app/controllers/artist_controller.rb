class ArtistController < ApplicationController

	http_basic_authenticate_with name: "muppghs", password: "hackfest"

	def new
		@artist = Artist.new
	end

	def create
		@id = params[:id]
		@artist = Artist.new
		@artist.artistName = params["artistName"]
		@artist.biography = params["biography"]
		@artist.save

		redirect_to home_path and return
	end

	def lastfmscrape
		result = Net::HTTP.get(URI.parse('http://ws.audioscrobbler.com/2.0/?method=chart.gettopartists&limit=10&page=1&api_key=219013a75ea68365ea1396ab616923fb&format=json'))
		artists_json = JSON::parse(result)
		artists = artists_json["artists"]["artist"]

		array = []
		threads = []

		artists.each_with_index do |artist, index|
			name = artist['name'].gsub(' ', '+')
			if (name.ascii_only?)
				threads << Thread.new do
					result2 = Net::HTTP.get(URI.parse("http://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist=#{name}&api_key=219013a75ea68365ea1396ab616923fb&format=json"))	
					artist_json = JSON::parse(result2)
					summary = artist_json["artist"]["bio"]["summary"]
					array << [name.gsub('+', ' '), summary]
				end
			end
		end

		# Wait until threads are done.
		threads.each { |aThread|  aThread.join }

		array.each do |x|
			newEntry = Artist.new
			newEntry.artistName = x[0]
			newEntry.biography = x[1]
			newEntry.save
		end
		redirect_to home_path and return
	end

	def delete
		@id = params[:id]
		@artist = Artist.find_by_id(@id)
		@artist.destroy
		redirect_to home_path and return
	end
end
require 'json'
require 'net/http'

result = Net::HTTP.get(URI.parse('http://ws.audioscrobbler.com/2.0/?method=chart.gettopartists&limit=10&api_key=219013a75ea68365ea1396ab616923fb&format=json'))
artists_json = JSON::parse(result)
artists = artists_json["artists"]["artist"]

array = Array.new(artists.size) { |index| {} }
threads = []

artists.each_with_index do |artist, index|
	name = artist['name'].gsub(' ', '+')
	if (name.ascii_only?)
		threads << Thread.new do
			result2 = Net::HTTP.get(URI.parse("http://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist=#{name}&api_key=219013a75ea68365ea1396ab616923fb&format=json"))	
			artist_json = JSON::parse(result2)
			place = artist_json["artist"]["bio"]["placeformed"]
			summary = artist_json["artist"]["bio"]["summary"]
			array[index]["name"] = [name.gsub('+', ' '), place, summary]
			puts name.gsub('+', ' ')
		end
	end
end

# Wait until threads are done.
threads.each { |aThread|  aThread.join }





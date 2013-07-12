class HomeController < ApplicationController
	def public
		@city = request.location.city
		@latitude = request.location.latitude
		@longitude = request.location.longitude
		@country = request.location.country_code
		@ip = request.remote_ip
		@test = Geocoder.search("Kansas City. MO")[0].longitude
	end
	
	def index
		@songs = Song.all
		@locations = Location.all
		@reasons = Reason.all
		@artists = Artist.all
	end
end
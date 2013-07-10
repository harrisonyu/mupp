class HomeController < ApplicationController
	def public
		@city = request.location.city
		@latitude = request.location.latitude
		@longitude = request.location.longitude
		@country = request.location.country_code
		@ip = request.remote_ip
		@test = Geocoder.search(@ip)
	end
end
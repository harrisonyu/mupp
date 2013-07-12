class LocationController < ActionController::Base
  	def new
		@location = Location.new
	end

	def create
		@id = params[:id]
		@form = params[:location]
		@location = Location.new
		@nameOfLocation = @form[:locationName]
		@location.locationName = @nameOfLocation
		@location.longitude = Geocoder.search(@nameOfLocation)[0].longitude
		@location.latitude = Geocoder.search(@nameOfLocation)[0].latitude
		@location.save
		redirect_to home_path and return
	end

	def delete
		@id = params[:id]
		@location = Location.find_by_id(@id)
		@location.destroy
		redirect_to home_path and return
	end
end

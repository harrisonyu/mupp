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

	def delete
		@id = params[:id]
		@reason = Reason.find_by_id(@id)
		@reason.destroy
		redirect_to home_path and return
	end
end

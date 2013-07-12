class ReasonController < ActionController::Base
    def new
		@reason = Reason.new
	end

	def create
		@id = params[:id]
		@form = params[:reason]
		@reason = Reason.new
		@reason.artistID = @form[:artistID].to_i
		@reason.locationID = @form[:locationID].to_i
		@reason.relationship = @form[:relationship]
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

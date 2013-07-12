class ArtistController < ApplicationController
	def new
		@artist = Artist.new
	end

	def create
		@id = params[:id]
		@form = params[:artist]
		@artist = Artist.new
		@artist.artistName = params[:artistName]
		@artist.biography = params[:biography]
		@artist.save
		redirect_to home_path and return
	end

	def delete
		@id = params[:id]
		@artist = Artist.find_by_id(@id)
		@artist.destroy
		redirect_to home_path and return
	end
end
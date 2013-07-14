class SongController < ApplicationController

	http_basic_authenticate_with name: "muppghs", password: "hackfest"

	def new
		@song = Song.new
	end
	
	def create
		@id = params[:id]
		@song = Song.new
		@song.songName = params["songName"]
		@song.artistID = params["artistID"].to_i
		@song.lyrics = params["lyrics"]
		@song.link = params["link"]
		@song.save
		redirect_to home_path and return
	end

	def delete
		@id = params[:id]
		@song = Song.find_by_id(@id)
		@song.destroy
		redirect_to home_path and return
	end
end

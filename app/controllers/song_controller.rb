class SongController < ActionController::Base
	def new
		@song = Song.new
	end

	def create
		@id = params[:id]
		@form = params[:song]
		@song = Song.new
		@song.songName = @form[:songName]
		@song.artistID = @form[:artistID].to_i
		@song.lyrics = @form[:lyrics]
		@song.link = @form[:link]
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

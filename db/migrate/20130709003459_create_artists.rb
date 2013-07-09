class CreateArtists < ActiveRecord::Migration
	def change
		create_table :artists do |t|
			t.string :name
			t.string :birthPlaceCity
			t.string :birthPlaceState
		end
  	end
end

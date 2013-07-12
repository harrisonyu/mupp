class AddArtistLocationRelationship < ActiveRecord::Migration
  def up
  	  drop_table :artistLocationReasons
  		create_table :reasons do |t|
			t.integer :artistID
			t.integer :locationID
			t.string :reason
		end
  end
end

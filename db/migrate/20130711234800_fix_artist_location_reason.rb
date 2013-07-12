class FixArtistLocationReason < ActiveRecord::Migration
  def up
  	drop_table :artistLocationReason
  		create_table :artistLocationReasons do |t|
			t.integer :artistID
			t.integer :locationID
			t.string :reason
		end
  end
end

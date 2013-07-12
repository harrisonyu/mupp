class CreateArtistLocationReason < ActiveRecord::Migration
  def up
		create_table :artistLocationReason do |t|
			t.integer :artistID
			t.integer :locationID
			t.string :reason
		end
  end
end

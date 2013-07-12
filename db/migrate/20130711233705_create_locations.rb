class CreateLocations < ActiveRecord::Migration
  def up
		create_table :locations do |t|
			t.string :city
			t.string :state
			t.float :longitude
			t.float :latitude
		end
  end
end

class AddLocationName < ActiveRecord::Migration
  def up
    remove_column :locations, :city, :string
    remove_column :locations, :state, :string
    add_column	:locations, :locationName, :string
  end

  def down
  end
end

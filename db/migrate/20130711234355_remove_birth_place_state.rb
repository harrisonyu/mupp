class RemoveBirthPlaceState < ActiveRecord::Migration
  def up
  	remove_column :artists, :birthPlaceState, :string
  end
end

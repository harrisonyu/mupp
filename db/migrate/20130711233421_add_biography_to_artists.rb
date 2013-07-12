class AddBiographyToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :biography, :string
    remove_column :artists, :birthPlaceCity, :string
    remove_column :artists, :birthPlacestate, :string
  end
end

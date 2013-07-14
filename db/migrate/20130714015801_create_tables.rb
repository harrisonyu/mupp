class CreateTables < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.text :biography
      t.string :artistName
    end

    create_table :locations do |t|
      t.float  :longitude
      t.float  :latitude
      t.string :locationName
    end

    create_table :reasons do |t|
      t.integer :artistID
      t.integer :locationID
      t.text  :relationship
    end

    create_table :songs do |t|
      t.string  :songName
      t.text  :lyrics
      t.string  :link
      t.integer :artistID
    end
  end
end

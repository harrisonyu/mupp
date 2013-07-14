class CreateTable < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :biography
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
      t.string  :relationship
    end

    create_table :songs do |t|
      t.string  :songName
      t.string  :lyrics
      t.string  :link
      t.integer :artistID
    end
  end
end

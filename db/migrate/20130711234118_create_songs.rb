class CreateSongs < ActiveRecord::Migration
  def up
		create_table :songs do |t|
			t.string :songName
			t.string :lyrics
			t.string :link
			t.integer :artistID
		end
    remove_column :artists, :name, :string
    add_column	:artists, :artistName, :string
  end
end

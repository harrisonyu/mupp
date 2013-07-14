class Song < ActiveRecord::Base
  attr_accessible :songName, :lyrics, :link, :artistID

  validates_presence_of :songName
  validates_presence_of :artistID
  validates_presence_of :link

  has_one :artist
end
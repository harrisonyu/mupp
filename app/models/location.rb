class Location < ActiveRecord::Base
  attr_accessible :locationName, :longitude, :latitude

  validates_uniqueness_of :locationName

  validates_presence_of :locationName
  validates_presence_of :longitude
  validates_presence_of :latitude
end
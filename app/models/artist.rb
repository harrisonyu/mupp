class Artist < ActiveRecord::Base
  attr_accessible :artistName, :biography

  validates_presence_of :artistName
  validates_uniqueness_of :artistName

  has_many :songs
  has_many :reasons
end
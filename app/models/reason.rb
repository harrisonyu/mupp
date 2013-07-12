class Reason < ActiveRecord::Base
	attr_accessible :artistID, :locationID, :reason

	validates_presence_of :artistID
	validates_presence_of :locationID

	has_many :locations
	has_many :artists
end
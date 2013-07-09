class Artist < ActiveRecord::Base
	validates_presence_of :name
	validates_presence_of :birthPlaceState
end
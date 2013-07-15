class DataController < ApplicationController
  def index
    @songs = Song.all
    @locations = Location.all
    @reasons = Reason.all
    @artists = Artist.all
  end
end
class DataController < ApplicationController

  http_basic_authenticate_with name: "muppghs", password: "hackfest"

  def index
    @songs = Song.all
    @locations = Location.all
    @reasons = Reason.all
    @artists = Artist.all
  end
end
class LocationController < ApplicationController

  http_basic_authenticate_with name: "muppghs", password: "hackfest"
  
    def new
    @location = Location.new
  end

  def create
    @id = params[:id]
    @location = Location.new
    @nameOfLocation = params["locationName"]
    @geocoderLocation = Geocoder.search(@nameOfLocation)[0]
    @location.locationName = @geocoderLocation.address
    @location.longitude = @geocoderLocation.longitude
    @location.latitude = @geocoderLocation.latitude
    @location.save
    redirect_to data_path and return
  end

  def lastfmscrape
    artists = Artist.all
    threads = []
    locations = []

    artists.each_with_index do |artist, index|
      name = artist.artistName.gsub(' ', '+')
      threads << Thread.new do
        result = Net::HTTP.get(URI.parse("http://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist=#{name}&api_key=219013a75ea68365ea1396ab616923fb&format=json"))
        artist_json = JSON::parse(result)
        location = artist_json["artist"]["bio"]["placeformed"]
        locations << location if location
      end
    end

    # Wait until threads are done.
    threads.each { |aThread|  aThread.join }

    locations.each do |x|
       newEntry = Location.new
       @geocoderLocation = Geocoder.search(x)[0]
       newEntry.locationName = @geocoderLocation.address
       newEntry.longitude = @geocoderLocation.longitude
       newEntry.latitude = @geocoderLocation.latitude
       newEntry.save
    end
    redirect_to data_path and return
  end

  def delete
    @id = params[:id]
    @location = Location.find_by_id(@id)
    @reasons = Reason.find(:all, :conditions => ['locationID =?', @location])
    @reasons.each do |r|
      r.destroy
    end
    @location.destroy
    redirect_to data_path and return
  end
end

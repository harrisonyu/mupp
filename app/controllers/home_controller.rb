class HomeController < ApplicationController
  $lastSongId = 0
  $ip = "San Fransico, CA"
  $autoPlay = false
  def public
    @geocoderLocation = Geocoder.search($ip)[0]
    @locationLongitude = @geocoderLocation.longitude
    @locationLatitude = @geocoderLocation.latitude
    @minimum_distance = (@locationLatitude-Location.first.latitude)*(@locationLatitude-Location.first.latitude)+(@locationLongitude-Location.first.longitude)*(@locationLongitude-Location.first.longitude)
    @location = 1
    @locationDB = Location.all
    @locationDB.each do |l|
      @distance = (@locationLatitude-l.latitude)*(@locationLatitude-l.latitude)+(@locationLongitude-l.longitude)*(@locationLongitude-l.longitude)
      if @distance < @minimum_distance 
        @location = l.id
        @minimum_distance = @distance
      end
    end
    @locationName = Location.find_by_id(@location).locationName
    @listOfArtists = Reason.find(:all, :conditions => ['locationID =?', @location])
    @currentlyPlayingArtist = @listOfArtists.sample(1)[0]
    @nameOfArtist = Artist.find_by_id(@currentlyPlayingArtist.artistID).artistName
    @biographyOfArtist = Artist.find_by_id(@currentlyPlayingArtist.artistID).biography
    @listOfSongs = Song.find(:all, :conditions => ['artistID =? AND id !=?', @currentlyPlayingArtist.artistID, $lastSongId])
    @currentlyPlayingSong = @listOfSongs.sample(1)[0]
    $lastSongId = @currentlyPlayingSong.id
    @songLyrics = Song.find_by_id(@currentlyPlayingSong.id).lyrics
    @songName = Song.find_by_id(@currentlyPlayingSong.id).songName
    @songLink = Song.find_by_id(@currentlyPlayingSong.id).link
    @reason = @currentlyPlayingArtist.relationship
    $autoPlay = true
  end
  
  def index
    @songs = Song.all
    @locations = Location.all
    @reasons = Reason.all
    @artists = Artist.all
  end

  def selectLocation
    if params["selectedLocation"] == ""
      redirect_to root_path and return
    end
    if params["selectedLocation"] == "My Location"
      $ip = "San Francisco"#request.remote_ip
    else
      $ip = params["selectedLocation"]
    end
    redirect_to root_path and return
  end
end
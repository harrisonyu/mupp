class SongController < ApplicationController

  require 'nokogiri'
  require 'open-uri'

  http_basic_authenticate_with name: "muppghs", password: "hackfest"

  def new
    @song = Song.new
  end

  def create
    @id = params[:id]
    @song = Song.new
    @song.songName = params["songName"]
    @song.artistID = params["artistID"].to_i
    @song.lyrics = params["lyrics"]
    @song.link = params["link"]
    @song.save
    redirect_to home_path and return
  end

  def lastfmscrape
    
    artist = "Daft+Punk"
    artistUrl = "http://www.jango.com/music/#{artist}?c=1"
    artistDoc = Nokogiri::HTML(open(artistUrl))
    video = artistDoc.css('.artist_song_li .song_name a')[0]['href']
    songUrl = "http://www.jango.com#{video}?c=1"
    songDoc = Nokogiri::HTML(open(songUrl))
    allScripts = songDoc.css('script')
    allScripts.each do |script|
      scriptClean = script.content.gsub(/\s+/, "")
      puts scriptClean.scan(/"([^"]*)"/) if scriptClean.start_with? "_jango.vp.inpage"
    end
    redirect_to home_path and return

    # artists = Artist.all
    # threads = []
    # array = []

    # artists.each do |artist|
    #   name = artist.artistName.gsub(' ', '+')
    #   artistUrl = "http://www.jango.com/music/#{name}?l=0"
    #   threads << Thread.new do
    #     artistDoc = Nokogiri::HTML(open(artistUrl))
    #     videos = artistDoc.css('.artist_song_li')
    #     videos.each do |video|
    #       puts video
    #   	end
    #   end

    #   # Wait until threads are done.
    #   threads.each { |aThread|  aThread.join }

    # end
    # redirect_to home_path and return
  end

  def delete
    @id = params[:id]
    @song = Song.find_by_id(@id)
    @song.destroy
    redirect_to home_path and return
  end
end

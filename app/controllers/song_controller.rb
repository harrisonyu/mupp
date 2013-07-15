class SongController < ApplicationController

  require 'open-uri'

  http_basic_authenticate_with name: "muppghs", password: "hackfest"

  def new
    @song = Song.new
    @artists = Artist.all
  end

  def create
    @id = params[:id]
    @song = Song.new
    @song.songName = params["songName"]
    @song.artistID = params["artistID"].to_i
    @song.lyrics = params["lyrics"]
    @song.link = params["link"]
    @song.save
    redirect_to data_path and return
  end

  def lastfmscrape
    
    artists = Artist.all
    threads = []
    array = []

    artists.each do |artist|
      name = artist.artistName.gsub(' ', '+')
      artistUrl = "http://www.jango.com/music/#{name}?c=1"
 
      threads << Thread.new do
        artistDoc = Nokogiri::HTML(open(artistUrl))  
        videos = artistDoc.css('.artist_song_li .song_name a')
        songThreads = []
        
        videos.each do |video|
          songName = video.content
          songPath = video['href']
          songUrl = "http://www.jango.com#{songPath}?c=1"
          songDoc = Nokogiri::HTML(open(songUrl))
          allScripts = songDoc.css('script')
          songCode = ""
          allScripts.each do |script|
            scriptClean = script.content.gsub(/\s+/, "")
            if scriptClean.start_with? "_jango.vp.inpage"
              songCode = scriptClean.scan(/"([^"]*)"/)[0][0].gsub('-', '')
            end
          end
          array << [songName, songCode, artist.id, "lyric"]
        end
        #Wait until song threads are done.
        songThreads.each { |aThread|  aThread.join }
      end
    end
    
    #Wait until threads are done.
    threads.each { |aThread|  aThread.join }

    array.each do |x|
      newEntry = Song.new  
      newEntry.songName = x[0] 
      newEntry.link = x[1]
      newEntry.artistID = x[2] 
      newEntry.lyrics = x[3]
      newEntry.save
    end
    redirect_to data_path and return
  end

  def lyricsupdateform
  end
  
  def lyricsupdate
    @id = params[:id]
    @lyrics = params["lyrics"]
    Song.update(@id, :lyrics => @lyrics)
    redirect_to data_path and return
  end

  def linkupdateform
  end
  
  def linkupdate
    @id = params[:id]
    @link = params["link"]
    Song.update(@id, :link => @link)
    redirect_to data_path and return
  end

  def songnameupdateform
  end
  
  def songnameupdate
    @id = params[:id]
    @songName = params["songName"]
    Song.update(@id, :songName => @songName)
    redirect_to data_path and return
  end


  def delete
    @id = params[:id]
    @song = Song.find_by_id(@id)
    @song.destroy
    redirect_to data_path and return
  end

end

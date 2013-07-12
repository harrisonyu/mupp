module MusicianScraper

require 'open-uri'
require 'nokogiri'

doc = Nokogiri::HTML(open("http://en.wikipedia.org/wiki/List_of_best-selling_music_artists_in_the_United_States"))

tds = doc.css('td')

i = 0
n = 6
artists = (0... tds.length).select{ |x| x%n == n-1 }.map { |y| tds[y] } 

puts artists
puts artists.size

end


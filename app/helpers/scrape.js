var request = require('request');
var cheerio = require('cheerio');

var url = "http://en.wikipedia.org/wiki/List_of_best-selling_music_artists_in_the_United_States";

request(url, function (error, response, body) {
  if (!error && response.statusCode == 200) {
    $ = cheerio.load(body);
    console.log($);
  }
})
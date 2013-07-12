var Client = require('request-json').JsonClient;
var client = new Client('http://localhost:8888/');
var fs = require('fs');

var url = 'http://ws.audioscrobbler.com/2.0/?method=chart.gettopartists&limit=1000&api_key=219013a75ea68365ea1396ab616923fb&format=json';

client.get(url, function(err, res, body) {
  	var artists = body.artists.artist;

  	for (var i = 0; i < artists.length; i++) {
  		var name = artists[i].name;
  		var name_url = "http://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist=" 
  						+ name + "&api_key=219013a75ea68365ea1396ab616923fb&format=json";
  		client.get(name_url, (function(name) {
  			return function(err, res, body) {
  				var place = body.artist.bio.placeformed;
  				var summary = body.artist.bio.summary;
  				if (place) {
  					var writeThis = " START_ARTIST " + name + " ::: " + place + " ::: " + summary + " END_ARTIST\n";
  					fs.appendFile('message.txt', writeThis, function (err) {
          				if (err) throw err;
          				console.log('appended ' + name);
        			});
  				}
  			}
  		}) (name));
  	}
  	
  	
});
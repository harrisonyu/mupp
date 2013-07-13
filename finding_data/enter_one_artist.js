var querystring = require('querystring');
var http = require('http');

var data = querystring.stringify({
      artistName: "name",
      biography: "bio"
    });

var options = {
    host: '127.0.0.1',
    port: 3000,
    path: '/home',
    method: 'POST',
    headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Content-Length': data.length
    }
};

var req = http.request(options, function(res) {
    res.setEncoding('utf8');
    res.on('data', function (chunk) {
        console.log("body: " + chunk);
    });
});

req.write(data);
req.end();
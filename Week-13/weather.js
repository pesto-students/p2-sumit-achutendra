const http = require("http")
// const request = require("request")

const dotenv = require("dotenv").config()


const address = process.argv[2]

const url = `https://api.openweathermap.org/data/2.5/weather?q=${address}&appid=${process.env.API_KEY}`

const server = http.createServer(function(request,response){
    var request = require("request");
    if (!address) {
        return console.log("Please enter the name of the city after node weather.js like 'Delhi,india'")
        // response.end();
    }
    
    
    request(url, function(err,res,body){
        const data = JSON.parse(body)
        response.write("<h1>"+ 'City Name : ' + data['name'] + '<br>' + "</h1>");
        response.write("<h2>"+ 'Temperature : ' + data.main['temp'] + '<br>' + "</h2>");
        response.write("<h2>"+ 'Sunset Time : ' + new Date(data.sys['sunset']*1000) + "</h2>");
        response.end();
    } );
}).listen(3010, () => console.log('listening to the port 3010...'));
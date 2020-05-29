#!/bin/bash
# A bash shell script used by me to initialize a minimal Node.js project in any directory

# Create the project structure comprising express, mongoose, ejs and body-parser
mkdir -p public/css
mkdir -p public/images
mkdir -p views/partials
touch public/css/styles.css
touch app.js index.html

# Initialize npm and install dependencies
npm init -y
npm i express body-parser ejs mongoose

# Write app.js with the code used often
# Require node modules
echo "const express = require('express');" >> app.js 
echo "const bodyParser = require('body-parser');" >> app.js 
echo "const ejs = require("ejs");" >> app.js 
echo "const mongoose = require("mongoose");" >> app.js 
echo " " >> app.js

# Connect mongoose database
echo "mongoose.connect('mongodb://localhost:27017/<dbName>', {useNewUrlParser: true});" >> app.js
echo " " >> app.js

# Create express instance
echo "const app = express();" >> app.js 
echo " " >> app.js

# Set up ejs templating
echo "app.set('view engine', 'ejs');" >> app.js
echo "app.use(express.static("public"));" >> app.js
echo " " >> app.js

# Set up body-parser
echo "app.use(bodyParser.urlencoded({" >> app.js
echo "  extended: true" >> app.js
echo "}))" >> app.js

# Set up home route
echo "app.get('/', function(req, res) {" >> app.js 
echo "	res.sendFile(__dirname + '/index.html');" >> app.js
echo "})" >> app.js
echo " " >> app.js

# Start the server
echo "app.listen(3000, function() {" >> app.js
echo "	console.log('Server up on port 3000');" >> app.js
echo "})" >> app.js

# Write HTML5 boilerplate to index.html
echo "<!DOCTYPE html>" >> index.html
echo "<html lang='en' dir='ltr'>" >> index.html
echo "  <head>" >> index.html
echo "    <meta charset='utf-8'>" >> index.html
echo "    <title>Node app</title>" >> index.html
echo "  </head>" >> index.html
echo "  <body>" >> index.html
echo "    <h1>Hello</h1>" >> index.html
echo "  </body>" >> index.html
echo "</html>" >> index.html

# Run the app with nodemon
nodemon app.js

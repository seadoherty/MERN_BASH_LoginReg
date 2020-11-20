#!/bin/bash

cd $PROJECT_FOLDER/

cat >> server.js <<EOF 
require('dotenv').config();

const express = require('express'),
    app = express(),
    cors = require('cors'),
    cookieParser = require('cookie-parser'),   
    server = app.listen(${PORT_WEBSERVER}, () => console.log('Listening on port ${PORT_WEBSERVER}'));

app.use(cookieParser());
app.use(cors({ credentials: true, origin:'http://localhost:3000' }));
app.use(express.json());
app.use(express.urlencoded({extended:true}));

require('./server/config/database.config');
require('./server/routes/user.routes')(app);
EOF
echo "${green}>>> Created server.js${reset}"

mkdir server
echo "${green}>>> Created server folder, going into server folder${reset}"

cd server

mkdir config controllers models routes
echo "${green}>>> Created config controllers models routes folders, going into sever folder${reset}"

cd $mainDir
./03_proj_env.sh
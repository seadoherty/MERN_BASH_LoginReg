#!/bin/bash

cd $PROJECT_FOLDER/server/config

cat >> database.config.js <<EOF 
const mongoose = require('mongoose'),
    uri = 'mongodb://localhost/${DB_NAME}';

mongoose.connect(uri, {
    useUnifiedTopology:true,
    useNewUrlParser:true
})
    .then(res => console.log("You're now in the mainframe"))
    .catch(err => console.log(err));
EOF
echo "${green}>>> Created database.config.js${reset}"

cd $mainDir
./05_p_s_config_jwt.sh
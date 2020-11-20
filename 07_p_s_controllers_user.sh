#!/bin/bash

cd $PROJECT_FOLDER/server/controllers

cat >> user.controller.js <<EOF
const { User } = require('../models/user.model');

module.exports = {
    index: (req, res) => {
        User.find()
            .then(data => res.json({ results: data }))
            .catch(err => res.json(err.errors))
    }
}
EOF
echo "${green}>>> Created user.controller.js${reset}"

cd $mainDir
./08_p_s_models_user.sh
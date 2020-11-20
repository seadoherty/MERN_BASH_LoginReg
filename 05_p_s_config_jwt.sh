#!/bin/bash

cd $PROJECT_FOLDER/server/config

cat >> jwt.config.js <<EOF 
const jwt = require("jsonwebtoken");

module.exports.authenticate = (req, res, next) => {

  jwt.verify(req.cookies.usertoken, process.env.SECRET_KEY, (err, payload) => {
    console.log("These are cookies", req.cookies);
    if (err) {
      res.status(401).json({ verified: false });
    } else {
      next();
    }
  });
}
EOF
echo "${green}>>> Created jwt.config.js${reset}"

cd $mainDir
./06_p_s_controllers_loginReg.sh
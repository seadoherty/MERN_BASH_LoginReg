#!/bin/bash

cd $PROJECT_FOLDER/server/routes

cat >> user.routes.js <<EOF 
const LoginRegController = require('../controllers/loginReg.controller'),
    UserController = require('../controllers/user.controller'),
    { authenticate } = require('../config/jwt.config');

module.exports = (app) => {
    app.post("/api/register", LoginRegController.register);
    app.post("/api/login", LoginRegController.login);
    app.get("/api/users", authenticate, UserController.index);
    app.get("/api/logout", authenticate, LoginRegController.logout);
}
EOF
echo "${green}>>> Created user.routes.js${reset}"

cd $mainDir
./10_app_libraries.sh
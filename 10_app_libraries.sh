#!/bin/bash

cd $PROJECT_FOLDER/$PROJECT_NAME

npm install axios 
echo "${green}>>> installed axios${reset}"

npm install @reach/router 
echo "${green}>>> installed @reach/router${reset}"

npm install bootstrap 
echo "${green}>>> installed bootstrap${reset}"

cd $mainDir
./11_app_AppJs.sh
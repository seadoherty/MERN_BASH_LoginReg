#!/bin/bash

cd $PROJECT_FOLDER/
echo "${green}>>> Now installing required libraries${reset}"

npm install react
echo "${green}>>> installed react${reset}"

npm install express 
echo "${green}>>> installed express${reset}"

npm install mongoose 
echo "${green}>>> installed mongoose${reset}"

npm install cors 
echo "${green}>>> installed cors${reset}"

npm install nodemon 
echo "${green}>>> installed nodemon${reset}"

npm install dotenv 
echo "${green}>>> installed dotenv${reset}"

npm install bcrypt 
echo "${green}>>> installed bcrypt${reset}"

npm install cookie-parser 
echo "${green}>>> installed cookie-parser${reset}"

npm install jsonwebtoken 
echo "${green}>>> installed jsonwebtoken${reset}"

npx create-react-app $PROJECT_NAME
echo "${green}>>> Created react app ${PROJECT_NAME}${reset}"

cd $mainDir
./02_proj_serverJs.sh
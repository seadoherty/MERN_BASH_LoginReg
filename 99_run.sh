#!/bin/bash

cd $PROJECT_FOLDER/
npm update
echo "${green}>>> npm updated in $PROJECT_FOLDER/${reset}"

cd $PROJECT_NAME/
npm update
echo "${green}>>> npm updated in $PROJECT_FOLDER/$PROJECT_NAME/${reset}"

echo "${green}>>> MERN setup complete${reset}"
echo "${green}>>> To run app use 2 terminals${reset}"
echo "${green}>>> In terminal 1, in the ${PROJECT_FOLDER} folder run: nodemon server.js${reset}"
echo "${green}>>> In terminal 2, in the ${PROJECT_FOLDER}/${PROJECT_NAME} folder run: npm start${reset}"

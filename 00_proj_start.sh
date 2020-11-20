#!/bin/bash

# Shell script for create a MERN project.
# Type the following command and replace "myproject" with the name of your project
# source 00_proj_start.sh myproject

export green=`tput setaf 2`
export reset=`tput sgr0`
export PROJECT_NAME=${1-myproject}
export PROJECT_FOLDER="${PROJECT_NAME}_Project"
export mainDir=$(pwd)
export PORT_WEBSERVER=8000
export DB_NAME="${PROJECT_NAME}DB"

mkdir $PROJECT_FOLDER 
echo "${green}>>> Created folder: $PROJECT_NAME${reset}"

cd $PROJECT_FOLDER 
npm init -y 
echo "${green}>>> initialized new project${reset}"

cd $mainDir
./01_proj_libraries.sh
#!/bin/bash

cd $PROJECT_FOLDER/

cat >> .env <<EOF 
SECRET_KEY=BANANARAMA
EOF
echo "${green}>>> Created .env${reset}"


cat >> .gitignore <<EOF 
node_modules/
.env
EOF
echo "${green}>>> Created .gitignore${reset}"

cd $mainDir
./04_p_s_config_database.sh
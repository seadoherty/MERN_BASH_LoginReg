#!/bin/bash

cd $PROJECT_FOLDER/$PROJECT_NAME/src

rm App.js
echo "${green}>>> Removed old App.js${reset}"

mkdir components views
echo "${green}>>> Made components and views${reset}"


cat >> App.js <<EOF 
import React, { useState } from 'react';
import './App.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import Reg from './views/Reg';
import Main from './views/Main';
import Login from './views/Login';
import { Router } from '@reach/router';


function App() {
  const [logged, setLogged] = useState(null);

  return (
    <div className="App">
      <Router>
        <Reg
          path="/"
          setLogged={setLogged}
        />
        <Login
          path="/login"
          setLogged={setLogged}
        />
        <Main
          path="/dashboard"
          logged={logged}
          setLogged={setLogged}
        />
      </Router>
    </div>
  );
}

export default App;
EOF
echo "${green}>>> Created new App.js${reset}"

cd $mainDir
./12_app_components_Input.sh
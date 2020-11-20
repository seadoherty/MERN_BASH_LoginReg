#!/bin/bash

cd $PROJECT_FOLDER/$PROJECT_NAME/src/views

cat >> Main.js <<EOF 
import React, { useState, useEffect } from 'react';
import Axios from 'axios';
import { navigate } from '@reach/router';

const Main = props => {
    const { logged, setLogged } = props;
    const [users, setUsers] = useState([]);

    useEffect(() => {
        Axios.get("http://localhost:8000/api/users", { withCredentials: true })
            .then(res => setUsers(res.data.results))
            .catch(err => {
                if (err.response.status===401) {
                    navigate('/login');
                }
            });
    }, [])

    const handleLogout = () => {
        Axios.get("http://localhost:8000/api/logout", { withCredentials: true })
        .then(res=>{
            navigate('/');
        })
        .catch(err=>console.log(err))
    }

    return (
        <div>
            <h2>Welcome {logged.firstName} {logged.lastName}</h2>
            <button onClick={handleLogout} className="btn btn-danger">Log Out</button>
            <table className="table table-hover">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody>
                    {
                        users.map((u, i) => {
                            return <tr key={i}>
                                <td>{u.firstName} {u.lastName}</td>
                                <td>{u.email}</td>
                            </tr>
                        })
                    }
                </tbody>
            </table>
        </div>
    );
}
export default Main;
EOF
echo "${green}>>> Created Main.js${reset}"

cd $mainDir
./15_app_views_Reg.sh
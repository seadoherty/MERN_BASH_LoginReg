#!/bin/bash

cd $PROJECT_FOLDER/$PROJECT_NAME/src/views

cat >> Reg.js <<EOF 
import React, { useState } from 'react';
import Axios from 'axios';
import Input from '../components/Input';
import { Link, navigate } from '@reach/router';

const Reg = props => {

    const { setLogged } = props;

    const initialReg = {
        firstName: "",
        lastName: "",
        email: "",
        password: "",
        confirmPassword: ""
    }
    const [reg, setReg] = useState(initialReg);
    const [errors, setErrors] = useState(initialReg);

    const handleInputChange = e => {
        setReg({
            ...reg,
            [e.target.name]:e.target.value
        })
    }

    const handleSubmit = e => {
        e.preventDefault();
        Axios.post('http://localhost:8000/api/register', reg, { withCredentials: true })
            .then(res => {
                console.log(res);
                if (res.data.user) {
                    setLogged(res.data.user);
                    navigate("/dashboard");
                }
                else {
                    setErrors(res.data);
                }
            })
            .catch(err => console.log(err))
    }


    return (
        <form className="col-5 mx-auto" onSubmit={handleSubmit}>
            <Input
                name="firstName"
                value={reg.firstName}
                error={errors.firstName}
                handleChange={handleInputChange}
                label="First Name:"
                type="text"
            />
            <Input
                name="lastName"
                value={reg.lastName}
                error={errors.lastName}
                handleChange={handleInputChange}
                label="Last Name:"
                type="text"
            />
            <Input
                name="email"
                value={reg.email}
                error={errors.email}
                handleChange={handleInputChange}
                label="Email:"
                type="email"
            />
            <Input
                name="password"
                value={reg.password}
                error={errors.password}
                handleChange={handleInputChange}
                label="Password:"
                type="password"
            />
            <Input
                name="confirmPassword"
                value={reg.confirmPassword}
                error={errors.confirmPassword}
                handleChange={handleInputChange}
                label="Confirm Password:"
                type="password"
            />
            <Input
                submitValue="Register"
                type="submit"
            />
            <br />
            <Link to="/login">Already have an account?</Link>
        </form>
    )
}

export default Reg;
EOF
echo "${green}>>> Created Reg.js${reset}"

cd $mainDir
./99_run.sh
#!/bin/bash

cd $PROJECT_FOLDER/server/controllers

cat >> loginReg.controller.js <<EOF 
const { User } = require('../models/user.model'),
    bcrypt = require('bcrypt'),
    jwt = require('jsonwebtoken');


module.exports = {
    register: (req, res) => {
        User.create(req.body)
            .then(user => {
                res
                    .cookie(
                        "usertoken",
                        jwt.sign({ _id: user._id }, process.env.SECRET_KEY),
                        {
                            httpOnly: true,
                        }
                    )
                    .json({msg: "success!", user: {
                            firstName: user.firstName,
                            lastName: user.lastName
                        }});
            })
            .catch(err => res.json(err.errors));
    },
    login: (req, res) => {
        User.findOne({ email: req.body.email })
            .then(user => {
                if (user == null) {
                    res.status(400).json({ msg: "Invalid login attempt!" })
                    res.cookie()
                }
                else {
                    bcrypt.compare(req.body.password, user.password)
                        .then(isValid => {
                            if (isValid === true) {
                                res
                                    .cookie(
                                        "usertoken",
                                        jwt.sign({ _id: user._id }, process.env.SECRET_KEY),
                                        {
                                            httpOnly: true,
                                        }
                                    )
                                    .json({msg: "success!", user: {
                                            firstName: user.firstName,
                                            lastName: user.lastName
                                        }});
                            }
                            else {
                                console.log('no success')
                                res.status(400).json({ msg: "Invalid login attempt!" })
                            }
                        })
                        .catch(err => {
                            console.log(err)
                            res.status(400).json({ msg: "Invalid login attempt!" })})
                }
            })
            .catch(err => res.status(400).json(err.errors));

    },
    logout: (req, res) => {
        res.clearCookie('usertoken');
        res.sendStatus(200);
    }
}
EOF
echo "${green}>>> Created loginReg.controller.js${reset}"

cd $mainDir
./07_p_s_controllers_user.sh
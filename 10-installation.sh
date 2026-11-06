#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "You must be root to run this script."
    exit 1
fi

echo "Installing Nginx"

dnf install nginx -y
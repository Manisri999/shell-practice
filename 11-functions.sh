#!/bin/bash

# Function to validate installation

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "You must be root to run this script."
    exit 1
fi

VALIDATE() {

    if [ $1 -ne 0 ]; then
        echo "$2 installation failed."
        exit 1
    else
        echo "$2 installed successfully."
    fi
}


dnf install nginx -y
VALIDATE $? "Installing nginx"

dnf install mysql -y
VALIDATE $? "Installing mysql"

dnf install nodejs -y
VALIDATE $? "Installing nodejs"


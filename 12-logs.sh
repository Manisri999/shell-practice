#!/bin/bash

# Function to validate installation

USERID=$(id -u)
LOGS_FOLDER-="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"


if [ $USERID -ne 0 ]; then
    echo "You must be root to run this script."
    exit 1
fi

mkdir -p $LOGS_FOLDER

VALIDATE() {

    if [ $1 -ne 0 ]; then
        echo "$2 installation failed."
        exit 1
    else
        echo "$2 installed successfully."
    fi
}


dnf install nginx -y &>> $LOGS_FILE
VALIDATE $? "Installing nginx"

dnf install mysql -y &>> $LOGS_FILE
VALIDATE $? "Installing mysql"

dnf install nodejs -y &>> $LOGS_FILE
VALIDATE $? "Installing nodejs"


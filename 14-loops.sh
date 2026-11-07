#!/bin/bash

# Function to validate installation

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"


if [ $USERID -ne 0 ]; then
    echo "You must be root to run this script."
    exit 1
fi

mkdir -p $LOGS_FOLDER

VALIDATE() {

    if [ $1 -ne 0 ]; then
        echo "$2 installation failed." | tee -a $LOGS_FILE
        exit 1
    else
        echo "$2 installed successfully." | tee -a $LOGS_FILE
    fi
}


for package in $@ #sudo sh 14-loops.sh nginx mysql nodejs
do
    dnf install $package -y &>>$LOGS_FILE
    VALIDATE $? "Installing $package"

done
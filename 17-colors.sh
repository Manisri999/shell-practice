#!/bin/bash

# Function to validate installation

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ $USERID -ne 0 ]; then
    echo -e "$R You must be root to run this script."
    exit 1
fi

mkdir -p $LOGS_FOLDER

VALIDATE() {

    if [ $1 -ne 0 ]; then
        echo -e "$2 installation $Rfailed." | tee -a $LOGS_FILE
        exit 1
    else
        echo -e "$2 installed $Ysuccessfully." | tee -a $LOGS_FILE
    fi
}



#The main purpose of this code is:

#Check whether each package is already installed. If it is installed, skip it. 
#Otherwise, install it and validate the installation.

for package in $@ #sudo sh 14-loops.sh nginx mysql nodejs
do
    dnf list installed $package &>>$LOGS_FILE
    if [ $? -ne 0 ]; then
        echo "$package is not installed. Installing $package..."
        dnf install $package -y &>>$LOGS_FILE
        VALIDATE $? "Installing $package"
    else
        echo -e "$package is already $Y installed."
    fi


done

#$@ represents all arguments passed to the script.

#Check whether the package is already installed
#dnf list installed $package &>>$LOGS_FILE


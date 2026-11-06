#!/bin/bash

#####special variables#####
echo "All aguments passed to the script: $@"
echo "No of vars passed to the script: $#"
echo "Name of the script: $0"
echo "PID of the script: $$"
echo "Present working directory: $PWD"
echo "who's logged in: $USER"
echo "Home directory: $HOME"
sleep 20 &
echo "PID of the last background process: $!"
echo "All args passed to the script: $*"


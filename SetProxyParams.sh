#!/bin/bash

# PREDEFINED VARIABLES SECTION 
HOST=$1
PORT=$2
USER=$3
PASS=$4
REST=$5
# INPUT VALIDATION WILL BE PERFORMED IN THE JAVA FOR SECURITY REASONS
if [[ ! $1 || $HOST = "usage" || $HOST = "Usage"  || $HOST = "USAGE" || $HOST = "u" || $HOST = "U" || $HOST = "-u" || $HOST = "-U" || $HOST = "help" ]]; then
		printf "Usage: run script with sudo and provide at least host and port separated by whitespace. \n If your proxy requires authentication add username and password as third and fourth parameters. \n If you want to use proxy in restrictive mode add -r parameter at the end.\n "
else
	echo "Storing values into applications preferences"
	/Applications/PingID.app/Contents/MacOS/ProxyHelperSetup $HOST $PORT $USER $PASS $REST 
fi
#!/bin/sh
# This script have to create cron to start log.sh and hodor.sh
# log.sh 1000files/second
# hodor.sh each 10 second

if [ ! $USER = root ]; then
	echo "You need to be root"
	exit
fi

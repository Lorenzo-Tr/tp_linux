#!/bin/sh
# This script have to create cron to start log.sh and hodor.sh
# log.sh 1000files/second
# hodor.sh each 10 second

if [ ! $USER = root ]; then
	echo "You need to be root"
	exit
fi

TMP_FILE=$(mktemp -q $PWD/XXXXXX)
sudo crontab -l > $TMP_FILE
echo "* * * * * time sudo sh $PWD/log.sh 50000 >> /tmp/log.sh.log" >> $TMP_FILE
sudo crontab -u root $TMP_FILE
rm $TMP_FILE

TMP_FILE=$(mktemp -q $PWD/XXXXXX)
sudo crontab -l > $TMP_FILE
echo "*/5 * * * * time sudo sh $PWD/hodor.sh 6 >> /tmp/hodor.sh.log" >> $TMP_FILE
sudo crontab -u root $TMP_FILE
rm $TMP_FILE

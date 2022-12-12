#!/bin/sh
# When used inode is > 80% archive all log file in /var/log/exercice/archives with a unique name 
# Print "HODOOOR !!!" to all term 

if [ ! $USER = root ]; then
    echo "You need to be root"
	exit
fi

if [ $# == 0 ]; then
	echo "You had to enter the max inode percentage"
	exit
fi

percent_inode_use=$(df -i /dev/sda3 | tail -n 1 | awk '{print substr($5, 1, length($5)-1)}')

mkdir -p /var/log/exercice/archives

if [ $percent_inode_use -gt $1 ]; then
    for pts in /dev/pts/*; do
        echo "HODOOOR !!!" > $pts   
    done 
    tar -zcvf $(mktemp -q /var/log/exercice/archives/XXXXXX.tar.gz) /var/log/exercice/recent_logs/ 
	rm -rf /var/log/exercice/recent_logs
fi

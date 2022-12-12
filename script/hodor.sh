#!/bin/sh
# When used inode is > 80% archive all log file in /var/log/exercice/archives with a unique name 
# Print "HODOOOR !!!" to all term 

if [ ! $USER = root ]; then
    echo "You need to be root"
fi

percent_inode_use=$(df -i /dev/sda3 | tail -n 1 | awk '{print substr($5, 1, length($5)-1)}')

mkdir -p /var/log/exercice/archives

if [ $percent_inode_use -gt 3 ]; then
    for pts in /dev/pts/*; do
        echo "HODOOOR !!!" > $pts   
    done 
    tar -zcvf $(mktemp -q XXXXXX.tar.gz) /var/log/exercice/recent_logs/ 
fi

#!/bin/sh
# When used inode is > 80% archive all log file in /var/log/exercice/archives with a unique name 
# Print "HODOOOR !!!" to all term 

percent_inode_use=$(df -i /dev/sda3 | tail -n 1 | awk '{print substr($5, 1, length($5)-1)}')

if [ $percent_inode_use -gt 3 ]; then 
    
fi

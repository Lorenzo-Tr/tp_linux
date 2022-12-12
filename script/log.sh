#!/bin/sh
# This script write 10 caraters from /dev/random in n files
# Each files have a unique name and will be save in /var/log/exercise/recent_logs

sudo mkdir -p /var/log/exercice/recent_logs/

for ((i=0;i<$1;i++))
do
    head -c 10 /dev/random    
    #head -c 10 /dev/random > /var/log/exercice/recent_logs
done

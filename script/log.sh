#!/bin/sh
# This script write 10 caraters from /dev/random in n files
# Each files have a unique name and will be save in /var/log/exercise/recent_logs
if [ "$USER" = "root" ]
then
    echo 
else
    echo You need to be root
fi

mkdir -p /var/log/exercice/recent_logs/

for ((i=0;i<$1;i++))
do
    TMP_FILE=$(mktemp -q /var/log/exercice/recent_logs/XXXXXX.log)
    head -c 10 /dev/random > $TMP_FILE
    echo $TMP_FILE
done

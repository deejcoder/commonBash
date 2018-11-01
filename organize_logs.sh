#!/bin/bash
# Belongs under CRON
LOG_PATH=/home/samp/logs
LOG_NAME=`date '+%d-%m-%Y_%H-%M-%S.log'`

current_log_size="$(stat -c%s '/home/samp/server_log.txt')"

if (( current_log_size < 100000000 )); # in bytes
then
        echo "The server_log is not big enough..."
else
        cp /home/samp/server_log.txt "$LOG_PATH/$LOG_NAME"
        truncate -s 0 /home/samp/server_log.txt
fi
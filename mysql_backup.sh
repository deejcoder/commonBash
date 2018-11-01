#!/bin/bash
# belongs under CRON
DB_HOST="dbhost"
DB_NAME="dbname"
DB_USER="dbuser"
DB_PASS="dbpass"

BACKUP_DIR="/backups/"
DATE=`date +%d-%m-%Y_%H-%M-%S`

mysqldump -u$DB_USER -p$DB_PASS -h$DB_HOST --databases $DB_NAME --lock-tables=false | gzip > $BACKUP_DIR/$DATE.gz

find $BACKUP_DIR -mmin +14400 -name "*.gz" -exec rm -rf {} \;
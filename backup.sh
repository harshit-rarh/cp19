#!/bin/bash

# Project 19 - Scheduled S3 Backup

SOURCE_DIR="$HOME/cp/19/backup/logs"
S3_BUCKET="s3://project19-scheduled-backup-590507089733"
DATE=$(date +%Y-%m-%d_%H-%M-%S)

echo "Starting Project 19 backup..."

aws s3 cp "$SOURCE_DIR/" "$S3_BUCKET/logs/$DATE/" \
    --recursive \
    --region ap-south-1

if [ $? -eq 0 ]; then
    echo "$(date): Backup successful" >> "$HOME/cp/19/backup.log"
else
    echo "$(date): Backup failed" >> "$HOME/cp/19/backup.log"
    exit 1
fi


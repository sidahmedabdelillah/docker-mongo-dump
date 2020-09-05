#!/bin/bash
#
# @description
# Script used to perform mongodump
# mongodump is the native mongo tool for dump ( https://docs.mongodb.com/manual/reference/program/mongodump/ )
#
# @author bwnyasse
##

set -e

echo "Job Dump started: $(date)"

DATE=$(date +%Y%m%d_%H%M%S)
FILE="/backup/$MONGO_BACKUP_FILENAME-$DATE.tar.gz"
OUTPUT="dump/"

mongodump --host $DB_HOST:27017 -- -u $DB_USER -p $DB_PWD --authenticationDatabase admin  --archive=$FILE --gzip -d DB_NAME 
echo "Job Dump finished: $(date)"
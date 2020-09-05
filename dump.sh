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

URI="mongodb://$DB_HOST:27017"
echo $URI

mongodump --host=$DB_HOST   -u $DB_USER -p $DB_PWD --authenticationDatabase admin -d $DB_NAME  --archive=$FILE   
echo "Job Dump finished: $(date)"
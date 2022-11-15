#!/bin/sh

# Storing database name in a variable. 
DATABASE='sales'

echo "Retrieving Database..."

# Folder for backup file(s), using default theia home directory here.
backupfolder=/home/theia/projects

#Storing the name of the backup file to be created in a variable.
sqlfile=$backupfolder/salesdata.sql

# Create a backup

if mysqldump  $DATABASE > $sqlfile ; then
   echo 'Sql backup created'
else
   echo 'pg_dump return non-zero code. No backup was created!' 
   exit
fi
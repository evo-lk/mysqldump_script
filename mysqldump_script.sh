#!/bin/bash
Host=your.mysql.database.url.com

read -p "Please type username given by admin: " mysqluser

read -p "Please type password given by admin: " mysqlpass

clear

mysql -h $Host -u$mysqluser -p"$mysqlpass" -e "show databases";

read -p "which should be the DB NAME that you want to backup on this time? " thedb

mysqldump -h $Host -u$mysqluser -p"$mysqlpass" $thedb > $thedb$(date +%d-%b-%Y).sql && zip $thedb.sql.zip $thedb.sql && echo "Done!!"

clear

ls -lsh
df -h
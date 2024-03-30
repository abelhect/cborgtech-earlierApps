#!/bin/sh

load_base(){
	echo "Dropping db ${1}"
   	mysqladmin -h ${2} -u root --password=7363@#MYSQL --force drop ${1}
	echo "Creating db ${1}"
  	mysqladmin -h ${2} -u root --password=7363@#MYSQL create ${1}
	echo "Loading main_db.sql to ${1}"
   	mysql -h ${2} -u root --password=7363@#MYSQL ${1} < /Users/abelhectMACHOME/git/toasthubweb/toasthubweb/src/main/resources/db-scripts/main_db.sql
   	echo "Loading main_db_data.sql to ${1}"
   	mysql -h ${2} -u root --password=7363@#MYSQL ${1} < /Users/abelhectMACHOME/git/toasthubweb/toasthubweb/src/main/resources/db-scripts/main_db_data.sql
	echo "Done Loading db ${1}"
	}
	
all() {
	load_base toasthub_main localhost
	}

all

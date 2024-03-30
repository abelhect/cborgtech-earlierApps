#!/bin/sh

load_base(){
	echo "Dropping db ${1}"
   	mysqladmin -h ${2} -u ${3} --password=${4} --force drop ${1}
	echo "Creating db ${1}"
  	mysqladmin -h ${2} -u ${3} --password=${4} create ${1}
	echo "Loading main_db.sql to ${1}"
   	mysql -h ${2} -u ${3} --password=${4} ${1} < ../toasthub/main_db.sql
   	echo "Loading main_db_data.sql to ${1}"
   	mysql -h ${2} -u ${3} --password=${4} ${1} < ../toasthub/main_db_data.sql
	echo "Loading app_main_db_data.sql to ${1}"
   	mysql -h ${2} -u ${3} --password=${4} ${1} < app_main_db_data.sql
	echo "Done Loading db ${1}"
	}
	
all() {
	load_base gatedog_main localhost cyborg c7b8rg
	}

all

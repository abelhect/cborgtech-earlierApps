#!/bin/sh

load_base(){
	echo "Dropping db ${1}"
   	mysqladmin -h ${2} -u ${3} --password=${4} --force drop ${1}
	echo "Creating db ${1}"
  	mysqladmin -h ${2} -u ${3} --password=${4} create ${1}
	echo "Loading client_db.sql to ${1}"
   	mysql -h ${2} -u ${3} --password=${4} ${1} < ../toasthub/client_db.sql
   	echo "Loading base_db_data.sql to ${1}"
   	mysql -h ${2} -u ${3} --password=${4} ${1} < ../toasthub/base_db_data.sql
   	echo "Loading admin_db_data.sql to ${1}"
	mysql -h ${2} -u ${3} --password=${4} ${1} < ../toasthub/admin_db_data.sql
	echo "Done Loading db ${1}"
	}
	
all() {
	load_base cborgfire_client1 localhost cyborg c7b8rg
	}
	
all
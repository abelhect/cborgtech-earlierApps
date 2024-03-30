#!/bin/sh

dump_db() {
   echo "Exporting dbdump ${1}"
   mysqldump -v -C --single-transaction --quick \
   -u root --password=7363@#MYSQL \
   -h localhost \
   --ignore-table prod_main.LogMessages \
   -r /Users/abelhectMACHOME/Documents/toasthub/test/${1}.sql ${1}
}

load_db() {
   	echo "Dropping db ${1}"
   	mysqladmin -u root --password=7363@#MYSQL --force drop ${1}
	echo "Creating db ${1}"
  	mysqladmin -u root --password=7363@#MYSQL create ${1}
	echo "Loading db ${1}"
   	mysql -h ${2} -u root --password=7363@#MYSQL ${1} < ${3}
	echo "Done Loading db ${1}"
}

load_base(){
	echo "Dropping db ${1}"
   	mysqladmin -h ${2} -u root --password=7363@#MYSQL --force drop ${1}
	echo "Creating db ${1}"
  	mysqladmin -h ${2} -u root --password=7363@#MYSQL create ${1}
	echo "Loading client_db.sql to ${1}"
   	mysql -h ${2} -u root --password=7363@#MYSQL ${1} < /Users/abelhectMACHOME/git/toasthubweb/toasthubweb/src/main/resources/db-scripts/client_db.sql
   	echo "Loading base_db_data.sql to ${1}"
   	mysql -h ${2} -u root --password=7363@#MYSQL ${1} < /Users/abelhectMACHOME/git/toasthubweb/toasthubweb/src/main/resources/db-scripts/base_db_data.sql
   	echo "Loading admin_db_data.sql ${1}"
	mysql -h ${2} -u root --password=7363@#MYSQL ${1} < /Users/abelhectMACHOME/git/toasthubweb/toasthubweb/src/main/resources/db-scripts/admin_db_data.sql
	echo "Done Loading db ${1}"
	}
	
all() {
	load_base cthreat_client1 localhost
	load_base toasthub_client1 localhost
	}
	
all
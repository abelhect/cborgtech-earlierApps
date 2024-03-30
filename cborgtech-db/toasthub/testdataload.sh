#!/bin/sh

load_base(){
	echo "Loading main base db ${1}"
   	mysql -h ${2} -u toasthubadmin --password=toast#Hub123 < /Users/seufster/Documents/projects/dodream/src/main/resources/db-scripts/testdata.sql
	echo "Done Loading db ${1}"
	}
	
all() {
	load_base dodream_main localhost
	}

all

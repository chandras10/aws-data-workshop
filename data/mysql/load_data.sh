#!/bin/bash -xe

init () {
  echo "Unzipping $1 ..."
  
  file=$1
  if [ ${file: -3} == ".gz" ]; then
     time gzip -d $file
  fi
}

insert_db () {
  echo "Inserting data from $1 ..."
  time mysql -h $RDS_HOST -u master -p$MYSQL_PWD emptest < $1
}

cleanup () {
  echo "Zipping $1 ..."
  file=$1
  if [ ${file: -4} == ".sql" ]; then
     time gzip -9 $file
  fi
}

load_data () {
    name=`basename $1 .gz`
    if ([ -f $1 ] || [ -f $name ]); then
       init $1
       insert_db $name
       cleanup $name
    fi
}


echo "----- Start Job -----"
date
echo "Creating database..."

mysql -h $RDS_HOST -u master -p$MYSQL_PWD < emptest_schema.sql

echo "loading data..."

load_data cdc_counters.sql.gz
load_data departments.sql.gz
load_data employees.sql.gz
load_data dept_manager.sql.gz
load_data salaries.sql.gz
load_data titles.sql.gz

date
echo "----- End Job -----"

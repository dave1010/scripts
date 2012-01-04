#!/bin/bash

# Update the "siteurl" and "home" in the DB of a WordPress install

read -p "MySQL DB: " MYSQLDB
if [[ -z $MYSQLDB ]]
then
	echo "You need a database"
	exit 1
fi

read -p "WordPress home URL (including http://, no trailing slash): " WPHOME
if [[ -z $WPHOME ]]
then
	echo "You need a URL"
	exit 1
fi

read -p "MySQL host [localhost]: " MYSQLHOST
if [[ -z $MYSQLHOST ]]
then
	MYSQLHOST="localhost"
fi

read -p "MySQL user [root]: " MYSQLUSER
if [[ -z $MYSQLUSER ]]
then
	MYSQLUSER="root"
fi

read -p "WordPress prefix [wp_]: " WPPREFIX
if [[ -z $WPPREFIX ]]
then
	WPPREFIX="wp_"
fi

SQL="update ${WPPREFIX}options set option_value=\"$WPHOME\" where option_name like \"home\" or option_name like \"siteurl\"; select option_name, option_value from ${WPPREFIX}options where option_name like \"home\" or option_name like \"siteurl\";"

echo $SQL | mysql -v -v -v -h $MYSQLHOST -u $MYSQLUSER $MYSQLDB


#!/bin/bash

if [ ! -d "/var/run/mysqld" ];then
	mkdir -p /var/run/mysqld
	chown -R mysql:mysql /var/run/mysqld
fi

if [ ! -d "/var/lib/mysql/db" ];then
	mkdir -p /var/lib/mysql/db
	mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
	service mariadb start
	chown -R mysql:mysql /var/lib/mysql && chmod 777 /var/lib/mysql
	chmod 777 /var/run/mysqld/mysqld.sock
	mysql_upgrade
fi

chmod 1777 /var/run/mysqld
cp /tmp/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
service mariadb start
mariadb -e "CREATE DATABASE $DATABASE;"
mariadb -e "USE $DATABASE"
mariadb -e "CREATE USER '$USER'@'%' IDENTIFIED BY '$PASSWORD';"
mariadb -e "GRANT ALL PRIVILEGES ON $DATABASE.* TO '$USER'@'%' IDENTIFIED BY '$PASSWORD';"
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASSWORD';"
mariadb -uroot --password=$ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
mysqladmin -uroot -p$ROOT_PASSWORD shutdown

exec mariadbd




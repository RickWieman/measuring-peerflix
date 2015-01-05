#!/bin/bash

# Provisioning script for the Tracker.
# NB: Run this script as root!

echo ">> Installing Apache/PHP/MySQL/git..."

yum install -y httpd php mysql-server php-mysql git

echo ">> Starting services (not yet enabling autostart)..."

mkdir -p /var/www/html/
/etc/init.d/httpd start
/etc/init.d/mysqld start

echo ">> Creating database (will fail if it already exists)..."
mysql -u root -e "CREATE DATABASE peertracker"

if [ ! -f /var/www/html/announce.php ]; then
	echo ">> Cloning peertracker and creating symbolic links..."
	rm -r /var/www/html/
	git clone git://github.com/RickWieman/peertracker.git /var/www/html/

	ln -s /var/www/html/mysql/announce.php /var/www/html/announce.php
	ln -s /var/www/html/mysql/scrape.php /var/www/html/scrape.php
	ln -s /var/www/html/mysql/tracker.mysql.php /var/www/html/tracker.mysql.php
fi

echo ">> Initializing the database..."
php-cgi /var/www/html/help.php do=setup_mysql > /dev/null

echo ">> Done! Your tracker URI will be http://<server address>/announce.php"

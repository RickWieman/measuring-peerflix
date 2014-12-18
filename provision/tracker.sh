#!/bin/bash

# Provisioning script for the Tracker.
# NB: Run this script as root!

echo ">> Installing Apache/PHP/MariaDB/git..."

yum install -y httpd php mariadb-server php-mysql git

echo ">> Starting services and enabling autostart..."

mkdir -p /var/www/html/
chkconfig httpd on
service httpd start

chkconfig mariadb on
service mariadb start

echo ">> Creating database (will fail if it already exists)..."

mysql -u root -e "CREATE DATABASE peertracker"

if [ ! -f /var/www/html/announce.php ]; then
	echo ">> Cloning peertracker and creating symbolic links..."
	git clone https://github.com/RickWieman/peertracker.git /var/www/html/

	ln -s /var/www/html/mysql/announce.php /var/www/html/announce.php
	ln -s /var/www/html/mysql/scrape.php /var/www/html/scrape.php
	ln -s /var/www/html/mysql/tracker.mysql.php /var/www/html/tracker.mysql.php
fi

echo ">> Allowing incoming connections on port 80..."
iptables -I INPUT 1 -p tcp --dport 80 -j ACCEPT

echo ">> Initializing the database..."
php-cgi /var/www/html/help.php do=setup_mysql > /dev/null

echo ">> Done! Your tracker URI will be http://<server address>/announce.php"
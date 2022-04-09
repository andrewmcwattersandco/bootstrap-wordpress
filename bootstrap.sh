#!/bin/sh

sudo apt-get update

# https://wordpress.org/download/#download-install
sudo apt-get -y install \
  php \
  mysql-server \
  apache2 \
  php-mysql

# https://wordpress.org/support/article/how-to-install-wordpress/#detailed-instructions
wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz -C /var/www/html --strip-components=1 # wordpress/
mv /var/www/html/index.html /var/www/html/index.html~

# https://dev.mysql.com/doc/refman/8.0/en/resetting-permissions.html
# https://dev.mysql.com/doc/refman/8.0/en/alter-user.html
mysql --user=root --execute="ALTER USER 'root'@'localhost'
  IDENTIFIED WITH mysql_native_password
             BY '';
"

# https://dev.mysql.com/doc/refman/8.0/en/create-database.html
# https://dev.mysql.com/doc/refman/8.0/en/create-user.html
# https://dev.mysql.com/doc/refman/8.0/en/grant.html
# https://wordpress.org/support/article/how-to-install-wordpress/#using-phpmyadmin
mysql --user=root --execute="CREATE DATABASE wordpress;
CREATE USER 'wordpress'@'localhost' IDENTIFIED BY '';
GRANT ALL ON wordpress.* TO 'wordpress'@'localhost';
"

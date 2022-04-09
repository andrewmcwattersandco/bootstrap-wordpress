#!/bin/sh

sudo apt-get update

# https://wordpress.org/download/#download-install
sudo apt-get -y install \
  php \
  mysql-server \
  apache2

# https://wordpress.org/support/article/how-to-install-wordpress/#detailed-instructions
wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz

# https://dev.mysql.com/doc/refman/8.0/en/resetting-permissions.html
# https://dev.mysql.com/doc/refman/8.0/en/alter-user.html
mysql --user=root --execute="ALTER USER 'root'@'localhost'
  IDENTIFIED WITH mysql_native_password
             BY '';
"

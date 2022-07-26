#!/bin/sh

# https://wordpress.org/download/#download-install

# php-mysql:
# "Your PHP installation appears to be missing the MySQL extension which is
# required by WordPress."

# sendmail:
# "Your site may not be correctly configured to send emails."

sudo apt-get update
sudo apt-get -y install \
  php \
  mysql-server \
  apache2 \
  php-mysql \
  php-gd

# https://man7.org/linux/man-pages/man5/hosts.5.html#EXAMPLES
# sudo nano /etc/hosts e.g. 198.51.100.0 (public Internet) fqdn hostname
# 127.0.1.1       thishost.mydomain.org  thishost
# sudo echo "$(curl https://checkip.amazonaws.com)\tfqdn hostname" >> /etc/hosts
# or
# sudo echo "$(dig @ns1.google.com o-o.myaddr.l.google.com TXT +short | tr -d \")\tfqdn hostname" >> /etc/hosts
# TXT Record @ v=spf1 a:thishost.mydomain.org ~all Automatic
sudo apt-get -y install sendmail

# https://wordpress.org/support/article/how-to-install-wordpress/#detailed-instructions
# https://wordpress.org/support/article/how-to-install-wordpress/#step-1-download-and-extract
wget https://wordpress.org/latest.tar.gz
sudo tar -xzvf latest.tar.gz -C /var/www/html --strip-components=1 # wordpress/
sudo mv /var/www/html/index.html /var/www/html/index.html~

# https://wordpress.org/support/article/how-to-install-wordpress/#step-2-create-the-database-and-a-user
# https://dev.mysql.com/doc/refman/8.0/en/create-database.html
# https://dev.mysql.com/doc/refman/8.0/en/create-user.html
# https://dev.mysql.com/doc/refman/8.0/en/grant.html
sudo mysql --user=root --execute="CREATE DATABASE wordpress;
CREATE USER 'wordpress'@'localhost' IDENTIFIED BY '';
GRANT ALL ON wordpress.* TO 'wordpress'@'localhost';
"

# https://wordpress.org/support/article/how-to-install-wordpress/#step-3-set-up-wp-config-php
sudo chown -R www-data /var/www/html

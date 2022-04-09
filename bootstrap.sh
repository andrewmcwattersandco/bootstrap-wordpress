#!/bin/sh

sudo apt-get update

# https://wordpress.org/download/#download-install
sudo apt-get -y install \
  php \
  mysql-server \
  apache2

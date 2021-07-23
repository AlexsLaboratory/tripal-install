#!/bin/bash

# Install PHP 7.0
sudo $1/sub_scripts/expect/php.exp
sudo apt-get update
sudo apt-get install libapache2-mod-php7.0 php7.0-pgsql php7.0-xml php7.0-gd php7.0-curl php7.0-mbstring php7.0-cli -y
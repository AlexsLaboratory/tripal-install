#!/bin/bash

# Install Composer
sudo apt-get install curl git unzip -y
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
composer self-update
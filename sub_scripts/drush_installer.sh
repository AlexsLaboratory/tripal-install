#!/bin/bash

sudo git clone https://github.com/drush-ops/drush.git /usr/local/src/drush
cd /usr/local/src/drush
sudo git checkout 8.1.15
sudo ln -s /usr/local/src/drush/drush /usr/bin/drush8
sudo $1/sub_scripts/expect/composer_install.exp
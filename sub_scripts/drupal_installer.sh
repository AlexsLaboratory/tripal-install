#!/bin/bash

# Install Drupal 7
sudo wget https://ftp.drupal.org/files/projects/drupal-7.81.tar.gz -P /tmp/
cd /tmp
sudo tar -xvzf drupal-7.81.tar.gz
sudo mkdir /var/www/drupal
sudo mv drupal-7.81/* /var/www/drupal
sudo rm drupal-7.81.tar.gz
sudo rm -rf drupal-7.81
cd /var/www/drupal
sudo $1/sub_scripts/expect/composer_init.exp
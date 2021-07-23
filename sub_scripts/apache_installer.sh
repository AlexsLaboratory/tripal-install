#!/bin/bash

# Install apache2
sudo apt-get install apache2 -y
sudo a2enmod rewrite
sudo a2dissite 000-default
sudo cp $1/resources/drupal-conf.conf /etc/apache2/conf-available/drupal.conf
sudo cp $1/resources/drupal-site.conf /etc/apache2/sites-available/drupal.conf
sudo a2enconf drupal
sudo a2ensite drupal
systemctl restart apache2
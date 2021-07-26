#!/bin/bash

if [[ $EUID -eq 0 ]]; then
  echo "This script must NOT be run as root" 1>&2
  exit 1
fi

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# Update system
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install expect -y

# Set Permissions
sudo chmod o+x $HOME
sudo chmod -R o+x $HOME/install_script

# Ask postgres install info
echo -e "\e[32mEnter Desired postgres credentials\e[0m"
read -p "Username: " username
read -p "Password: " password
read -p "Database: " database

sudo sub_scripts/php_installer.sh $SCRIPTPATH
sudo sub_scripts/composer_installer.sh
sudo sub_scripts/apache_installer.sh $SCRIPTPATH
sudo sub_scripts/expect/postgres.exp $username $password $database
sudo sub_scripts/drupal_installer.sh $SCRIPTPATH
sudo sub_scripts/drush_installer.sh $SCRIPTPATH
sudo sub_scripts/edit_hosts.sh

# Drupal Setup
sudo chmod a+w /var/www/drupal/sites/default
sudo cp /var/www/drupal/sites/default/default.settings.php /var/www/drupal/sites/default/settings.php
sudo chmod a+w /var/www/drupal/sites/default/settings.php

# Display User Credentials
echo -e "\e[32mYour Credentials For postgres Are:\e[0m"
echo -e "\e[33mDB Username: \e[1m$username\e[0m"
echo -e "\e[33mUser \e[1m$username \e[21mPassword: \e[1m$password\e[0m"
echo -e "\e[33mUser postgres Password: \e[1m$password\e[0m"
echo -e "\e[33mDB Name: \e[1m$database\e[0m"

# Go to http://tripal.local
echo -e "\e[32mGo to http://tripal.local in your browser to continue setup\e[0m"
read -p "Once done press [ENTER] to continue"

# Remove Permissions
sudo chmod o-x $HOME
sudo chmod -R o-x $HOME/install_script
sudo chmod go-w /var/www/drupal/sites/default
sudo chmod go-w /var/www/drupal/sites/default/settings.php

# Install Tripal v3
sudo sub_scripts/expect/tripal_install.exp
echo -e "\e[32mGo to https://tripal.readthedocs.io/en/latest/user_guide/install_tripal/manual_install/install_tripal.html to setup Chado\e[0m"
read -p "Once done press [ENTER] to continue"

# Purge
sudo apt-get autoremove expect -y
sudo apt-get autoremove -y
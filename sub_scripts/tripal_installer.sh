#!/bin/bash

# Install Tripal
cd /var/www/drupal/sites/all/modules
sudo drush8 pm-download entity
sudo drush8 pm-enable entity
sudo drush8 pm-download views ctools
sudo drush8 pm-enable views views_ui ctools
sudo drush8 pm-download ds field_group field_group_table field_formatter_class field_formatter_settings
sudo drush8 pm-enable ds field_group field_group_table field_formatter_class field_formatter_settings
sudo drush8 pm-download ckeditor
drush8 pm-enable ckeditor
sudo drush8 pm-download jquery_update
sudo drush8 pm-enable jquery_update
sudo drush8 pm-download tripal
cd /var/www/drupal
sudo wget --no-check-certificate https://drupal.org/files/drupal.pgsql-bytea.27.patch
sudo patch -p1 < drupal.pgsql-bytea.27.patch
cd /var/www/drupal/sites/all/modules/views_ui
sudo patch -p1 < ../tripal/tripal_chado_views/views-sql-compliant-three-tier-naming-1971160-30.patch
cd /var/www/drupal/sites/all/modules
sudo drush8 pm-enable tripal
sudo drush8 pm-enable tripal_chado
sudo drush8 pm-enable tripal_ds tripal_ws
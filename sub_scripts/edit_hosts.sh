#!/bin/bash

# Edit hosts file
sudo su -c 'sed -i "2i 127.0.0.1       tripal.local" /etc/hosts'
sudo systemctl restart NetworkManager
sudo systemctl restart apache2
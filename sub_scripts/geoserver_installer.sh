#!/bin/bash

# Geoserver Install
sudo apt-get install openjdk-11-jre -y
wget https://sourceforge.net/projects/geoserver/files/GeoServer/2.19.2/geoserver-2.19.2-bin.zip -P /tmp/
sudo unzip /tmp/geoserver-2.19.2-bin.zip -d /usr/share/geoserver
sudo chown -R $USER /usr/share/geoserver/
echo "export GEOSERVER_HOME=/usr/share/geoserver" >> ~/.bashrc
source ~/.bashrc
sudo ln -s /usr/share/geoserver/bin/startup.sh /usr/bin/geoserver
echo -e "You can start geoserver by typing \e[32m\"geoserver\"\e[0m into the command line"
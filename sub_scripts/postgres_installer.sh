#!/bin/bash

sudo apt-get install postgresql postgresql-contrib -y
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '${2}';"
psql -h 127.0.0.1 -U postgres -c "CREATE USER $1 WITH ENCRYPTED PASSWORD '${2}';"
sudo -u postgres createdb --encoding=UNICODE --owner=$1 $3
psql -h 127.0.0.1 -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE $3 TO $1";
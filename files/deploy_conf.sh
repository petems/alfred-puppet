#!/bin/bash
set -e
source ~/.bashrc
cd /$HOME/superuser-conf
git checkout $1
git pull
git checkout $2
cp ./.env /var/www/superuser/.env
sudo /sbin/restart puma app=/var/www/superuser
echo "$1 - $2" > /var/www/superuser/public/version-conf.txt

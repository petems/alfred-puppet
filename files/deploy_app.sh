#!/bin/bash
set -e
source ~/.bashrc
cd /var/www/superuser
export RACK_ENV=`grep -o 'RACK_ENV=[^,]*' .env | sed 's/^.*=//'`
echo "Deploying with RACK_ENV= $RACK_ENV"
git checkout $1
git pull
git checkout $2
bundle install
bundle exec rake assets:precompile
sudo /sbin/stop puma app=/var/www/superuser
bundle exec rake db:migrate
sudo /sbin/start puma app=/var/www/superuser
echo "Branch: $1 - Commit: $2 - RACK_ENV: $RACK_ENV" > /var/www/superuser/public/version.txt

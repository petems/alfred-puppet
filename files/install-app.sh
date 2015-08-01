#!/bin/bash
source /usr/local/rvm/scripts/rvm
source /var/www/alfred/.env

export PADRINO_ENV=production

echo "Running bundle install"
cd /var/www/alfred && bundle install --without development test

#echo "Running migrations"
cd /var/www/alfred && bundle exec rake db:migrate

# echo "Load default data"
cd /var/www/alfred && bundle exec rake db:seed
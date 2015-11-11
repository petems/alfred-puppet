# Alfred Puppet Module

## Overview

This module allows to setup a full production ready Alfred application instance.


## Module Description

This module takes care of installing base software and the application it self:

* Git
* Ruby and RVM
* PostgresSQL
* Nginx


The applicacion is installed as a service with Upstart
The application is installed under __/var/www/alfred__.


## Running acceptance test

bundle exec rspec spec/acceptance


## Usage with Vagrant

In the _vagrant_ directory there is a vagrant configuration ready to use, just go to that directory en execute _vagrant up_.


## Limitations

This module was tested on Ubuntu 14.04.



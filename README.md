# Alfred Puppet Module

[![Build Status](https://travis-ci.org/nicopaez/alfred-puppet.svg?branch=master)](https://travis-ci.org/nicopaez/alfred-puppet)
[![Puppet Forge](https://img.shields.io/puppetforge/v/nicopaez/alfred.svg)](https://forge.puppetlabs.com/nicopaez/alfred)
[![Puppet Forge](https://img.shields.io/puppetforge/f/nicopaez/alfred.svg)](https://forge.puppetlabs.com/nicopaez/alfred)

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



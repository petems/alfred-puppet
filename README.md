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



## Usage with Vagrant

1. Install Puppet in your host.
2. Clone this repository: _git clone https://github.com/nicopaez/alfred-puppet.git_
3. Build the module by running : _puppet module build alfred-puppet_
4. Install the module by running: _puppet module install <path_to_built_package>
5. Create a Vagrantfile with the content below
6. Create a manifest folder with the and place the file alfred.pp inside it


```
# Vagrantfile
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifest_file  = "alfred.pp"
    puppet.module_path = "/.puppet/modules"
  end

end

```

# alfred.pp

```
class { 'alfred': 
  db_user => 'alfred',
  db_pass => 'mypassword'
} 
```
## Limitations

This module was tested on Ubuntu 14.04.



class alfred::foundation {

  include git

  user { 'deployer':
    ensure     => 'present',
    home       => '/home/deployer',
    managehome => true,
  }

  class { 'postgresql::globals':
    manage_package_repo => true,
    version             => '9.3',
  } ->
  class { 'postgresql::server': }

  postgresql::server::db { 'alfred':
    user     => $alfred::db_user,
    password => postgresql_password($alfred::db_user, $alfred::db_pass),
    before   => Package['git'],
  }

  postgresql::server::role { "${alfred::db_user}":
    superuser     => true,
    password_hash => postgresql_password($alfred::db_user, $alfred::db_pass),
  }

  class { 'postgresql::lib::devel': }

  package { 'postgresql-server-dev-9.3':
    ensure => 'installed'
  }

  class { 'nginx': }
  
  nginx::resource::upstream { 'alfred_app':
    members => ['127.0.0.1:3000'],
  }->
  file { '/etc/nginx/sites-available/alfred.com.conf':
    ensure  => present,
    content => template('alfred/alfred.com.conf.erb')
  }->
  file { '/etc/nginx/sites-enabled/alfred.com.conf':
    ensure => 'link',
    target => '/etc/nginx/sites-available/alfred.com.conf',
  }

}
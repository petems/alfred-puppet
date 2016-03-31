class alfred::app {
  
  file { '/var/www':
    ensure => directory,
    owner  => 'deployer',
  }

  file { '/home/deployer':
    ensure => directory,
    owner  => 'deployer',
  }

  exec { 'clone-repo':
    command   => 'git clone https://github.com/fiuba/alfred.git /var/www/alfred',
    path      =>  [ '/bin', '/usr/bin', '/usr/local/bin' ],
    logoutput => true,
    #user      => 'deployer',
  }->
  file { '/var/www/alfred':
    ensure => directory,
    owner  => 'deployer',
  }  

  file { '/var/www/alfred/.env':
    ensure  => present,
    content => template('alfred/env.erb')
  }

  file {
    'installer_app.sh':
      ensure  => 'present',
      path    => '/home/deployer/install_app.sh',
      owner   => 'deployer',
      group   => 'deployer',
      source  => 'puppet:///modules/alfred/install-app.sh',
      mode    => '0744',
      require =>  File['/home/deployer'],
  }

  exec { 'install-app':
    command   => '/home/deployer/install_app.sh',
    path      =>  [ '/bin', '/usr/bin', '/usr/local/bin' ],
    logoutput => true,
    user      => 'deployer',
    timeout   => 1800,
    require   => [File['/var/www/alfred/.env'],File['installer_app.sh']],
  }

  file {
    'temp_directory':
      ensure => 'directory',
      path   => '/var/www/alfred/tmp',
      owner  => 'alfred',
      group  => 'alfred',
      mode   => 'o+w',
  }

  file { '/etc/init/alfred.conf':
    ensure  => present,
    content => template('alfred/alfred.conf.erb')
  }
  
}

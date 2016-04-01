class alfred::services {

  service { 'alfred':
    ensure   => running,
    enable => true,
    provider => 'upstart',
    require => File['/etc/init/alfred.conf']
  }

}
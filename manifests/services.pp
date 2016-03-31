class alfred::services {

  service { 'alfred':
    ensure   => running,
    enable => true,
    provider => 'upstart',
  }

}
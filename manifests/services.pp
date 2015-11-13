class alfred::services {

  service { 'alfred':
    ensure   => running,
    provider => 'upstart',
  }

}
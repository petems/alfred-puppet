class alfred (
  $db_user = 'alfred',
  $db_pass = 'mypassword',
  $code_repository = $::alfred::params::code_repository,
  $code_branch = $::alfred::params::code_branch,
  $conf_repository = undef,
  $config_branch = $::alfred::params::conf_branch,
  $ssh_key = undef
) inherits ::alfred::params {

  class apt_update {
    exec { 'do_apt_update':
      command => '/usr/bin/apt-get update',
      timeout => 300,
    }
  }

  stage { 'init': before  => Stage['main'] }

  class { 'apt_update':
    stage => init
  }

  class { 'alfred::foundation': }

  class { 'alfred::ruby': }

  class { 'alfred::app':
    require => [Class['alfred::ruby'], Class['alfred::foundation']],
  }->
  class { 'alfred::services': }
}

class alfred::ruby {

  include rvm

  rvm::system_user { ubuntu:  ; alfred: ; root: ; deployer: ;}

  rvm_system_ruby { 'ruby-1.9.3':
    ensure      => 'present',
    default_use => true,
  } -> notify {'ruby-ready':
        message => 'Ruby installation is ready',
      }

  rvm_gem { 'bundler':
    name         => 'bundler',
    ruby_version => 'ruby-1.9.3',
    ensure       => latest,
    require      => Rvm_system_ruby['ruby-1.9.3'];
  }

}
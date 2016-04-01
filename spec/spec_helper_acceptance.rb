require 'puppet'
require 'beaker-rspec'
require 'pry'

hosts.each do |host|
  install_puppet_on host
end

RSpec.configure do |c|
  module_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  c.formatter = :documentation
  c.before(:each) do
    Puppet::Util::Log.level = :warning
    Puppet::Util::Log.newdestination(:console)
  end

  c.before :suite do
    hosts.each do |host|
        install_dev_puppet_module_on(host, :source => module_root, :module_name => 'alfred',
          :target_module_path => '/etc/puppet/modules')

      on host, puppet('module', 'install', 'puppetlabs-stdlib'), { :acceptable_exit_codes => [0,1] }
      on host, puppet('module', 'install', 'jfryman-nginx'), { :acceptable_exit_codes => [0,1] }
      on host, puppet('module', 'install', 'puppetlabs-git'), { :acceptable_exit_codes => [0,1] }
      on host, puppet('module', 'install', 'maestrodev-rvm'), { :acceptable_exit_codes => [0,1] }
      on host, puppet('module', 'install', 'puppetlabs-postgresql'), { :acceptable_exit_codes => [0,1] }
      on host, puppet('module', 'install', 'puppetlabs-vcsrepo'), { :acceptable_exit_codes => [0,1] }
    end
  end
end

require 'beaker-rspec'
require 'pry'

hosts.each do |host|
  # Install Puppet
  install_puppet_on host
end

RSpec.configure do |c|
  module_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  
  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do
    # Install module
    puppet_module_install(:source => module_root, :module_name => 'nicopaez-alfred')

    #hosts.each do |host|
      #install_dev_puppet_module_on(host, :source => module_root, :module_name => 'nicopaez-alfred',:target_module_path => '/etc/puppet/modules')
    #  on host, puppet('module','install','puppetlabs-stdlib'), { :acceptable_exit_codes => [0,1] }
    #end
  end
end
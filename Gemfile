source 'https://rubygems.org'

ruby '2.1.5'

puppetversion = ENV.key?('PUPPET_VERSION') ? "= #{ENV['PUPPET_VERSION']}" : ['>= 3.3']
gem 'puppet', puppetversion, :require => false

group :development, :test do
  gem 'puppetlabs_spec_helper', '>= 0.1.0'
  gem 'puppet-lint', '>= 0.3.2'
end

group :system_tests do
  gem 'beaker-puppet_install_helper', :require => false
  gem 'beaker-rspec', :require => false
  gem 'beaker', :require => false
end

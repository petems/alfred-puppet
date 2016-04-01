require 'spec_helper_acceptance'

describe 'alfred class' do

  it 'should run without errors' do
    pp = <<-EOS
            class { 'alfred':
              db_user       => 'alfred',
              db_pass       => 'mypassword',
              config_branch => 'production',
              ssh_key       => 'xxxxx'
            }
          EOS
    result = apply_manifest(pp)
    expect(@result.exit_code).to eq 0
  end

  describe service('nginx') do
    it { is_expected.to be_running }
    it { is_expected.to be_enabled }
  end

  describe service('alfred') do
    it { is_expected.to be_running }
    it { is_expected.to be_enabled }
  end

  describe file('/var/www/alfred') do
    it { should be_directory }
  end

  describe file('/etc/init/alfred.conf') do
    it { should exist }
  end

  describe 'alfred app' do
    it 'should be running on port 80' do
      sleep 5
      shell("curl http://localhost/login | grep Alfred", :acceptable_exit_codes => 0)
    end

    it 'should be running on port 3000' do
      sleep 5
      shell("curl http://localhost:3000/login | grep Alfred", :acceptable_exit_codes => 0)
    end

  end

end
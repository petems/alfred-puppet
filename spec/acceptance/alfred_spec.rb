require 'spec_helper_acceptance'

describe 'alfred class' do

  it 'should run without errors' do
    pp = <<-EOS
            class { 'alfred':
              db_user       =>  'adnub',
              db_pass       => 'jEcr65aPhufr',
              config_branch => 'production',
              ssh_key       => 'xxxxx'
            }
          EOS
    result = apply_manifest(pp, :trace => true, :debug => true, :catch_failures => true)
  end

  describe service('nginx') do
    it { is_expected.to be_running }
    it { is_expected.to be_enabled }
  end

end

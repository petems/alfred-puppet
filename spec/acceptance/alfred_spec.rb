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
    result = apply_manifest(pp)
    expect(@result.exit_code).to eq 0
    shell("curl http://alfred-production.herokuapp.com/login | grep Alfred", :acceptable_exit_codes => 0)
  end

  #describe port(80) do
  #  it { should be_listening }
  #end

end
require 'spec_helper_acceptance'

describe 'alfred::ruby class' do

  describe 'installation' do

    it 'should install 1.9.3' do
      shell("ruby --version | grep 1.9.3", :acceptable_exit_codes => 0)
    end

  end

end
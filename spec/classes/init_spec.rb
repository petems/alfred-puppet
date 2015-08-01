require 'spec_helper'
describe 'superuser' do

  context 'with defaults for all parameters' do
    it { should contain_class('superuser') }
  end
end

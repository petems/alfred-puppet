require 'spec_helper'
describe 'alfred' do

  context 'with defaults for all parameters' do
    it { should contain_class('alfred') }
  end
end

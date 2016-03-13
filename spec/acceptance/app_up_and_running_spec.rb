require 'spec_helper_acceptance'

describe 'alfred::app' do

	it 'should be running on port 8080' do
	  shell("curl http://alfred-production.herokuapp.com/login | grep Alfred", :acceptable_exit_codes => 0)
	end

end
require 'spec_helper'

describe 'w_varnish::hosts' do

	describe host('0varnish.examplewebsite.com') do
    it { should be_resolvable.by('hosts') }
    its(:ipaddress) { should eq '172.31.2.12' }
  end
        
end
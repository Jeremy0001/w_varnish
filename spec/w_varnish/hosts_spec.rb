require_relative '../spec_helper'

describe 'w_varnish::hosts' do

	let(:web_apps) do
	  [
	  	{ vhost: { main_domain: 'example.com' }, connection_domain: { varnish_domain: 'varnish.example.com' }, varnish: { purge_target: true}}
	  ]
  end

  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
    	node.set['w_common']['web_apps'] = web_apps
			node.set['w_varnish']['node_ipaddress_list'] = ['7.7.7.7', '8.8.8.8']
    end.converge(described_recipe)
  end
	    
  it 'generates /etc/hosts file entries to enable communication btw web and varnish server' do
  	expect(chef_run).to append_hostsfile_entry('7.7.7.7').with_hostname('0varnish.example.com').with_unique(true)
  	expect(chef_run).to append_hostsfile_entry('8.8.8.8').with_hostname('1varnish.example.com').with_unique(true)
  end

end
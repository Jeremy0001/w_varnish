require_relative '../spec_helper'

describe 'w_varnish::hosts' do

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

  it 'do not creaqte host file entry for vhost without varnish domain' do
    expect(chef_run).not_to append_hostsfile_entry('7.7.7.7').with_hostname('0varnish.no-varnish.com')
    expect(chef_run).not_to append_hostsfile_entry('8.8.8.8').with_hostname('1varnish.no-varnish.com')
  end

  it 'do not creaqte host file entry for doc root only vhost' do
    expect(chef_run).not_to append_hostsfile_entry('7.7.7.7').with_hostname('0varnish.docroot-only-vhost.com')
    expect(chef_run).not_to append_hostsfile_entry('8.8.8.8').with_hostname('1varnish.docroot-only-vhost.com')
  end
end

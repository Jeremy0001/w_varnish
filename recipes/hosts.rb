node['w_common']['web_apps'].each do |web_app|
  node['w_varnish']['node_ipaddress_list'].each_with_index do |varnish_node_ip, index|
    domain = index.to_s + web_app['connection_domain']['varnish_domain']    
    hostsfile_entry varnish_node_ip do
      hostname domain
      action :append
      unique true
    end
  end
end

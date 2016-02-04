require 'chefspec'
require 'chefspec/berkshelf'
require 'mymatchers'

ChefSpec::Coverage.start! do
  add_filter(%r{[\/\\]apt[\/\\]})
  add_filter(%r{[\/\\]monit[\/\\]})
  add_filter(%r{[\/\\]build-essential[\/\\]})
  add_filter(%r{[\/\\]git[\/\\]})
  add_filter(%r{[\/\\]firewall[\/\\]})
  add_filter(%r{[\/\\]varnish[\/\\]})
  add_filter(%r{[\/\\]s3_file[\/\\]})
end

RSpec.configure do |config|
  config.platform = 'ubuntu'
  config.version = '14.04'
end

def web_apps
  [
    { vhost: { main_domain: 'example.com' }, connection_domain: { varnish_domain: 'varnish.example.com' }, varnish: { purge_target: true}},
    { vhost: { main_domain: 'no-varnish.com' }, connection_domain: { webapp_domain: 'webapp.no-varnish.com', db_domain: 'db.no-varnish.com' }},
    { vhost: { main_domain: 'docroot-only-vhost.com',                              docroot: '/websites/dov'              }}
  ]
end

# http://capistranorb.com/documentation/getting-started/configuration/

server 'niczsoft.com', user: 'mpapis', roles: %w{app db web}

set :deploy_to, '/home/mpapis/apps/asi-portal'

set :default_env, {
  "GEM_HOME" => "/home/mpapis/.rvm/gems/ruby-2.3.1@asi-portal",
  "GEM_PATH" => "/home/mpapis/.rvm/gems/ruby-2.3.1@asi-portal:/home/mpapis/.rvm/gems/ruby-2.3.1@global",
  "PATH"     => "/home/mpapis/.rvm/gems/ruby-2.3.1@asi-portal/bin:/home/mpapis/.rvm/gems/ruby-2.3.1@global/bin:/home/mpapis/.rvm/rubies/ruby-2.3.1/bin:$PATH",
}

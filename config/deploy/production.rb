# frozen_string_literal: true

server 'network.bgm.cl', :user => 'deploy', :roles => 'app db', :primary => true

set :ssh_options, {
  :keys => %w(C:/Users/BGM/.ssh/elmedievo),
  :auth_methods => %w(publickey),
  :forward_agent => true
}

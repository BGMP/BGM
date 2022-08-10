# frozen_string_literal: true

lock '~> 3.16.0'

require 'capistrano/bundler'
require 'rvm1/capistrano3'

set :application, 'BGM'
set :repo_url, 'git@github.com:BGMP/BGM.git'
set :branch, 'production'
set :user, 'deploy'
set :stages, %w(production)
set :deploy_to, '/home/deploy/BGM'
set :linked_dirs, %w(.bundle)
set :pty, true
set :rvm1_ruby_version, '2.7.3'

namespace :app do
  task :update_rvm_key do
    execute :gpg, '--keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3'
  end

  task :restart do
    on roles(:app) do
      execute :sudo, '/bin/systemctl restart bgm.service'
    end
  end
end

before 'rvm1:install:rvm', 'app:update_rvm_key'
after 'deploy', 'app:restart'

# frozen_string_literal: true

lock '~> 3.17.1'

require 'capistrano/bundler'
require 'rvm1/capistrano3'

set :application, 'BGM'
set :repo_url, 'git@github.com:BGMP/BGM.git'
set :branch, 'production'
set :user, 'deploy'
set :stages, %w(production)
set :deploy_to, '/home/deploy/BGM'
set :linked_dirs, ['.bundle', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads']
set :linked_files, ['config/database.yml', 'config/secrets.yml']
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

set :rails_env, 'production'
set :migration_role, :db
set :migration_servers, -> { primary(fetch(:migration_role)) }
set :migration_command, 'db:migrate'
set :conditionally_migrate, true
set :assets_roles, [:web, :app]
set :assets_prefix, 'dev-assets'
set :rails_assets_groups, :assets

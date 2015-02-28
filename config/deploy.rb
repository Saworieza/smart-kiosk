# config valid only for current version of Capistrano
lock '3.3.5'

set :application, 'smart-kiosk'
set :repo_url, 'git@github.com:sudharti/smart-kiosk.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app_name
  set :deploy_to, '/var/www/smart-kiosk'

# Default value for :scm is :git
  set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

set :deploy_via, :remote_cache
set :sudo_user, "root"
set :use_sudo, false


# Default value for :linked_files is []
  set :linked_files, fetch(:linked_files, []).push('config/database.yml')

# Default value for linked_dirs is []
  set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
  set :default_env, { path: "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do
  namespace :check do
    task :linked_files => 'config/database.yml'
  end
  desc 'Restart application'  
  task :restart do
    invoke 'unicorn:restart'
  end
  after :publishing, :restart
end

remote_file 'config/database.yml' => 'config/database.example.yml', roles: :app

file 'config/database.example.yml' do |t|
  File.read release_path.join(t.name)
end

# config valid only for current version of Capistrano
lock '3.4.0'

set :repo_url, 'git@github.com:dylansm/rhizome.git'
#set :app_type, "rails" # either rack or rails
#set :linked_dirs, %w{log tmp/pids tmp/cache tmp/pids tmp/sockets vendor/bundle public/system}
set :keep_releases, 3
#set :bundle_binstubs, nil
set :pty, true
set :user, "dylansm"
set :home, "/home/#{fetch(:user)}"
set :rvm_ruby_prefix, "ruby-2.1.5"
set :rvm_gemset_prefix, "rhizome"
set :rvm_prefix, "#{fetch(:rvm_ruby_prefix)}@#{fetch(:rvm_gemset_prefix)}"
#
#after 'deploy:finishing', 'deploy:cleanup'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
set :linked_dirs, fetch(:linked_dirs, []).push('public')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

#namespace :deploy do

  #after :restart, :clear_cache do
    #on roles(:web), in: :groups, limit: 3, wait: 10 do
      ## Here we can do anything such as:
      ## within release_path do
      ##   execute :rake, 'cache:clear'
      ## end
    #end
  #end

#end

# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, 'note_33'
set :repo_url,  'git@github.com:yamamotoyoshiaki2018/note_33.git'

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.3.7'

set :ssh_options, auth_methods: ['publickey'],
                  keys: ['/Users/yamamotoyoshiaki2018/.ssh/note33.pem']

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end

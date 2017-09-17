# config valid only for current version of Capistrano
lock '3.9.0'

set :application, 'jonblog'
set :repo_url, 'git@bitbucket.org:weyermannx/jonblog.git'



# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, ask("Branch name? or enter for master", "master")

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '~/jonblog2'

set :pty, true

set :ssh_options, {
  forward_agent: true,
  auth_methods: ["publickey"],
  keys: ["~/.ssh/ChaosXStorm.pem"]
}

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{.env.production}

# Default value for linked_dirs is []
set :linked_dirs, %w{tmp/pids tmp/cache tmp/sockets vendor/bundle public/uploads public/staticimages}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

#after :finishing, :passenger_restart do
#  execute "cd ~/jonblog2/current ; passenger stop -p 5000 ; passenger start --daemonize -p 5000 -e production"
#end

set :passenger_restart_command, 'passenger-config restart-app --instance vh4pL6yX'

namespace :deploy do
  before :finishing, 'linked_files:upload'
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end

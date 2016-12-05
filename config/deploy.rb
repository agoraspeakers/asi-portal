lock '3.6.1' # config valid only for current version of Capistrano

# application
set :application, 'asi-portal'
set :repo_url, 'https://github.com/agoraspeakers/asi-portal.git'

# database
set :migration_role, :app
set :conditionally_migrate, true

# automatic linking configuration
set :linked_dirs,  %w{log tmp/pids tmp/cache tmp/sockets public/system public/uploads}
set :linked_files, %w{.env}

# Default branch is :master
branch = `git rev-parse --abbrev-ref HEAD`.chomp
ask :branch, branch if branch != "master"

# bundler by default uses it's own gems path, let's use GEM_HOME/PATH:
set :bundle_flags, '--quiet'
set :bundle_path, nil

# Default value for :pty is false
# set :pty, true

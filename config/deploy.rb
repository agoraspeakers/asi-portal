lock '3.6.1' # config valid only for current version of Capistrano

# application
set :application, 'asi-portal'
set :repo_url, 'https://github.com/agoraspeakers/asi-portal.git'

# database
set :migration_role, :app
set :conditionally_migrate, true

# automatic linking configuration
set :linked_dirs,  %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}
set :linked_files, %w{.env}

# Default branch is :master
branch = `git rev-parse --abbrev-ref HEAD`.chomp
ask :branch, branch if branch != "master"

# Default value for :pty is false
# set :pty, true

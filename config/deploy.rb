default_run_options[:pty] = true
ssh_options[:auth_methods] = %w{publickey password}
ssh_options[:forward_agent] = true

$:.unshift "."

# Overwrite the default deploy start/stop/restart actions with passenger ones
require 'config/deploy/passenger'
require 'bundler/capistrano'
require 'capistrano/ext/multistage'

set :sync_directories, ["public/system"]
set :stages, %w(staging production)
set :default_stage, 'staging'
set :repository, "git@github.com:MegelBrown/smartrent_api.git"
set :scm, 'git'
set :scm_verbose, true

role(:app) { domain }
role(:web) { domain }
role(:db, :primary => true) { domain }

namespace :deploy do
  task :link_shared_files do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/ripple.yml #{release_path}/config/ripple.yml"
  end

  after 'deploy:update_code' do
    link_shared_files
  end

  desc "Recycle the database"
  task :db_install do
    logger.info "Nerfed.  See config/deploy  -JDL"
    #JDL: nerfing this cuz it can cause problems now that the app is up and
    #running
     #run("cd #{current_path}; /usr/bin/rake db:install
    #RAILS_ENV=#{rails_env}")
  end
end

  task :notify_ratchetio, :roles => :app do
    set :revision, `git log -n 1 --pretty=format:"%H"`
    set :local_user, `whoami`
    set :ratchetio_token, '7ec9e69205574e0ab5078576e5d7b849'
    rails_env = fetch(:rails_env, 'staging')
    run "curl https://submit.ratchet.io/api/1/deploy/ -F access_token=#{ratchetio_token} -F environment=#{rails_env} -F revision=#{revision} -F local_username=#{local_user}"
  end

  after :deploy, 'notify_ratchetio'

namespace :gems do
  desc "Install gems"
  task :install, :roles => :app do
    run "cd #{current_path} && #{sudo} rake RAILS_ENV=production gems:install"
  end
end

require 'config/boot'
require './config/boot'

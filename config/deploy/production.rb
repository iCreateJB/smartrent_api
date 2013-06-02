set :runner, 'apache'
set :user, 'root'

set :domain, "ec2-54-242-2-147.compute-1.amazonaws.com"
ssh_options[:keys] = ["#{ENV['HOME']}/staging.pem"]
set :application, 'smartrent'      # eg 'rfx'
set :deploy_to, '/var/www/smartrent.pro'
set :scm_passphrase, 'sinister'

set :keep_releases, 10
set :branch, 'design-refresh'
set :rails_env, "production"
set :use_sudo, false

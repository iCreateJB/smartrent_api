set :runner, 'apache'
set :user, 'root'

set :domain, "ec2-23-23-34-20.compute-1.amazonaws.com"
ssh_options[:keys] = ["#{ENV['HOME']}/staging.pem"]
set :application, 'smartrent'      # eg 'rfx'
set :deploy_to, '/var/www/smartrent_api'
set :scm_passphrase, 'sinister'

set :keep_releases, 10
set :branch, 'master'
set :rails_env, "staging"
set :use_sudo, false

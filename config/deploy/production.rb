set :stage, :production
set :branch, "master"

set :full_app_name, "#{fetch(:application)}_#{fetch(:stage)}"
set :server_name, "harlen.greggparrish.com"

server 'harlen.greggparrish.com', user: <%= ENV["HAR_DEPLOY_USER"] %>, roles: %w{web app db}, primary: true

set :rails_env, :production
set :enable_ssl, false


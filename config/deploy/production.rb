set :stage, :production
set :branch, "master"
set :rvm_ruby_version, '2.4.1@harlen'

set :full_app_name, "#{fetch(:application)}_#{fetch(:stage)}"
set :server_name, "harlen.greggparrish.com"

server 'harlen.greggparrish.com', user: 'agricola', roles: %w{web app db}, primary: true

set :rails_env, :production
set :enable_ssl, false


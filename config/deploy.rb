lock "3.8.1"

set :application, "harlen"
set :rails_env, "deploy" 
set :repo_url, 'git@github.com:greggparrish/harlen.git'
set :deploy_to, '/home/agricola/public/web/harlen_dev'
set :deploy_user, 'agricola'
set :keep_releases, 5

set :ssh_options, {
  user: 'agricola',
  keys: ['~/.ssh/digocean'],
  port: '973',
  forward_agent: true,
  auth_methods: ["publickey"]
}

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :finishing, 'deploy:cleanup'

end

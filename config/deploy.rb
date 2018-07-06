require 'mina/git'
require 'mina/bundler'
require 'mina/rails'
require 'mina/unicorn'
require 'mina/rvm'

# preset defaults
set :application_name, 'blog_app'
set :domain, '35.231.73.143'
set :deploy_to, '/home/anoob.bava/blog_app'
set :repository, 'git@github.com:anoobbava/blog_app.git'
set :branch, 'staging'
set :user, 'anoob.bava'
set :rails_env, 'staging'
set :identity_file, "/home/anoobbava/Desktop/to_backup/pem_files/blog_app.pem"

set :forward_agent, true
set :port, '22'
set :unicorn_pid, "#{fetch(:deploy_to)}/shared/pids/unicorn.pid"

set :shared_files, ['config/database.yml', 'log', 'config/secrets.yml', '.env', 'public/uploads']
# rails pid
set :pid_file, "#{fetch(:deploy_to)}/shared/pids/#{fetch(:rails_env)}.pid"


task :remote_environment do
invoke :'rvm:use', 'ruby-2.4.1@default'
end

task :setup => :remote_environment do

   command %[mkdir -p "#{fetch(:deploy_to)}/shared/log"]
  command %[chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/log"]

  command %[mkdir -p "#{fetch(:deploy_to)}/shared/config"]
  command %[chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/config"]

  command %[mkdir -p "#{fetch(:deploy_to)}/shared/sockets"]
  command %[chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/sockets"]

  command %[mkdir -p "#{fetch(:deploy_to)}/public/uploads"]
  command %[chmod g+rx,u+rwx "#{fetch(:deploy_to)}/public/uploads"]

  command %[touch "#{fetch(:deploy_to)}/shared/config/database.yml"]
  command  %[echo "-----> Be sure to edit 'shared/config/database.yml'."]

  command %[touch "#{fetch(:deploy_to)}/shared/config/secrets.yml"]
  command %[echo "-----> Be sure to edit 'shared/config/secrets.yml'."]

  command %[touch "#{fetch(:deploy_to)}/shared/config/config.yml"]
  command %[echo "-----> Be sure to edit 'shared/config/config.yml'."]

  command %[touch "#{fetch(:deploy_to)}/shared/.env"]
  command %[echo "-----> Be sure to edit '.env"]

  # sidekiq needs a place to store its pid file and log file
  command %[mkdir -p "#{fetch(:deploy_to)}/shared/pids/"]
  command %[chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/pids"]
end

desc "Deploys the current version to the server."
task :deploy => :remote_environment do
  deploy do

    on :prepare do
      command %[kill -9 `cat #{fetch(:pid_file)}`]
    end

    comment "Deploying #{fetch(:application_name)} to #{fetch(:domain)}:#{fetch(:deploy_to)}"
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    on :launch do
      invoke :'unicorn:restart'
      command "cd #{fetch(:deploy_to)}/current ; mkdir -p tmp ; touch tmp/restart.txt"
    end
  end
end

desc "Restart unicorn using 'upgrade'"
task :restart => :remote_environment do
  invoke 'unicorn:stop'
  invoke 'unicorn:start'
end

desc "Seed data to the database"
task :seed => :environment do
  queue "cd #{fetch(:deploy_to)}/current"
  queue "bundle exec rake db:seed RAILS_ENV=staging"
end

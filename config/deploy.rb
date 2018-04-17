require 'mina/rails'
require 'mina/git'
require 'mina/rvm'
require 'mina/puma'

set :application_name, 'blog_app'
set :domain, '35.185.45.69'
set :deploy_to, '/home/blog_app'
set :repository, 'git@github.com:anoobbava/blog_app.git'
set :branch, 'staging'
set :user, 'irfana_anoob'
set :rails_env, 'staging'
set :identity_file, "/home/anoobbava/public.pem"

set :shared_dirs, fetch(:shared_dirs, []).push('log', 'tmp/pids', 'tmp/sockets', 'public/uploads')
set :shared_files, fetch(:shared_files, []).push('config/database.yml', 'config/secrets.yml', 'config/puma.rb')

task :environment do
  invoke :'rvm:use', 'ruby-2.4.1@default'
end

task :setup do
  command %[touch "#{fetch(:shared_path)}/config/database.yml"]
  command %[touch "#{fetch(:shared_path)}/config/secrets.yml"]
  command %[touch "#{fetch(:shared_path)}/config/puma.rb"]
  comment "Be sure to edit '#{fetch(:shared_path)}/config/database.yml', 'secrets.yml' and puma.rb."
end

task :deploy do
  deploy do
    comment "Deploying #{fetch(:application_name)} to #{fetch(:domain)}:#{fetch(:deploy_to)}"
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    on :launch do
      invoke :'puma:restart'
    end
  end

end

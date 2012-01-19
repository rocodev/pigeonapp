# -*- encoding : utf-8 -*-
require "./config/boot"
require "bundler/capistrano"
require 'airbrake/capistrano'
require 'cape'

default_environment["RAILS_ENV"] = "production"
default_environment["PATH"] = "/usr/local/bin:/usr/bin:/bin"

set :application, "pigeonhub"
set :repository,  "git@github.com:rocodev/pigeonapp.git"

set :branch, "master"
set :scm, :git
set :user, "apps"
set :deploy_to, "/home/apps/#{application}"
set :runner, "apps"
set :deploy_via, :remote_cache
set :git_shallow_clone, 1

role :web, "pigeonhub.com"                          # Your HTTP server, Apache/etc
role :app, "pigeonhub.com"                          # This may be the same as your `Web` server
role :db,  "pigeonhub.com", :primary => true # This is where Rails migrations will run

namespace :deploy do

  desc "Restart passenger process"
  task :restart, :roles => [:web], :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
end


Cape do
  # Create Capistrano recipes for all Rake tasks.
  mirror_rake_tasks :dev
end

namespace :my_tasks do
  task :symlink, :roles => [:web] do
    run "mkdir -p #{deploy_to}/shared/log"
    run "mkdir -p #{deploy_to}/shared/pids"
    
    symlink_hash = {
      "#{shared_path}/config/config.yml"    => "#{release_path}/config/config.yml",
      "#{shared_path}/config/database.yml"    => "#{release_path}/config/database.yml",
      "#{shared_path}/uploads" => "#{release_path}/public/uploads"
    }

    symlink_hash.each do |source, target|
      run "ln -sf #{source} #{target}"
    end
  end
  
  task :restart_resque, :roles => :web do
    run "cd #{release_path}; RAILS_ENV=production ./script/resque stop; RAILS_ENV=production ./script/resque start"
  end
  
  
  task :start_mailman, :roles => :web do
    run "cd #{deploy_to}/current/; RAILS_ENV=production ./script/mailman start"
  end

  task :stop_mailman, :roles => :web do
    run "cd #{deploy_to}/current/; RAILS_ENV=production ./script/mailman stop"
  end

  task :restart_mailman, :roles => :web do
    run "cd #{deploy_to}/current/; RAILS_ENV=production ./script/mailman stop; RAILS_ENV=production ./script/mailman start"
  end
end



namespace :remote_rake do
  desc "Run a task on remote servers, ex: cap staging rake:invoke task=cache:clear"
  task :invoke do
    run "cd #{deploy_to}/current; RAILS_ENV=#{rails_env} bundle exec rake #{ENV['task']}"
  end
end

after "deploy:finalize_update", "my_tasks:symlink"
#after "deploy:finalize_update", "my_tasks:restart_mailman"
#after "deploy:finalize_update", "my_tasks:mongoid_create_indexes"
#after "deploy:restart", "my_tasks:restart_resque"


        require './config/boot'
        require 'airbrake/capistrano'

# -*- encoding : utf-8 -*-
require 'capistrano/ext/multistage'
require 'bundler/capistrano' #Using bundler with Capistrano

set :stages, %w(staging production)
set :default_stage, "staging"

set :assets_dependencies, %w(app/assets lib/assets vendor/assets Gemfile.lock config/routes.rb)

set :keep_releases, 5
after "deploy:update", "deploy:cleanup" 
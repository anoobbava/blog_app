# encoding: utf-8

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'coffee-rails', '~> 4.2'
gem 'devise', '~> 4.3'
gem 'gritter', '~> 1.2'
gem 'haml', '~> 5.0', '>= 5.0.4'

gem 'jquery-rails'
gem 'overcommit', '~> 0.41.0'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.2'
gem 'sass-rails', '~> 5.0'
gem 'simple_form', '~> 3.5'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
group :development, :test do
  gem 'capybara', '~> 2.13'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
end

group :test do
  gem 'codeclimate-test-reporter', '~> 1.0.0'
  gem 'database_cleaner', '~> 1.5'
  gem 'factory_bot', '~> 4.8', '>= 4.8.2'
  gem 'factory_bot_rails'
  gem 'faker', '~> 1.6.1'
  gem 'rails-controller-testing', '~> 0.0.3'
  gem 'rspec', '~> 3.6'
  gem 'shoulda-matchers'
  gem 'simplecov'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'pry'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'sqlite3'
  gem 'web-console', '>= 3.3.0'
end
group :production do
  gem 'pg'
end

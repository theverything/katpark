source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '3.2.14'
gem 'pg'
gem 'jquery-rails'
gem 'devise'
gem 'opengraph', git: 'https://github.com/intridea/opengraph.git'
gem 'paperclip'
gem 'aws-sdk'
gem 'redcarpet'
gem 'dynamic_form'
gem 'delayed_job_active_record'
gem 'will_paginate'
gem 'foundation_rails_helper'

group :production do
  gem 'unicorn'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'zurb-foundation'
end

group :test, :development do
  gem 'rspec-rails', '~> 2.13'
  gem 'pry-rails'
  gem 'pry-debugger'
  gem 'pry-doc'
  gem 'figaro'
  gem 'thin'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'factory_girl', '2.6.4'
  gem 'launchy'
  gem 'simplecov', :require => false
  gem 'email_spec'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end

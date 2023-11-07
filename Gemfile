# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.1'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

gem "sqlite3", "~> 1.4"

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Use Tailwind CSS [https://github.com/rails/tailwindcss-rails]
gem 'tailwindcss-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
gem 'audited', '~> 5.0'
gem 'redis', '~> 4.0'

gem 'table_print', '~> 1.5'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.2'
  gem 'rspec_junit_formatter', '~> 0.4.1'
  gem 'rspec-rails', '~> 5.0'
  gem 'simplecov', '~> 0.21.2'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'relaxed-rubocop', require: false
  gem 'rubocop', '~>1.52.0', require: false
  gem 'web-console'
  gem 'meta_request' # for use with RailsPanel chrome extension

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'database_cleaner', '~> 2.0'
  gem 'email_spec', '~> 2.2'
  gem 'pundit-matchers', '~> 1.7'
  gem 'rails-controller-testing', '~> 1.0'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'webdrivers'
end

gem 'selenium-webdriver'

gem 'httparty', '~> 0.20.0'

gem 'paranoia', '~> 2.4'

gem 'pry', '~> 0.14.1'

gem 'has_scope', '~> 0.8.0'

gem "view_component"

gem 'simple_form', '~> 5.1'

gem 'simple_form_tailwind_css', '~> 0.0.2'

gem 'devise', '~> 4.8'

gem 'devise_invitable', '~> 2.0'

gem 'pundit', '~> 2.1'

gem 'aws-sdk-s3', '~> 1.104', require: false

gem 'doorkeeper', '~> 5.5'

gem 'pagy', '~> 5.3.1'

gem 'ransack', '~> 2.5'

gem 'figaro', '~> 1.2'

# Services
gem 'dry-matcher', '~> 0.9.0'
gem 'dry-monads', '~> 1.4'
gem 'dry-schema', '~> 1.8'
gem 'dry-validation', '~> 1.7'

gem 'blazer', '~> 2.5'

gem 'jsbundling-rails', '~> 1.0'

gem 'solargraph', '~> 0.49.0'

gem "ruby-openai"

gem "importmap-rails", "~> 1.2"

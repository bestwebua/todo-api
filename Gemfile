# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'activestorage-validator', '~> 0.1.3'
gem 'acts_as_list', '~> 1.0'
gem 'bcrypt', '~> 3.1', '>= 3.1.13'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'fast_jsonapi', '~> 1.5'
gem 'jwt', '~> 2.2', '>= 2.2.1'
gem 'pg', '~> 1.1', '>= 1.1.4'
gem 'puma', '~> 4.3'
gem 'rails', '~> 5.2', '>= 5.2.3'

group :development, :test do
  gem 'factory_bot_rails', '~> 5.1', '>= 5.1.1'
  gem 'faker', '~> 2.7'
  gem 'pry-byebug', '~> 3.7'
  gem 'pry-rails', '~> 0.3.9'
  gem 'rspec-rails', '~> 3.9'

  # Code quality
  gem 'rubocop', '~> 0.76.0', require: false
  gem 'rubocop-performance', '~> 1.5', require: false
  gem 'rubocop-rails', '~> 2.3', '>= 2.3.2', require: false
  gem 'rubocop-rspec', '~> 1.36', require: false
end

group :test do
  gem 'dox', '~> 1.1', require: false
  gem 'json_matchers', '~> 0.11.1', require: 'json_matchers/rspec'
  gem 'rspec_file_chef', '~> 0.1.2'
  gem 'shoulda-matchers', '~> 4.1', '>= 4.1.2'
  gem 'simplecov', '~> 0.13'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring', '~> 2.1'
  gem 'spring-watcher-listen', '~> 2.0', '>= 2.0.1'
end

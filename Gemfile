source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.12'
gem 'rails', '~> 5.2.1'
gem 'loofah', '~> 2.2', '>= 2.2.3'
gem 'bcrypt'
gem 'jwt'
gem 'acts_as_list'
gem 'activestorage-validator'
gem 'active_model_serializers'

group :development, :test do
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails'
end

group :test do
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
  gem 'faker'
  gem 'simplecov'
  gem 'codeclimate-test-reporter'
  gem 'dox', require: false
  gem 'rspec_file_chef'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

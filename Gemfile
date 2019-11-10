source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'pg', '~> 1.1', '>= 1.1.4'
gem 'puma', '~> 4.3'
gem 'rails', '~> 5.2', '>= 5.2.3'
gem 'bcrypt', '~> 3.1', '>= 3.1.13'
gem 'jwt', '~> 2.2', '>= 2.2.1'
gem 'acts_as_list', '~> 1.0'
gem 'activestorage-validator', '~> 0.1.3'
gem 'active_model_serializers', '~> 0.10.10'

group :development, :test do
  gem 'pry-byebug', '~> 3.7'
  gem 'pry-rails', '~> 0.3.9'
  gem 'rspec-rails', '~> 3.9'
end

group :test do
  gem 'factory_bot_rails', '~> 5.1', '>= 5.1.1'
  gem 'shoulda-matchers', '~> 4.1', '>= 4.1.2'
  gem 'faker', '~> 2.7'
  gem 'simplecov', '~> 0.13'
  gem 'codeclimate-test-reporter', '~> 1.0', '>= 1.0.9'
  gem 'dox', '~> 1.1', require: false
  gem 'rspec_file_chef', '~> 0.1.2'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring', '~> 2.1'
  gem 'spring-watcher-listen', '~> 2.0', '>= 2.0.1'
end

# frozen_string_literal: true

require 'spec_helper'
require 'dox'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

Dir[Rails.root.join('spec/support/**/*.rb')].each { |file| require file }

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

Dir[Rails.root.join('spec/docs/**/*.rb')].each { |file| require file }

Dox.configure do |config|
  config.header_file_path = Rails.root.join('spec/docs/v1/descriptions/header.md')
  config.desc_folder_path = Rails.root.join('spec/docs/v1/descriptions')
  config.headers_whitelist = %w[Accept Authorization]
end

JsonMatchers.schema_root = 'spec/support/schemas'

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include FactoryBot::Syntax::Methods
  config.include RequestSpecHelper
  config.include ControllerSpecHelper

  config.after(:each, :dox) do |example|
    example.metadata[:request] =
      if request.headers['CONTENT_TYPE']&.include?('multipart/form-data; boundary=')
        patched_request = request.dup
        def patched_request.body
          OpenStruct.new(read: request_parameters.to_json)
        end
        patched_request
      else
        request
      end
    example.metadata[:response] = response
  end
end

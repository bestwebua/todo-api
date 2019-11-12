# frozen_string_literal: true

require 'simplecov'
require 'rspec_file_chef'

SimpleCov.start do
  add_filter 'spec/'
end

RSpec.configure do |config|
  RspecFileChef::FileChef.configure do |configuration|
    configuration.rspec_path = File.expand_path(__dir__)
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

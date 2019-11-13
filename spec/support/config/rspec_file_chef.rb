# frozen_string_literal: true

RSpec.configure do |config|
  RspecFileChef::FileChef.configure do |configuration|
    configuration.rspec_path = File.expand_path(__dir__)
  end
end

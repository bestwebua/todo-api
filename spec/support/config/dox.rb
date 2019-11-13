# frozen_string_literal: true

RSpec.configure do |config|
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

Dox.configure do |config|
  config.header_file_path = Rails.root.join('spec/docs/v1/descriptions/header.md')
  config.desc_folder_path = Rails.root.join('spec/docs/v1/descriptions')
  config.headers_whitelist = %w[Accept Authorization]
end

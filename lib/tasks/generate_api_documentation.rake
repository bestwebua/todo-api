# frozen_string_literal: true

# :nocov:
namespace :api do
  namespace :v1 do
    desc 'Generate API v1 documentation'

    apib_file = 'spec/docs/v1/docs.apib'
    html_file = 'public/docs/v1.html'

    task :apib do
      RSpec::Core::RakeTask.new(:api_spec) do |t|
        t.rspec_opts = "-f Dox::Formatter --order defined --tag dox --out #{apib_file}"
      end

      Rake::Task['api_spec'].invoke
    end

    task :html do
      system("aglio -i #{apib_file} -o #{html_file}")
    end

    task docs: ['api:v1:apib', 'api:v1:html']
  end
end
# :nocov:

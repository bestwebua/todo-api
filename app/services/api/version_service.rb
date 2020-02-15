# frozen_string_literal: true

module Api
  class VersionService
    attr_reader :version, :default

    def initialize(version, default = false)
      @version, @default = version, default
    end

    def matches?(request)
      check_headers(request.headers) || default
    end

    private

    def check_headers(headers)
      accept = headers[:accept]
      accept&.include?("application/#{version}")
    end
  end
end

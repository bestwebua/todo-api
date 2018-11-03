module Docs
  module V1
    module Authentication
      extend Dox::DSL::Syntax

      document :api do
        resource 'Authentication' do
          endpoint '/auth'
          group 'Authentication'
        end
      end

      document :authenticate do
        action 'Sign in'
      end
    end
  end
end

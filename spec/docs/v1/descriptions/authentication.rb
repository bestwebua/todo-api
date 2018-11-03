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

      document :sign_in do
        action 'Sign In'
      end

      document :sign_out do
        action 'Sign Out'
      end

      document :sign_up do
        action 'Sign Up'
      end
    end
  end
end

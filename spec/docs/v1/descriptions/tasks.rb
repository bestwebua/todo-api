module Docs
  module V1
    module Tasks
      extend Dox::DSL::Syntax

      document :api do
        resource 'Tasks' do
          endpoint '/projects/:id/tasks'
          group 'Tasks'
        end
      end

      document :index do
        action 'Get tasks'
      end

      document :create do
        action 'Create task'
      end

      document :show do
        action 'Read task'
      end

      document :update do
        action 'Update task'
      end

      document :delete do
        action 'Delete task'
      end

      document :complete do
        action 'Complete task'
      end

      document :position do
        action 'Up task'
      end
    end
  end
end

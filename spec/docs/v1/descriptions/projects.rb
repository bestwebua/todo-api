# frozen_string_literal: true

module Docs
  module V1
    module Projects
      extend Dox::DSL::Syntax

      document :api do
        resource 'Projects' do
          endpoint '/projects'
          group 'Projects'
        end
      end

      document :index do
        action 'Get projects'
      end

      document :create do
        action 'Create project'
      end

      document :show do
        action 'Read project'
      end

      document :update do
        action 'Update project'
      end

      document :delete do
        action 'Delete project'
      end
    end
  end
end

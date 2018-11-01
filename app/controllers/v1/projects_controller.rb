module V1
  class ProjectsController < ApplicationController
    before_action :init_project, only: %i[show update destroy]

    def index
      @projects = current_user.projects
      json_response(@projects)
    end

    def create
      @project = current_user.projects.create!(project_params)
      json_response(@project, :created)
    end

    def show
      json_response(@project)
    end

    def update
      @project.update(project_params)
      json_response(@project)
    end

    def destroy
      @project.destroy
      head :no_content
    end

    private

      def project_params
        params.permit(:title)
      end

      def init_project
        @project = Project.find(params[:id])
      end
  end
end

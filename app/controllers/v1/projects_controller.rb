# frozen_string_literal: true

module V1
  class ProjectsController < ApplicationController
    before_action :project, only: %i[show update destroy]

    def index
      json_response(current_user_projects)
    end

    def create
      project = current_user_projects.create!(project_params)
      json_response(project, :created)
    end

    def show
      json_response(project)
    end

    def update
      project.update(project_params)
      json_response(project)
    end

    def destroy
      project.destroy
      head :no_content
    end

    private

    def serializer
      ProjectSerializer
    end

    def project_params
      params.permit(:title)
    end

    def project
      @project = Project.find(params[:id])
    end

    def current_user_projects
      current_user.projects
    end
  end
end

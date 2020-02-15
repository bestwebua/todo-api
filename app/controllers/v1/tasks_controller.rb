# frozen_string_literal: true

module V1
  class TasksController < ApplicationController
    before_action :project
    before_action :task, except: %i[index create]

    def index
      json_response(project_tasks)
    end

    def show
      json_response(task)
    end

    def create
      json_response(project_tasks.create!(task_params), :created)
    end

    def update
      task.update(task_params)
      json_response(task)
    end

    def destroy
      task.destroy
      head :no_content
    end

    def complete
      Tasks::DoneTriggerCommand.call(task)
      json_response(task)
    end

    def position
      Tasks::UpPositionCommand.call(task)
      json_response(task)
    end

    private

    def serializer
      TaskSerializer
    end

    def task_params
      params.permit(:name, :deadline)
    end

    def project
      @project = Project.find(params[:project_id])
    end

    def project_tasks
      project.tasks
    end

    def task
      @task = project_tasks.find_by!(id: params[:id])
    end
  end
end

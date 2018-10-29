class TasksController < ApplicationController
  before_action :init_project
  before_action :init_project_task, only: %i[show update destroy complete position]

  def index
    json_response(@project.tasks)
  end

  def show
    json_response(@task)
  end

  def create
    json_response(@project.tasks.create!(task_params), :created)
  end

  def update
    @task.update(task_params)
    json_response(@task)
  end

  def destroy
    @task.destroy
    head :no_content
  end

  def complete
    Tasks::DoneTriggerCommand.call(@task)
    json_response(@task)
  end

  def position
    Tasks::UpPositionCommand.call(@task)
    json_response(@task)
  end

  private

    def task_params
      params.permit(:name, :deadline)
    end

    def init_project
      @project = Project.find(params[:project_id])
    end

    def init_project_task
      @task = @project.tasks.find_by!(id: params[:id]) if @project
    end
end

# frozen_string_literal: true

module V1
  class CommentsController < ApplicationController
    before_action :task

    def index
      json_response(task.comments)
    end

    def create
      json_response(Comments::CreateCommand.call(task, comment_params), :created)
    end

    def destroy
      task.comments.find_by!(id: params[:id]).destroy
      head :no_content
    end

    private

    def task
      @task = Task.find(params[:task_id])
    end

    def serializer
      CommentSerializer
    end

    def comment_params
      params.permit(:body, :image)
    end
  end
end

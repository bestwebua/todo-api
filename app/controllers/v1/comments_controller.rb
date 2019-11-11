module V1
  class CommentsController < ApplicationController
    before_action :init_task
    before_action :init_task_comment, only: :destroy

    def index
      json_response(@task.comments)
    end

    def create
      json_response(Comments::CreateCommand.call(@task, comment_params), :created)
    end

    def destroy
      @comment.destroy
      head :no_content
    end

    private

      def serializer
        CommentSerializer
      end

      def comment_params
        params.permit(:body, :image)
      end

      def init_task
        @task = Task.find(params[:task_id])
      end

      def init_task_comment
        @comment = @task.comments.find_by!(id: params[:id])
      end
  end
end

module TaskModelCollbacks
  include ActiveSupport::Concern

  private

    def readonly_error
      return if done_changed? || !done
      raise(ExceptionHandler::UpdateRecordError, Auth::MessageService.update_task_error)
    end
end

# frozen_string_literal: true

module Tasks
  class UpPositionCommand
    def self.call(task_object)
      task_object.move_higher
    end
  end
end

module Tasks
  class UpPositionCommand
    def self.call(task_object)
      task_object.instance_eval do
        move_higher
      end
    end
  end
end

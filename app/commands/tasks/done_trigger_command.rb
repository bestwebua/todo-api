module Tasks
  class DoneTriggerCommand
    def self.call(task_object)
      task_object.instance_eval do
        toggle!(:done)
      end
    end
  end
end

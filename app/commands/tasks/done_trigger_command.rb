# frozen_string_literal: true

module Tasks
  class DoneTriggerCommand
    def self.call(task_object)
      task_object.toggle!(:done)
    end
  end
end

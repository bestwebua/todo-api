class AddPositionToTasks < ActiveRecord::Migration[5.2]
  def up
    add_column :tasks, :position, :integer
  end

  def down
    remove_column :tasks, :position
  end
end

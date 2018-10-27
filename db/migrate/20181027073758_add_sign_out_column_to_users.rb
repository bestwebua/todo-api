class AddSignOutColumnToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :sign_out, :boolean, default: false
  end

  def down
    remove_column(:users, :sign_out)
  end
end

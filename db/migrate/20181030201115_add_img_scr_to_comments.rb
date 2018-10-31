class AddImgScrToComments < ActiveRecord::Migration[5.2]
  def up
    add_column :comments, :img_src, :string, default: nil
  end

  def down
    remove_column :comments, :img_src
  end
end

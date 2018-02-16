class EditBlogsTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :blogs, :userid
  end
end

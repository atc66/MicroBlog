class CreateBlogsTable < ActiveRecord::Migration[5.1]
  def change
  	create_table :blogs do |t|
  		t.string :title
  		t.string :content
  		t.integer :userid
  	end
  end
end

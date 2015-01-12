class AddColumnToComment < ActiveRecord::Migration
  def change
    add_column :comments, :image_uid, :string
    add_column :comments, :image_name, :string
  end
end

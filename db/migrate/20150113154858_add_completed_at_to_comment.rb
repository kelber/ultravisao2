class AddCompletedAtToComment < ActiveRecord::Migration
  def change
    add_column :comments, :completed_at, :datetime
  end
end

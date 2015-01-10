class AddNameToFranqueado < ActiveRecord::Migration
  def change
    add_column :franqueados, :name, :string
  end
end

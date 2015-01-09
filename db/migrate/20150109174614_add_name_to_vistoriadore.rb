class AddNameToVistoriadore < ActiveRecord::Migration
  def change
    add_column :vistoriadores, :name, :string
  end
end

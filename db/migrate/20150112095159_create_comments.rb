class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :vehicle_name, index: true
      t.references :manager, index: true
      t.references :franqueado, index: true
      t.references :vistoriadore, index: true

      t.timestamps
    end
  end
end

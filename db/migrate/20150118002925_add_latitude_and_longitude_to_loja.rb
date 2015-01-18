class AddLatitudeAndLongitudeToLoja < ActiveRecord::Migration
  def change
    add_column :lojas, :latitude, :float
    add_column :lojas, :longitude, :float
  end
end

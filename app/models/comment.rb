class Comment < ActiveRecord::Base

	dragonfly_accessor :image
	
  belongs_to :vehicle_name
  belongs_to :manager
  belongs_to :franqueado
  belongs_to :vistoriadore
end

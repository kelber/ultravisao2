class Comment < ActiveRecord::Base
  belongs_to :vehicle_name
  belongs_to :manager
  belongs_to :franqueado
  belongs_to :vistoriadore
end

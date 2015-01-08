class Estado < ActiveRecord::Base
    validates :name , presence: true 
end

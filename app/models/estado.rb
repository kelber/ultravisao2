class Estado < ActiveRecord::Base
    validates :name , presence: true 
    
    has_many :cidades, dependent: :destroy

    def to_param
		"#{id}-#{name}"
	end
end

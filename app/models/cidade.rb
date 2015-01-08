class Cidade < ActiveRecord::Base
    belongs_to :estado

   def to_param
		"#{id}-#{name}"
	end


end

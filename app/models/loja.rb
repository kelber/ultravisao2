class Loja < ActiveRecord::Base
	belongs_to :cidade

	geocoded_by :endereco
  after_validation :geocode




end

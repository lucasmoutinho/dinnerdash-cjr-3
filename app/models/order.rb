class Order < ApplicationRecord
	has_many :meals
	belongs_to :cart
	
end

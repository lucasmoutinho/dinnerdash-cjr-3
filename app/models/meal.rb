class Meal < ApplicationRecord

	mount_uploader :picture, PictureUploader
	belongs_to :meal_category
	has_many :order_has_meals
	has_many :carts, :through => :cart_items

	#default_scope { where(active: true) } #Garante que pratos inativos ou deletados não sejam adicionados. 


end
	
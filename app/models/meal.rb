class Meal < ApplicationRecord

	mount_uploader :picture, PictureUploader
	belongs_to :meal_category
	has_many :cart_items
	has_many :carts, :through => :cart_items

end
	
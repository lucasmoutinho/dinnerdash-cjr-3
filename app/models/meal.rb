class Meal < ApplicationRecord

	mount_uploader :picture, PictureUploader
	belongs_to :meal_category

end
	
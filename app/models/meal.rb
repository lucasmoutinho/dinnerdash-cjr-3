class Meal < ApplicationRecord
	
	mount_uploader :picture, PictureUploader
end

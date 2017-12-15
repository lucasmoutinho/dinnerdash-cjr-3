class MealCategory < ApplicationRecord
	has_many :meals, dependent: :destroy
end

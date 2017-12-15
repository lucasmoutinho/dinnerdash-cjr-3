class Meal < ApplicationRecord
	has_many :orders, :dependent => :destroy
end

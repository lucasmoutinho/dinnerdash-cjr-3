class Order < ApplicationRecord
	has_many :meals, :dependent => :destroy
end

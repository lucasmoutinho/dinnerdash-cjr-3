class Cart < ApplicationRecord
	has_many :cart_items
	has_many :meals, :through => :cart_items

	def add_meal(meal_params)
		current_cart = cart_items.find_by(meal_id: meal_params[:cart_item][:meal_id])

		# if current_cart
		# 		current_cart.quantity += meal_params[:cart_item][:meal_id].to_i
		# 		current_cart.save
		# else
		# 	new_cart = cart_items.create(meal_id: meal_params[:cart_item][:meal_id], 
		# 								 quantity: meal_params[:cart_item][:meal_id],
		# 								 cart_id: self.id )
		# end
		# new_cart
	end
end

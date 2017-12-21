class Order < ApplicationRecord
	has_many :order_has_meals
	has_many :meals, :through => :cart_items

	def add_meal(meal_params)
		current_cart = cart_items.find_by(meal_id: meal_params[:order_has_meal][:meal_id])

		# if current_cart
		# 		current_cart.quantity += meal_params[:@order_has_meal][:meal_id].to_i
		# 		current_cart.save
		# else
		# 	new_cart = OrderHasMeals.create(meal_id: meal_params[:@order_has_meal][:meal_id],
		# 								 quantity: meal_params[:@order_has_meal][:meal_id],
		# 								 cart_id: self.id )
		# end
		# new_cart
	end
end

class Cart < ApplicationRecord
	has_many :cart_items
	has_many :books, :through => :cart_items

	def add_meal(meal_params)
		current_item = cart_items.find_by(meal_id: meal_params[:meal][:meal_id])

		if current_item
				current_item.quantity += meal_params[:meal][:meal_id].to_i
				current_item.save
		else
			new_item = cart_items.create(meal_id: meal_params[:meal][:meal_id], 
										 quantity: meal_params[:meal][:meal_id],
										 cart_id: self.id )
		end
		new_item
	end
end

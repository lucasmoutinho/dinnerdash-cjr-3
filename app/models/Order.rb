class Order < ApplicationRecord
	has_many :order_has_meals
	has_many :meals, :through => :order_has_meals
	belongs_to :user

	def add_meal(meal_params)
		current_meal = order_has_meals.find_by(meal_id: meal_params[:order_has_meal][:meal_id])

		if current_order
		 		current_order.quantity += meal_params[:@order_has_meal][:meal_id].to_i
		 		current_order.save
		 else
		 	new_order = OrderHasMeals.create(meal_id: meal_params[:@order_has_meal][:meal_id],
		 								 quantity: meal_params[:@order_has_meal][:meal_id],
		 								 order_id: self.id )
		 end
		 new_order
    end

  private

  def price_sum
    self[:price] = self.order_has_meals.maps{|meal| meal.valid ? meal.quantity*meal.price : 0}.sum
  end
end

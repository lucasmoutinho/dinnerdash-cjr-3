class Order < ApplicationRecord
	has_many :order_has_meals
	has_many :meals, :through => :order_has_meals
	belongs_to :user

	def add_meal(meal_params, how_many_more)
		@current_order_item = self.OrderHasMeals.find_by(meal_id: meal_params[:meal_id])

		if @current_order_item
        @current_order_item.quantity += how_many_more
        @current_order_item.save
		 else
		 	@new_order = OrderHasMeals.create(meal_id: meal_params[:meal_id],
		 								 quantity: how_many_more,
		 								 order_id: self.id )
		 end
		 @new_order
    end

  private
3
  def price_sum
    self[:price] = self.order_has_meals.maps{|meal| meal.valid ? meal.quantity*meal.price : 0}.sum
  end
end

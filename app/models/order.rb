class Order < ApplicationRecord
	has_many :order_has_meals
	has_many :meals, :through => :order_has_meals
	belongs_to :user
  before_save :price_sum, only: [:add_meal]

	def add_meal(meal_params, how_many_more) #Howmanymore é um inteiro passado na chamada do método
		@current_order_item = self.order_has_meals.find_by(meal_id: meal_params[:id])

		if @current_order_item
        @current_order_item.quantity += how_many_more
        @current_order_item.save
		 else
		 	@new_order = order_has_meals.create(meal_id: meal_params[:id],
		 								 quantity: how_many_more, price: meal_params[:price],
		 								 order_id: self.id )
		 end
		 @new_order
  end

  def change_status(status_number)
    self.status = status_number
  end

  def connect_to_user()
    self.user_id = current_user[:id]
  end

  private
3
  def price_sum
    self[:price] = self.order_has_meals.map{|meal| meal.valid ? meal.quantity*meal.price : 0}.sum
  end
end

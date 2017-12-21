class HomeController < ApplicationController
	attr_accessor :cart_item

  def index
  	@categories = MealCategory.all
  	@meals = Meal.all
  	@order_has_meal = OrderHasMeal.new
  end

end

class HomeController < ApplicationController
	attr_accessor :order_has_meal

  def index
  	@categories = MealCategory.all
  	@meals = Meal.all
  	@order = set_current_order
  end

end

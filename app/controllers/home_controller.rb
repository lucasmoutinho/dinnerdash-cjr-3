class HomeController < ApplicationController
	attr_accessor :cart_item

  def index
  	@categories = MealCategory.all
  	@meals = Meal.all
  	@cart_item = CartItem.new
  end

end

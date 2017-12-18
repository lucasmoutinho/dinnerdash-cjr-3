class HomeController < ApplicationController
  def index
  	@categories = MealCategory.all
  	@meals = Meal.all
  end
end

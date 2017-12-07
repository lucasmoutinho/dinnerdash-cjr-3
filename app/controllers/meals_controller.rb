class MealsController < ApplicationController
	def index
	  @meals = Meal.all
  	end	


	def show
   		@meal = meal.find(params[:id])
  	end


	def new
		 @meal = Meal.new
	end

	def create
	  @meal = Meal.new(meal_params)
	 
	  @meal.save
	  redirect_to @meal
	end
 
private
  def meal_params
    params.require(:meal).permit(:title, :description, :price, :category)
  end
end

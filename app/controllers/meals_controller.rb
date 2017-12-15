class MealsController < ApplicationController
	def index
	  @meals = Meal.all
  	end	


	def show
   		@meal =  Meal.find(params[:id])
  	end


	def new
		@meal = Meal.new
	end

	def create
	  	@meal_category = MealCategory.find(params[:meal_category_id])

		@meal = @meal_category.meals.create(meal_params)
		if @meal.save
			redirect_to meal_categories_path, notice: "Refeição cadastrada com sucesso!!"
		else
			redirect_to new_meal_path, notice: "Refeição Não pode ser salva"
		end
	end

		def destroy
		@meal_category = MealCategory.find(params[:meal_category_id])
		@meal = @meal_category.meals.find(params[:id])
		@meal.delete

		redirect_to meal_category_path, notice: "Refeição foi apagada"
	end

	def edit
		@meal = Meal.find(params[:id])
	end


	def update
	  @meal = Meal.find(params[:id])
	 
	  if @meal.update(meal_params)
	    redirect_to @meal
	  else
	    render 'edit'
	  end
	end
 
private
  def meal_params
    params.require(:meal).permit(:title, :description, :price)
  end
end
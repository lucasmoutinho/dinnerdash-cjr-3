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
	  	puts "vim ate o create!!!!"

		@meal = Meal.new(meal_params)
		if @meal.save
			redirect_to meals_path, notice: "Refeição cadastrada com sucesso!!"
		else
			redirect_to new_meal_path, notice: "Refeição Não pode ser salvo!"
		end
	end

		def destroy
		@meal = Meal.find(params[:id])
		@meal.delete

		redirect_to meals_path, notice: "Refeição foi apagada"
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
    params.require(:meal).permit(:title, :description, :price, :category)
  end
end
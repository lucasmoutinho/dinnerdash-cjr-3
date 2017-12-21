class MealCategoriesController < ApplicationController
	before_action :authenticate_user!
	before_action :require_admin


	def require_admin
  		unless current_user.try(:admin?)
			redirect_to root_path, alert: "Você não tem autorização para acessar isso."
  		end
	end
	
	def index
		
	  @meal_categories = MealCategory.all
  	end	


	def show
   		@meal_category =  MealCategory.find(params[:id])
  	end


	def new
		@meal_category = MealCategory.new
	end

	def create
	  	puts "vim ate o create!!!!"

		@meal_category = MealCategory.new(meal_category_params)
		if @meal_category.save
			redirect_to meal_categories_path, notice: "Categoria cadastrada com sucesso."
		else
			redirect_to new_meal_categories_path, notice: "Categoria não pode ser salva"
		end
	end

	def destroy
		@meal_category = MealCategory.find(params[:id])
		@meal_category.delete

		redirect_to meal_categories_path, notice: "Categoria foi apagada."
	end

	def edit
		@meal_category = MealCategory.find(params[:id])
	end


	def update
	  @meal_category = MealCategory.find(params[:id])
	 
	  if @meal_category.update(meal_category_params)
	    redirect_to  meal_categories_path, notice: "Categoria foi editada."
	  else
	    render 'edit'
	  end
	end
 
private
  def meal_category_params
    params.require(:meal_category).permit(:name)
  end
end

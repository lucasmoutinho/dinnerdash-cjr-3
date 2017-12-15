class MealsController < ApplicationController
	before_action :authenticate_user!
	before_action :require_admin


	def require_admin
  		unless current_user.try(:admin?)
			redirect_to root_path, alert: "Você não tem autorização para acessar isso."
  		end
	end

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
			if params[:picture].present?
	  			preloaded = Cloudinary::PreloadedFile.new(params[:picture])         
	  			raise "Invalid upload signature" if !preloaded.valid?
	  			@meal.picture = preloaded.identifier
			end
			redirect_to meals_path, notice: "Refeição cadastrada com sucesso!!"
		else
			redirect_to new_meal_path, notice: "Refeição Não pode ser salva"
		end
	end

	def destroy
		@meal = Meal.find(params[:id])
		@meal.destroy

		redirect_to meals_path, notice: "Refeição foi apagada"
	end

	def edit
		@meal = Meal.find(params[:id])
		@meal_category = @meal.meal_category
	end


	def update
	  @meal = Meal.find(params[:id])
	  @meal_category = @meal.meal_category

	  if @meal.update(meal_params)
	    redirect_to meals_path
	  else
	    render 'edit'
	  end
	end
 
private
  def meal_params
    params.require(:meal).permit(:title, :description, :price, :picture)
  end
end
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
<<<<<<< HEAD
=======
	  	@meal_category = MealCategory.find(params[:meal_category_id])
>>>>>>> origin/Developing_9-10-11

		@meal = @meal_category.meals.create(meal_params)
		if @meal.save
<<<<<<< HEAD
			if params[:picture].present?
	  	puts "vim ate o save!!!!"
	  			preloaded = Cloudinary::PreloadedFile.new(params[:picture])         
	  			raise "Invalid upload signature" if !preloaded.valid?
	  			@meal.picture = preloaded.identifier
			end
			redirect_to meals_path, notice: "Refeição cadastrada com sucesso!!"
=======
			redirect_to meal_category_path(@meal_category), notice: "Refeição cadastrada com sucesso!!"
>>>>>>> origin/Developing_9-10-11
		else
			redirect_to new_meal_path, notice: "Refeição Não pode ser salva"
		end
	end

		def destroy
		@meal_category = MealCategory.find(params[:meal_category_id])
		@meal = @meal_category.meals.find(params[:id])
		@meal.destroy

		redirect_to meal_category_path(@meal_category), notice: "Refeição foi apagada"
	end

	def edit
		@meal_category = MealCategory.find(params[:meal_category_id])
	 	@meal = @meal_category.meals.find(params[:id])
	end


	def update
	  @meal_category = MealCategory.find(params[:meal_category_id])
	  @meal = @meal_category.meals.find(params[:id])
	 
	  if @meal.update(meal_params)
	    redirect_to meal_category_path(@meal_category)
	  else
	    render 'edit'
	  end
	end
 
private
  def meal_params
<<<<<<< HEAD
    params.require(:meal).permit(:title, :description, :price, :category, :picture)
=======
    params.require(:meal).permit(:title, :description, :price)
>>>>>>> origin/Developing_9-10-11
  end
end
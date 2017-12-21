class OrderHasMealsController < ApplicationController
	before_action :set_current_cart

	def create
		@cart.add_meal(params)

		if @cart.save
			redirect_to root_path
		else 
			flash[:error] = 'There was a problem adding this item to your cart'
			redirect_to root_path
		end
	end

	def destroy
		@order_has_meal.destroy
		redirect_to cart_path
	end
	
	# def create
	#     @cart = set_cart
	#     @@order_has_meal = @cart.OrderHasMeals.new(cart_item_params)
	#     @cart.save
	#     session[:cart_id] = @cart.id
	#   end

	#   def update
	#     @cart = set_cart
	#     @@order_has_meal = @cart.OrderHasMeals.find(params[:id])
	#     @@order_has_meal.update_attributes(cart_item_params)
	#     @OrderHasMeals = @cart.OrderHasMeals
	#   end

	#   def destroy
	#     @cart = set_cart
	#     @@order_has_meal = @cart.OrderHasMeals.find(params[:id])
	#     @@order_has_meal.destroy
	#     @OrderHasMeals = @cart.OrderHasMeals
	#   end

	private
		def set_cart_item
			@order_has_meal = OrderHasMeal.find(params[:id])
		end

		def cart_item_params
			params.require(:order_has_meal).permit(:meal_id, :cart_id, :price, :quantity)
		end	


end

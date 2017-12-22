class OrderHasMealsController < ApplicationController
	before_action :set_current_order

	def destroy
		@order_has_meal.destroy
		redirect_to order_path
	end
	
	def update
		@order_has_meal = OrderHasMeal.find_by(meal_id: @meal_id, order_id: @order_id)
		@order_has_meal.quantity = :quantity
		if @order_has_meal.save
			redirect_to home_path
		else
			redirect_to home_path, notice: "Não foi possível adicionar ao prato"
		end
	end
	
	# def create
	#     @order = set_order
	#     @@order_has_meal = @order.OrderHasMeals.new(order_item_params)
	#     @order.save
	#     session[:order_id] = @order.id
	#   end

	#   def update
	#     @order = set_order
	#     @@order_has_meal = @order.OrderHasMeals.find(params[:id])
	#     @@order_has_meal.update_attributes(order_item_params)
	#     @OrderHasMeals = @order.OrderHasMeals
	#   end

	#   def destroy
	#     @order = set_order
	#     @@order_has_meal = @order.OrderHasMeals.find(params[:id])
	#     @@order_has_meal.destroy
	#     @OrderHasMeals = @order.OrderHasMeals
	#   end

	private
		def set_order_item
			@order_has_meal = OrderHasMeal.find(params[:id])
		end

		def order_item_params
			params.require(:order_has_meal).permit(:meal_id, :order_id, :price, :quantity)
		end	


end

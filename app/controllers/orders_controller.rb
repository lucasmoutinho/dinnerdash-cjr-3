class OrdersController < ApplicationController

	def index
		@orders = Order.all
	end

	def edit
		@order = Order.find(params[:id])
	end

	def update
	  @order = Order.find(params[:id])
	 
	  if @order.update(order_params)
	    redirect_to orders_path
	  else
	    redirect_to orders_path, notice: "Pedido não pode ser editado"
	  end
	end

	def show
    	@order_items = Order.order_has_meals
	end

	def destroy
		@order = Order.find(params[:id])
		@order.delete

		redirect_to meal_categories_path, notice: "Pedido foi apagada."
	end

	private
  		def order_params
    		params.require(:order).permit(:status)
  		end



end

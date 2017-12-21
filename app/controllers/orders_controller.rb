class OrdersController < ApplicationController
	def show
    	@order_items = Order.order_has_meals
	end



end

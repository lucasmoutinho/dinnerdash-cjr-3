class OrdersController < ApplicationController
	def show
    	@order_items = order.order_has_meals
 	end
end

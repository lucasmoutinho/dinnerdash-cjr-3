class CartItemsController < ApplicationController
	before_action :set_cart, only: [:create, :destroy]

	def create
		@cart.add_meal(params)

		if @cart.save
			redirect_to home_path
		else 
			flash[:error] = 'There was a problem adding this item to your cart'
			redirect_to home_path
		end
	end

	def destroy
		@cart_item.destroy
		redirect_to cart_path
	end
	
	# def create
	#     @cart = set_cart
	#     @cart_item = @cart.cart_items.new(cart_item_params)
	#     @cart.save
	#     session[:cart_id] = @cart.id
	#   end

	#   def update
	#     @cart = set_cart
	#     @cart_item = @cart.cart_items.find(params[:id])
	#     @cart_item.update_attributes(cart_item_params)
	#     @cart_items = @cart.cart_items
	#   end

	#   def destroy
	#     @cart = set_cart
	#     @cart_item = @cart.cart_items.find(params[:id])
	#     @cart_item.destroy
	#     @cart_items = @cart.cart_items
	#   end

	private
		def set_cart_item
			@cart_item = CartItem.find(params[:id])
		end

		def cart_item_params
			params.require(:cart_item).permit(:meal_id, :cart_id, :quantity)
		end	


end

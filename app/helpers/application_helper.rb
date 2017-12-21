module ApplicationHelper
	def current_cart
		Cart.find(session[:current_cart])
	rescue ActiveRecord::RecordNotFound
		render text: "Carrinho não existe."
	end
end

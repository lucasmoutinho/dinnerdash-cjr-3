module ApplicationHelper
	def current_cart
		Order.find(session[:current_cart])
	rescue ActiveRecord::RecordNotFound
		render text: "Carrinho não existe."
	end
end

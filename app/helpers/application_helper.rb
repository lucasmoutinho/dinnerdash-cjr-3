module ApplicationHelper
	def current_order
		Order.find(session[:current_order])
	rescue ActiveRecord::RecordNotFound
		render text: "Pedido não existe."
	end
end

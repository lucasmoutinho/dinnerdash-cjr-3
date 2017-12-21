class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_order

#adicionado seguindo o howto na wiki do deviser sobre username/email
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_current_order
    if @_current_order ||= session[:current_order_id] &&
       Order.find(session[:current_order_id])
      @_current_order
    else
      @_current_order = Order.new
    end
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :admin, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

end
